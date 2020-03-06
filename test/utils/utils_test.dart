/*
  privacyIDEA Authenticator

  Authors: Timo Sturm <timo.sturm@netknights.it>

  Copyright (c) 2017-2019 NetKnights GmbH

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:privacyidea_authenticator/model/tokens.dart';
import 'package:privacyidea_authenticator/utils/identifiers.dart';
import 'package:privacyidea_authenticator/utils/utils.dart';

void main() {
  _testDecodeSecretToUint8();
  _testCalculateHotpValue();
  _testInsertCharAt();
  _testParseQRCodeToToken();
  _testParse2StepSaltURIs();
}

void _testInsertCharAt() {
  final String str = "ABCD";

  group("insertCharAt", () {
    test("Insert at start", () => expect("XABCD", insertCharAt(str, "X", 0)));

    test("Insert at end",
        () => expect("ABCDX", insertCharAt(str, "X", str.length)));

    test("Insert at end", () => expect("ABXCD", insertCharAt(str, "X", 2)));
  });
}

void _testCalculateHotpValue() {
  group("Calculate hotp values", () {
    group("different couters 6 digits", () {
      // We need to use different tokens here, because simply incrementing the
      // counter between all method calls leads to a race condition
      HOTPToken token0 = HOTPToken(
          null, null, Algorithms.SHA1, 6, utf8.encode("secret"),
          counter: 0);
      HOTPToken token1 = HOTPToken(
          null, null, Algorithms.SHA1, 6, utf8.encode("secret"),
          counter: 1);
      HOTPToken token2 = HOTPToken(
          null, null, Algorithms.SHA1, 6, utf8.encode("secret"),
          counter: 2);
      HOTPToken token8 = HOTPToken(
          null, null, Algorithms.SHA1, 6, utf8.encode("secret"),
          counter: 8);

      test("OTP for counter == 0",
          () => expect(calculateHotpValue(token0), "814628"));

      test("OTP for counter == 1",
          () => expect(calculateHotpValue(token1), "533881"));

      test("OTP for counter == 2",
          () => expect(calculateHotpValue(token2), "720111"));

      test("OTP for counter == 8",
          () => expect(calculateHotpValue(token8), "963685"));
    });

    group("different couters 8 digits", () {
      // We need to use different tokens here, because simply incrementing the
      // counter between all method calls leads to a race condition
      HOTPToken token0 = HOTPToken(
          null, null, Algorithms.SHA1, 8, utf8.encode("secret"),
          counter: 0);
      HOTPToken token1 = HOTPToken(
          null, null, Algorithms.SHA1, 8, utf8.encode("secret"),
          counter: 1);
      HOTPToken token2 = HOTPToken(
          null, null, Algorithms.SHA1, 8, utf8.encode("secret"),
          counter: 2);
      HOTPToken token8 = HOTPToken(
          null, null, Algorithms.SHA1, 8, utf8.encode("secret"),
          counter: 8);

      test("OTP for counter == 0",
          () => expect(calculateHotpValue(token0), "31814628"));

      test("OTP for counter == 1",
          () => expect(calculateHotpValue(token1), "28533881"));

      test("OTP for counter == 2",
          () => expect(calculateHotpValue(token2), "31720111"));

      test("OTP for counter == 8",
          () => expect(calculateHotpValue(token8), "15963685"));
    });

    group("different algorithms 6 digits", () {
      // We need to use different tokens here, because simply incrementing the
      // counter between all method calls leads to a race condition
      HOTPToken token0 = HOTPToken(
          null, null, Algorithms.SHA1, 6, utf8.encode("Secret"),
          counter: 0);
      HOTPToken token1 = HOTPToken(
          null, null, Algorithms.SHA256, 6, utf8.encode("Secret"),
          counter: 0);
      HOTPToken token2 = HOTPToken(
          null, null, Algorithms.SHA512, 6, utf8.encode("Secret"),
          counter: 0);

      test("OTP for sha1",
          () => expect(calculateHotpValue(token0), "292574"));

      test("OTP for sha256",
          () => expect(calculateHotpValue(token1), "203782"));

      test("OTP for sha512",
          () => expect(calculateHotpValue(token2), "636350"));
    });

    group("different algorithms 8 digits", () {
      // We need to use different tokens here, because simply incrementing the
      // counter between all method calls leads to a race condition
      HOTPToken token0 = HOTPToken(
          null, null, Algorithms.SHA1, 8, utf8.encode("Secret"),
          counter: 0);
      HOTPToken token1 = HOTPToken(
          null, null, Algorithms.SHA256, 8, utf8.encode("Secret"),
          counter: 0);
      HOTPToken token2 = HOTPToken(
          null, null, Algorithms.SHA512, 8, utf8.encode("Secret"),
          counter: 0);

      test("OTP for sha1",
          () => expect(calculateHotpValue(token0), "25292574"));

      test("OTP for sha256",
          () => expect(calculateHotpValue(token1), "25203782"));

      test("OTP for sha512",
          () => expect(calculateHotpValue(token2), "99636350"));
    });
  });
}

// TODO test getting right return values
void _testDecodeSecretToUint8() {
  group("decodeSecretToUint8", () {
    test("Check null as secret", () {
      expect(() => decodeSecretToUint8(null, Encodings.none),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Check null as encoding", () {
      expect(() => decodeSecretToUint8("mySecre", null),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test non hex secret", () {
      expect(() => decodeSecretToUint8("oo", Encodings.hex),
          throwsA(TypeMatcher<FormatException>()));
    });

    test("Test non hex secret", () {
      expect(() => decodeSecretToUint8("1Aö", Encodings.hex),
          throwsA(TypeMatcher<FormatException>()));
    });

    test("Test non base32 secret", () {
      expect(() => decodeSecretToUint8("p", Encodings.base32),
          throwsA(TypeMatcher<FormatException>()));
    });

    test("Test non base32 secret", () {
      expect(() => decodeSecretToUint8("AAAAAAöA", Encodings.base32),
          throwsA(TypeMatcher<FormatException>()));
    });
  });
}

void _testParseQRCodeToToken() {
  group("parseQRCodeToToken", () {
    test("Test with wrong uri schema", () {
      expect(
          () => parseQRCodeToMap(
              "http://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test with unknown type", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://asdf/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test with missing type", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth:///ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    // It may be better if we just deal with not having a label.
//    test("Test with missing label", () {
//      expect(
//          () => parseQRCodeToToken(
//              "otpauth://totp/?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA256&digits=8&counter=5"),
//          throwsA(TypeMatcher<ArgumentError>()));
//    });

    test("Test missing algorithm", () {
      Map<String, dynamic> map = parseQRCodeToMap(
          "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&digits=6&period=30");
      expect(map[URI_ALGORITHM], "SHA1"); // This is the default value
    });

    test("Test unknown algorithm", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=BubbleSort&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test missing digits", () {
      Map<String, dynamic> map = parseQRCodeToMap(
          "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&period=30");
      expect(map[URI_DIGITS], 6); // This is the default value
    });

    // At least the library used to calculate otp values does not support other number of digits.
    test("Test invalid number of digits", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=66&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test invalid characters for digits", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=aA&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test missing secret", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?issuer=ACME%20Co&algorithm=SHA1&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test invalid secret", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?secret=ÖÖ&issuer=ACME%20Co&algorithm=SHA1&digits=6&period=30"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    // TOTP specific
    test("Test missing period", () {
      Map<String, dynamic> map = parseQRCodeToMap(
          "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=6");
      expect(map[URI_PERIOD], 30);
    });

    test("Test invalid characters for period", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://totp/ACME%20Co:john@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA1&digits=6&period=aa"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test valid totp uri", () {
      Map<String, dynamic> map = parseQRCodeToMap(
          "otpauth://totp/Kitchen?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA512&digits=8&period=60");
      expect(map[URI_LABEL], "Kitchen");
      expect(map[URI_ALGORITHM], "SHA512");
      expect(map[URI_DIGITS], 8);
      expect(
          map[URI_SECRET],
          decodeSecretToUint8(
              "HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ", Encodings.base32));
      expect(map[URI_PERIOD], 60);
    });

    // HOTP specific
    test("Test with missing counter", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://hotp/Kitchen?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA256&digits=8"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test with invalid counter", () {
      expect(
          () => parseQRCodeToMap(
              "otpauth://hotp/Kitchen?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA256&digits=8&counter=aa"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test("Test valid hotp uri", () {
      Map<String, dynamic> map = parseQRCodeToMap(
          "otpauth://hotp/Kitchen?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co&algorithm=SHA256&digits=8&counter=5");
      expect(map[URI_LABEL], "Kitchen");
      expect(map[URI_ALGORITHM], "SHA256");
      expect(map[URI_DIGITS], 8);
      expect(
          map[URI_SECRET],
          decodeSecretToUint8(
              "HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ", Encodings.base32));
      expect(map[URI_COUNTER], 5);
    });
  });
}

void _testParse2StepSaltURIs() {
  group("Parse 2 step rollout uris", () {
    test("Test valid and complete uri", () {
      Map<String, dynamic> map = parseQRCodeToMap("otpauth://hotp/OATH0005CCCB?"
          "secret=2X7CTS3JWS4OVYIRHM4FKWEOW6TCJP6A&counter=1&digits=6"
          "&issuer=privacyIDEA&2step_salt=8"
          "&2step_output=20&2step_difficulty=10000");
      expect(map[URI_LABEL], "OATH0005CCCB");
      expect(map[URI_COUNTER], 1);
      expect(map[URI_DIGITS], 6);
      expect(map[URI_SALT_LENGTH], 8);
      expect(map[URI_OUTPUT_LENGTH_IN_BYTES], 20);
      expect(map[URI_ITERATIONS], 10000);
    });

    test("Test default output length", () {
      Map<String, dynamic> map = parseQRCodeToMap("otpauth://hotp/OATH0005CCCB?"
          "secret=2X7CTS3JWS4OVYIRHM4FKWEOW6TCJP6A&counter=1&digits=6"
          "&issuer=privacyIDEA&2step_salt=8"
          "&2step_difficulty=10000");
      expect(map[URI_LABEL], "OATH0005CCCB");
      expect(map[URI_COUNTER], 1);
      expect(map[URI_DIGITS], 6);
      expect(map[URI_SALT_LENGTH], 8);
      expect(map[URI_OUTPUT_LENGTH_IN_BYTES], 20);
      expect(map[URI_ITERATIONS], 10000);
    });

    test("Test default iterations", () {
      Map<String, dynamic> map = parseQRCodeToMap("otpauth://hotp/OATH0005CCCB?"
          "secret=2X7CTS3JWS4OVYIRHM4FKWEOW6TCJP6A&counter=1&digits=6"
          "&issuer=privacyIDEA&2step_salt=8"
          "&2step_output=20");
      expect(map[URI_LABEL], "OATH0005CCCB");
      expect(map[URI_COUNTER], 1);
      expect(map[URI_DIGITS], 6);
      expect(map[URI_SALT_LENGTH], 8);
      expect(map[URI_OUTPUT_LENGTH_IN_BYTES], 20);
      expect(map[URI_ITERATIONS], 10000);
    });

    test("Test default salt length", () {
      Map<String, dynamic> map = parseQRCodeToMap("otpauth://hotp/OATH0005CCCB?"
          "secret=2X7CTS3JWS4OVYIRHM4FKWEOW6TCJP6A&counter=1&digits=6"
          "&issuer=privacyIDEA"
          "&2step_output=20&2step_difficulty=10000");
      expect(map[URI_LABEL], "OATH0005CCCB");
      expect(map[URI_COUNTER], 1);
      expect(map[URI_DIGITS], 6);
      expect(map[URI_SALT_LENGTH], 10);
      expect(map[URI_OUTPUT_LENGTH_IN_BYTES], 20);
      expect(map[URI_ITERATIONS], 10000);
    });

    test("Test only salt length", () {
      Map<String, dynamic> map = parseQRCodeToMap("otpauth://hotp/OATH0005CCCB?"
          "secret=2X7CTS3JWS4OVYIRHM4FKWEOW6TCJP6A&counter=1&digits=6"
          "&issuer=privacyIDEA&2step_salt=8");
      expect(map[URI_LABEL], "OATH0005CCCB");
      expect(map[URI_COUNTER], 1);
      expect(map[URI_DIGITS], 6);
      expect(map[URI_SALT_LENGTH], 8);
      expect(map[URI_OUTPUT_LENGTH_IN_BYTES], 20);
      expect(map[URI_ITERATIONS], 10000);
    });
  });
}
