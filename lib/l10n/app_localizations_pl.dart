import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get accept => 'Potwierdzam';

  @override
  String get decline => 'Odrzucam';

  @override
  String get name => 'Nazwa';

  @override
  String get secretKey => 'Tajny klucz';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get cancel => 'Anuluj';

  @override
  String get delete => 'Usuń';

  @override
  String get dismiss => 'Odrzuć';

  @override
  String get addToken => 'Dodaj token';

  @override
  String get scanQrCode => 'Zeskanuj kod QR';

  @override
  String get renameToken => 'Zmień nazwę tokenu';

  @override
  String get confirmDeletion => 'Potwierdź usunięcie';

  @override
  String confirmDeletionOf(Object name) {
    return 'Jesteś pewien, że chcesz usunąć token: $name?';
  }

  @override
  String get confirmTokenDeletionHint => 'Usunięcie tego tokenu może uniemożliwić zalogowanie się. Upewnij się, że możesz zalogować się na powiązane konto bez tego tokenu.';

  @override
  String get generatingPhonePart => 'Generowanie sekretu po stronie telefonu...';

  @override
  String get phonePart => 'Sekret po stronie telefonu:';

  @override
  String get tokens => 'Tokens';

  @override
  String get settings => 'Ustawienia';

  @override
  String get pushToken => 'Push token';

  @override
  String get theme => 'Motyw';

  @override
  String get lightTheme => 'Jasny';

  @override
  String get darkTheme => 'Ciemny';

  @override
  String get systemTheme => 'Motyw systemu';

  @override
  String get enablePolling => 'Włącz autentykację przez wiadomość push.';

  @override
  String get requestPushChallengesPeriodically => 'Wysyłaj zapytanie o push challenge cyklicznie. Włącz, jeśli push nie przychodzi normalnie.';

  @override
  String get synchronizePushTokens => 'Synchronizuj tokeny push.';

  @override
  String get synchronizesTokensWithServer => 'Synchronizuje tokeny push z serwerem eduMFA.';

  @override
  String get sync => 'Synchronizuj';

  @override
  String get synchronizingTokens => 'Synchronizacja tokenów.';

  @override
  String get allTokensSynchronized => 'Wszystkie tokeny są zsynchronizowane.';

  @override
  String get synchronizationFailed => 'Synchronizacja dla poniższych tokenów się nie udała, spróbuj ponownie:';

  @override
  String get tokensDoNotSupportSynchronization => 'Następujące tokeny nie wspierają synchronizacji i muszą zostać wdrożone od nowa:';

  @override
  String errorRollOutFailed(Object name) {
    return 'Wdrażanie tokenu $name nieudane.';
  }

  @override
  String statusCode(Object statusCode) {
    return 'Kod statusu: $statusCode';
  }

  @override
  String get errorSynchronizationNoNetworkConnection => 'Synchronizacja tokenów push nieudana, ponieważ serwer eduMFA jest nieosiągalny.';

  @override
  String errorRollOutNoConnectionToServer(Object name) {
    return 'Brak połączenia z serwerem';
  }

  @override
  String errorRollOutUnknownError(Object e) {
    return 'Napotkano nieznany błąd. Wdrożenie tokenu niemożliwe: $e';
  }

  @override
  String get rollingOut => 'Wdrażanie';

  @override
  String get unexpectedError => 'Wystąpił nieoczekiwany błąd.';

  @override
  String get pollingFailed => 'Zapytanie nie powiodło się.';

  @override
  String pollingFailedFor(Object serial) {
    return 'Zapytanie dla $serial nie powiodło się.';
  }

  @override
  String get noNetworkConnection => 'Brak połączenia sieciowego.';

  @override
  String get connectionFailed => 'Połączenie nie powiodło się.';

  @override
  String get checkYourNetwork => 'Sprawdź połączenie sieciowe i spróbuj ponownie.';

  @override
  String get couldNotSignMessage => 'Nie można podpisać wiadomości.';

  @override
  String get useDeviceLocaleTitle => 'Użyj języka urządzenia.';

  @override
  String get useDeviceLocaleDescription => 'Użyj języka urządzenia, jeśli jest wspierany. W innym wypadku zostanie ustawiony domyślny język angielski.';

  @override
  String get language => 'Język';

  @override
  String get authenticateToShowOtp => 'Zweryfikuj tożsamość, by pokazać hasło jednorazowe.';

  @override
  String get authenticateToUnLockToken => 'Zweryfikuj tożsamość, aby odblokować / zablokować token.';

  @override
  String get biometricRequiredTitle => 'Uwierzytelnianie biometryczne nie jest skonfigurowane.';

  @override
  String get biometricHint => 'Wymagana autentykacja';

  @override
  String get biometricNotRecognized => 'Nie rozpoznano. Spróbuj ponownie.';

  @override
  String get biometricSuccess => 'Autentykacja zakończona sukcesem!';

  @override
  String get deviceCredentialsRequiredTitle => 'Ustawienia zabezpieczeń urządzenia nie zostały skonfigurowane.';

  @override
  String get deviceCredentialsSetupDescription => 'Skonfiguruj ustawienia zabezpieczeń w ustawieniach urządzenia.';

  @override
  String get signInTitle => 'Wymagana autentykacja';

  @override
  String get goToSettingsButton => 'Idź do ustawień';

  @override
  String get goToSettingsDescription => 'Ustawienia zabezpieczeń, bądź uwierzytelnianie biometryczne nie są skonfigurowane w twoim urządzeniu. Skonfiguruj je w ustawieniach urządzenia.';

  @override
  String get lockOut => 'Uwierzytelnianie biometryczne jest wyłączone. Zablokuj i odblokuj ponownie ekran, żeby je włączyć.';

  @override
  String get authNotSupportedTitle => 'Skonfigurowane ustawienia zabezpieczeń albo uwierzytelnianie biometryczne jest wymagane.';

  @override
  String get authNotSupportedBody => 'To działanie wymaga skonfigurowania ustawień zabezpieczeń albo uwierzytelniania biometrycznego.';

  @override
  String get lock => 'Zablokuj';

  @override
  String get unlock => 'Odblokuj';

  @override
  String get noResultTitle => 'Nie zainstalowano jeszcze żadnego tokenu.';

  @override
  String get noResultText1 => 'Dotknij ';

  @override
  String get noResultText2 => ' przycisku, żeby zacząć!';

  @override
  String get onBoardingText1 => 'Uwierzytelnianie dwuskładnikowe\nuczynione prostym';

  @override
  String get onBoardingTitle2 => 'Maksymalne Bezpieczeństwo';

  @override
  String get onBoardingText2 => 'Przechowuj tokeny w swoim urządzeniu\nzabezpieczone biometrycznie';

  @override
  String get onBoardingTitle3 => 'Odwiedź nas na Github';

  @override
  String get onBoardingText3 => 'Ta aplikacja jest w open source';

  @override
  String get errorLogTitle => 'Dziennik błędów';

  @override
  String get logMenu => 'Menu dziennika';

  @override
  String get showErrorLog => 'Wyświetl';

  @override
  String get clearErrorLog => 'Usuń';

  @override
  String get send => 'Wyślij';

  @override
  String get sendErrorLogDescription => 'Tworzona jest gotowa wiadomość e-mail zawierająca informacje o aplikacji, błędzie i urządzeniu.\nMożesz edytować wiadomość e-mail przed jej wysłaniem.\nTutaj można zobaczyć, w jaki sposób wykorzystujemy te informacje:';

  @override
  String get showPrivacyPolicy => 'Pokaż politykę prywatności';

  @override
  String get errorLogEmpty => 'Dziennik błędów jest pusty';

  @override
  String get verboseLogging => 'Wyczerpujące rejestrowanie';

  @override
  String get errorLogCleared => 'Dziennik błędów wyczyszczony.';

  @override
  String get ok => 'Ok';

  @override
  String get errorMailBody => 'Plik dziennika błędów jest dołączony.\nTekst ten można zastąpić dodatkowymi informacjami o błędzie.';

  @override
  String get showDetails => 'Pokaż szczegóły';

  @override
  String get open => 'Otwórz';

  @override
  String get deleteLockedToken => 'Uwierzytelnij, aby usunąć zablokowany token.';

  @override
  String get editLockedToken => 'Aby edytować zablokowany token, należy się uwierzytelnić.';

  @override
  String get retryRollout => 'Ponowne uruchomienie';

  @override
  String get generatingRSAKeyPair => 'Generowanie pary kluczy RSA';

  @override
  String get generatingRSAKeyPairFailed => 'Generowanie pary kluczy RSA nieudane';

  @override
  String get sendingRSAPublicKey => 'Wysyłanie publicznego klucza RSA';

  @override
  String get sendingRSAPublicKeyFailed => 'Wysyłanie publicznego klucza RSA nieudane';

  @override
  String get parsingResponse => 'Analizowanie odpowiedzi';

  @override
  String get parsingResponseFailed => 'Analizowanie odpowiedzi nieudane';

  @override
  String get rolloutCompleted => 'Wdrożenie zakończone';

  @override
  String get authToAcceptPushRequest => 'Uwierzytelnij, aby zaakceptować żądanie push.';

  @override
  String get authToDeclinePushRequest => 'Uwierzytelnij, aby odrzucić żądanie push.';

  @override
  String get pushRequestParseError => 'Żądanie push nie mogło zostać przetworzone.';

  @override
  String get errorRollOutSSLHandshakeFailed => 'Uścisk dłoni SSL nie powiódł się. Rozwijanie nie jest możliwe.';

  @override
  String errorWhenPullingChallenges(Object name) {
    return 'Wystąpił błąd podczas odpytywania o wyzwania $name';
  }

  @override
  String get errorRollOutNotPossibleAnymore => 'Wstać z łóżka tego tokena nie jest już możliwe.';

  @override
  String errorTokenExpired(Object name) {
    return 'Token $name wygasł.';
  }

  @override
  String get yes => 'Tak';

  @override
  String get no => 'Nie';

  @override
  String get butDiscardIt => 'ale odrzucić go';

  @override
  String get declineIt => 'odrzuć go';

  @override
  String get requestTriggerdByUserQuestion => 'Czy ta prośba została wywołana przez Ciebie?';

  @override
  String get grantCameraPermissionDialogTitle => 'Uprawnienie do kamery nie zostało przyznane';

  @override
  String get grantCameraPermissionDialogContent => 'Przyznaj uprawnienia kamery do skanowania kodów QR.';

  @override
  String get grantCameraPermissionDialogPermanentlyDenied => 'Uprawnienia do aparatu zostały trwale zablokowane. Przyznaj uprawnienia aparatu w ustawieniach telefonu.';

  @override
  String get grantCameraPermissionDialogButton => 'Grant permission';

  @override
  String get decryptErrorTitle => 'Decryption error';

  @override
  String get decryptErrorContent => 'Niestety, aplikacja nie była w stanie odszyfrować tokenów. Oznacza to, że klucz szyfrowania jest uszkodzony. Możesz spróbować ponownie lub usunąć dane aplikacji, co spowoduje usunięcie tokenów w aplikacji.';

  @override
  String get decryptErrorButtonDelete => 'Usuń';

  @override
  String get decryptErrorButtonSendError => 'Wyślij błąd';

  @override
  String get decryptErrorButtonRetry => 'Ponów próbę';

  @override
  String get decryptErrorDeleteConfirmationContent => 'Czy na pewno chcesz usunąć dane aplikacji?';

  @override
  String get settingsGroupGeneral => 'Informacje ogólne';

  @override
  String get licensesAndVersion => 'Licencje i wersja';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get introScanQrCode => 'Możesz skanować kody QR, aby dodawać tokeny. Obsługujemy każdy popularny token uwierzytelniania dwuskładnikowego, a także tokeny eduMFA.';

  @override
  String get introEditToken => 'Tutaj możesz edytować nazwę tokena i zobaczyć kilka szczegółów.';

  @override
  String get introLockToken => 'Aby jeszcze bardziej zwiększyć bezpieczeństwo, możesz zablokować tokeny. Wtedy token może być używany tylko po uwierzytelnieniu.';

  @override
  String get introPollForChallenges => 'Możesz sprawdzić nowe wyzwania, przeciągając listę tokenów w dół.';

  @override
  String get feedback => 'Informacje zwrotne';

  @override
  String get feedbackTitle => 'Twoja opinia jest zawsze mile widziana!';

  @override
  String get feedbackDescription => 'Jeśli masz jakieś pytania, sugestie lub problemy, daj nam znać.';

  @override
  String get feedbackHint => 'Otworzy się gotowa wiadomość e-mail, którą możesz do nas wysłać. W razie potrzeby dodane zostaną informacje o urządzeniu i wersji aplikacji. Możesz sprawdzić i edytować wiadomość e-mail przed jej wysłaniem.';

  @override
  String get feedbackPrivacyPolicy1 => 'Wysyłając opinię, zgadzasz się z naszą ';

  @override
  String get feedbackPrivacyPolicy2 => 'polityką prywatności';

  @override
  String get feedbackPrivacyPolicy3 => '.';

  @override
  String get addSystemInfo => 'Dodaj informacje systemowe';

  @override
  String get feedbackSentTitle => 'Opinia została wysłana';

  @override
  String get feedbackSentDescription => 'Dziękujemy bardzo za pomoc w ulepszeniu tej aplikacji!';

  @override
  String get noMailAppTitle => 'Nie znaleziono aplikacji pocztowej';

  @override
  String get noMailAppDescription => 'Na tym urządzeniu nie zainstalowano ani nie zainicjowano aplikacji poczty e-mail, spróbuj ponownie, gdy będziesz w stanie wysłać wiadomość e-mail';

  @override
  String get authenticationRequest => 'Żądanie uwierzytelnienia';

  @override
  String requestInfo(Object issuer, Object account) {
    return 'Wysłane przez $issuer dla twojego konta: \"$account\"';
  }
}
