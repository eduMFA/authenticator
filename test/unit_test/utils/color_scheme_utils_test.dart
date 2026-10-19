import 'package:edumfa_authenticator/utils/color_scheme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' as material_ui;

void main() {
  for (final brightness in Brightness.values) {
    test(
      'preserves the $brightness platform palette and newer color roles',
      () {
        final dynamicScheme =
            material_ui.ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: brightness,
            ).copyWith(
              primary: const Color(0xff123456),
              secondary: const Color(0xff234567),
              tertiary: const Color(0xff345678),
              error: const Color(0xff456789),
              surfaceContainer: const Color(0xff56789a),
              surfaceContainerHighest: const Color(0xff6789ab),
              primaryFixed: const Color(0xff789abc),
              secondaryFixedDim: const Color(0xff89abcd),
              tertiaryFixed: const Color(0xff9abcde),
            );

        final scheme = dynamicScheme.toFlutterColorScheme();

        expect(scheme.brightness, brightness);
        expect(scheme.primary, const Color(0xff123456));
        expect(scheme.secondary, const Color(0xff234567));
        expect(scheme.tertiary, const Color(0xff345678));
        expect(scheme.error, const Color(0xff456789));
        expect(scheme.surfaceContainer, const Color(0xff56789a));
        expect(scheme.surfaceContainerHighest, const Color(0xff6789ab));
        expect(scheme.primaryFixed, const Color(0xff789abc));
        expect(scheme.secondaryFixedDim, const Color(0xff89abcd));
        expect(scheme.tertiaryFixed, const Color(0xff9abcde));
      },
    );
  }
}
