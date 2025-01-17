// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  static String m0(name) => "Jesteś pewien, że chcesz usunąć token: ${name}?";

  static String m1(name) => "Wdrażanie tokenu ${name} nieudane.";

  static String m2(name) => "Brak połączenia z serwerem";

  static String m3(e) =>
      "Napotkano nieznany błąd. Wdrożenie tokenu niemożliwe: ${e}";

  static String m4(name) => "Token ${name} wygasł.";

  static String m5(name) =>
      "Wystąpił błąd podczas odpytywania o wyzwania ${name}";

  static String m6(serial) => "Zapytanie dla ${serial} nie powiodło się.";

  static String m7(issuer, account) =>
      "Wysłane przez ${issuer} dla twojego konta: \"${account}\"";

  static String m8(statusCode) => "Kod statusu: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Potwierdzam"),
        "addSystemInfo":
            MessageLookupByLibrary.simpleMessage("Dodaj informacje systemowe"),
        "addToken": MessageLookupByLibrary.simpleMessage("Dodaj token"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Wszystkie tokeny są zsynchronizowane."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "To działanie wymaga skonfigurowania ustawień zabezpieczeń albo uwierzytelniania biometrycznego."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Skonfigurowane ustawienia zabezpieczeń albo uwierzytelnianie biometryczne jest wymagane."),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnij, aby zaakceptować żądanie push."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnij, aby odrzucić żądanie push."),
        "authenticateToShowOtp": MessageLookupByLibrary.simpleMessage(
            "Zweryfikuj tożsamość, by pokazać hasło jednorazowe."),
        "authenticateToUnLockToken": MessageLookupByLibrary.simpleMessage(
            "Zweryfikuj tożsamość, aby odblokować / zablokować token."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Żądanie uwierzytelnienia"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Wymagana autentykacja"),
        "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
            "Nie rozpoznano. Spróbuj ponownie."),
        "biometricRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnianie biometryczne nie jest skonfigurowane."),
        "biometricSuccess": MessageLookupByLibrary.simpleMessage(
            "Autentykacja zakończona sukcesem!"),
        "butDiscardIt": MessageLookupByLibrary.simpleMessage("ale odrzucić go"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Sprawdź połączenie sieciowe i spróbuj ponownie."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Usuń"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Potwierdź usunięcie"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "Usunięcie tego tokenu może uniemożliwić zalogowanie się. Upewnij się, że możesz zalogować się na powiązane konto bez tego tokenu."),
        "connectionFailed": MessageLookupByLibrary.simpleMessage(
            "Połączenie nie powiodło się."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "Nie można podpisać wiadomości."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Ciemny"),
        "decline": MessageLookupByLibrary.simpleMessage("Odrzucam"),
        "declineIt": MessageLookupByLibrary.simpleMessage("odrzuć go"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Usuń"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Ponów próbę"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Wyślij błąd"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Niestety, aplikacja nie była w stanie odszyfrować tokenów. Oznacza to, że klucz szyfrowania jest uszkodzony. Możesz spróbować ponownie lub usunąć dane aplikacji, co spowoduje usunięcie tokenów w aplikacji."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Czy na pewno chcesz usunąć dane aplikacji?"),
        "delete": MessageLookupByLibrary.simpleMessage("Usuń"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnij, aby usunąć zablokowany token."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Ustawienia zabezpieczeń urządzenia nie zostały skonfigurowane."),
        "deviceCredentialsSetupDescription": MessageLookupByLibrary.simpleMessage(
            "Skonfiguruj ustawienia zabezpieczeń w ustawieniach urządzenia."),
        "dismiss": MessageLookupByLibrary.simpleMessage("Odrzuć"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Aby edytować zablokowany token, należy się uwierzytelnić."),
        "enablePolling": MessageLookupByLibrary.simpleMessage(
            "Włącz autentykację przez wiadomość push."),
        "errorLogCleared": MessageLookupByLibrary.simpleMessage(
            "Dziennik błędów wyczyszczony."),
        "errorLogEmpty":
            MessageLookupByLibrary.simpleMessage("Dziennik błędów jest pusty"),
        "errorLogTitle":
            MessageLookupByLibrary.simpleMessage("Dziennik błędów"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Plik dziennika błędów jest dołączony.\nTekst ten można zastąpić dodatkowymi informacjami o błędzie."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Wstać z łóżka tego tokena nie jest już możliwe."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "Uścisk dłoni SSL nie powiódł się. Rozwijanie nie jest możliwe."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Synchronizacja tokenów push nieudana, ponieważ serwer eduMFA jest nieosiągalny."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "feedback": MessageLookupByLibrary.simpleMessage("Informacje zwrotne"),
        "feedbackDescription": MessageLookupByLibrary.simpleMessage(
            "Jeśli masz jakieś pytania, sugestie lub problemy, daj nam znać."),
        "feedbackHint": MessageLookupByLibrary.simpleMessage(
            "Otworzy się gotowa wiadomość e-mail, którą możesz do nas wysłać. W razie potrzeby dodane zostaną informacje o urządzeniu i wersji aplikacji. Możesz sprawdzić i edytować wiadomość e-mail przed jej wysłaniem."),
        "feedbackPrivacyPolicy1": MessageLookupByLibrary.simpleMessage(
            "Wysyłając opinię, zgadzasz się z naszą "),
        "feedbackPrivacyPolicy2":
            MessageLookupByLibrary.simpleMessage("polityką prywatności"),
        "feedbackPrivacyPolicy3": MessageLookupByLibrary.simpleMessage("."),
        "feedbackSentDescription": MessageLookupByLibrary.simpleMessage(
            "Dziękujemy bardzo za pomoc w ulepszeniu tej aplikacji!"),
        "feedbackSentTitle":
            MessageLookupByLibrary.simpleMessage("Opinia została wysłana"),
        "feedbackTitle": MessageLookupByLibrary.simpleMessage(
            "Twoja opinia jest zawsze mile widziana!"),
        "generatingPhonePart": MessageLookupByLibrary.simpleMessage(
            "Generowanie sekretu po stronie telefonu..."),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Generowanie pary kluczy RSA"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Generowanie pary kluczy RSA nieudane"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Idź do ustawień"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Ustawienia zabezpieczeń, bądź uwierzytelnianie biometryczne nie są skonfigurowane w twoim urządzeniu. Skonfiguruj je w ustawieniach urządzenia."),
        "introEditToken": MessageLookupByLibrary.simpleMessage(
            "Tutaj możesz edytować nazwę tokena i zobaczyć kilka szczegółów."),
        "introLockToken": MessageLookupByLibrary.simpleMessage(
            "Aby jeszcze bardziej zwiększyć bezpieczeństwo, możesz zablokować tokeny. Wtedy token może być używany tylko po uwierzytelnieniu."),
        "introPollForChallenges": MessageLookupByLibrary.simpleMessage(
            "Możesz sprawdzić nowe wyzwania, przeciągając listę tokenów w dół."),
        "introScanQrCode": MessageLookupByLibrary.simpleMessage(
            "Możesz skanować kody QR, aby dodawać tokeny. Obsługujemy każdy popularny token uwierzytelniania dwuskładnikowego, a także tokeny eduMFA."),
        "language": MessageLookupByLibrary.simpleMessage("Język"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licencje i wersja"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Jasny"),
        "lock": MessageLookupByLibrary.simpleMessage("Zablokuj"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnianie biometryczne jest wyłączone. Zablokuj i odblokuj ponownie ekran, żeby je włączyć."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Menu dziennika"),
        "name": MessageLookupByLibrary.simpleMessage("Nazwa"),
        "no": MessageLookupByLibrary.simpleMessage("Nie"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "Na tym urządzeniu nie zainstalowano ani nie zainicjowano aplikacji poczty e-mail, spróbuj ponownie, gdy będziesz w stanie wysłać wiadomość e-mail"),
        "noMailAppTitle": MessageLookupByLibrary.simpleMessage(
            "Nie znaleziono aplikacji pocztowej"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Brak połączenia sieciowego."),
        "noResultText1": MessageLookupByLibrary.simpleMessage("Dotknij "),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage(" przycisku, żeby zacząć!"),
        "noResultTitle": MessageLookupByLibrary.simpleMessage(
            "Nie zainstalowano jeszcze żadnego tokenu."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Uwierzytelnianie dwuskładnikowe\nuczynione prostym"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Przechowuj tokeny w swoim urządzeniu\nzabezpieczone biometrycznie"),
        "onBoardingText3": MessageLookupByLibrary.simpleMessage(
            "Ta aplikacja jest w open source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Maksymalne Bezpieczeństwo"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Odwiedź nas na Github"),
        "open": MessageLookupByLibrary.simpleMessage("Otwórz"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Analizowanie odpowiedzi"),
        "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
            "Analizowanie odpowiedzi nieudane"),
        "phonePart":
            MessageLookupByLibrary.simpleMessage("Sekret po stronie telefonu:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Zapytanie nie powiodło się."),
        "pollingFailedFor": m6,
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Polityka prywatności"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "Żądanie push nie mogło zostać przetworzone."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push token"),
        "rename": MessageLookupByLibrary.simpleMessage("Zmień nazwę"),
        "renameToken":
            MessageLookupByLibrary.simpleMessage("Zmień nazwę tokenu"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Wysyłaj zapytanie o push challenge cyklicznie. Włącz, jeśli push nie przychodzi normalnie."),
        "requestTriggerdByUserQuestion": MessageLookupByLibrary.simpleMessage(
            "Czy ta prośba została wywołana przez Ciebie?"),
        "retryRollout":
            MessageLookupByLibrary.simpleMessage("Ponowne uruchomienie"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Wdrażanie"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Wdrożenie zakończone"),
        "scanQrCode": MessageLookupByLibrary.simpleMessage("Zeskanuj kod QR"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Tajny klucz"),
        "send": MessageLookupByLibrary.simpleMessage("Wyślij"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Tworzona jest gotowa wiadomość e-mail zawierająca informacje o aplikacji, błędzie i urządzeniu.\nMożesz edytować wiadomość e-mail przed jej wysłaniem.\nTutaj można zobaczyć, w jaki sposób wykorzystujemy te informacje:"),
        "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
            "Wysyłanie publicznego klucza RSA"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Wysyłanie publicznego klucza RSA nieudane"),
        "settings": MessageLookupByLibrary.simpleMessage("Ustawienia"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Informacje ogólne"),
        "showDetails": MessageLookupByLibrary.simpleMessage("Pokaż szczegóły"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Wyświetl"),
        "showPrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Pokaż politykę prywatności"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Wymagana autentykacja"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Synchronizuj"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "Synchronizacja dla poniższych tokenów się nie udała, spróbuj ponownie:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchronizuj tokeny push."),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchronizuje tokeny push z serwerem eduMFA."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Synchronizacja tokenów."),
        "systemTheme": MessageLookupByLibrary.simpleMessage("Motyw systemu"),
        "theme": MessageLookupByLibrary.simpleMessage("Motyw"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Następujące tokeny nie wspierają synchronizacji i muszą zostać wdrożone od nowa:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Wystąpił nieoczekiwany błąd."),
        "unlock": MessageLookupByLibrary.simpleMessage("Odblokuj"),
        "useDeviceLocaleDescription": MessageLookupByLibrary.simpleMessage(
            "Użyj języka urządzenia, jeśli jest wspierany. W innym wypadku zostanie ustawiony domyślny język angielski."),
        "useDeviceLocaleTitle":
            MessageLookupByLibrary.simpleMessage("Użyj języka urządzenia."),
        "verboseLogging":
            MessageLookupByLibrary.simpleMessage("Wyczerpujące rejestrowanie"),
        "yes": MessageLookupByLibrary.simpleMessage("Tak")
      };
}
