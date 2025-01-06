import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get accept => 'Akzeptieren';

  @override
  String get decline => 'Ablehnen';

  @override
  String get name => 'Name';

  @override
  String get secretKey => 'Geheimer Schlüssel';

  @override
  String get rename => 'Umbenennen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get dismiss => 'Schließen';

  @override
  String get addToken => 'Token hinzufügen';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String get renameToken => 'Token umbenennen';

  @override
  String get confirmDeletion => 'Löschen bestätigen';

  @override
  String confirmDeletionOf(Object name) {
    return 'Sind Sie sicher dass Sie $name löschen möchten?';
  }

  @override
  String get confirmTokenDeletionHint => 'Unter Umständen können Sie sich nicht mehr einloggen, wenn Sie diesen Token löschen.\nBitte stellen Sie sicher, dass Sie sich ohne diesen Token in den dazugehörigen Account einloggen können.';

  @override
  String get generatingPhonePart => 'Generiere Telefonanteil';

  @override
  String get phonePart => 'Telefonanteil:';

  @override
  String get tokens => 'Token';

  @override
  String get settings => 'Einstellungen';

  @override
  String get pushToken => 'Push Token';

  @override
  String get theme => 'Farbschema';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get systemTheme => 'Nutze Farbschema des Geräts';

  @override
  String get enablePolling => 'Aktives Stellen von Push-Anfragen';

  @override
  String get requestPushChallengesPeriodically => 'Fordert regelmäßig Push-Anfragen vom Server an. Aktivieren Sie diese Funktion, wenn Nachrichten ansonsten nicht erhalten werden.';

  @override
  String get synchronizePushTokens => 'Synchronisiere Push Token';

  @override
  String get synchronizesTokensWithServer => 'Synchronisiert Token mit dem eduMFA Server.';

  @override
  String get sync => 'Sync';

  @override
  String get synchronizingTokens => 'Synchronisiere Token.';

  @override
  String get allTokensSynchronized => 'Alle Token wurden synchronisiert.';

  @override
  String get synchronizationFailed => 'Synchronisation ist für die folgenden Token fehlgeschlagen:';

  @override
  String get tokensDoNotSupportSynchronization => 'Die folgenden Token unterstützen keine Synchronisation und müssen erneut ausgerollt werden:';

  @override
  String errorRollOutFailed(Object name) {
    return 'Ausrollen von $name ist fehlgeschlagen.';
  }

  @override
  String statusCode(Object statusCode) {
    return 'Statuscode: $statusCode';
  }

  @override
  String get errorSynchronizationNoNetworkConnection => 'Die Synchronisation ist fehlgeschlagen, da der eduMFA Server nicht erreicht werden konnte.';

  @override
  String errorRollOutNoConnectionToServer(Object name) {
    return 'Der Rollout von Token $name ist fehlgeschlagen, der Server konnte nicht erreicht werden.';
  }

  @override
  String errorRollOutUnknownError(Object e) {
    return 'Ein unbekannter Fehler ist aufgetreten. Aurollen nicht möglich: $e';
  }

  @override
  String get rollingOut => 'Ausrollen';

  @override
  String get unexpectedError => 'Ein unerwarteter Fehler ist aufgetreten.';

  @override
  String get pollingFailed => 'Abfrage fehlgeschlagen.';

  @override
  String pollingFailedFor(Object serial) {
    return 'Abfrage für $serial fehlgeschlagen.';
  }

  @override
  String get noNetworkConnection => 'Keine Netzwerkverbindung.';

  @override
  String get connectionFailed => 'Verbindung fehlgeschlagen.';

  @override
  String get checkYourNetwork => 'Bitte überprüfen Sie Ihre Netzwerkverbindung und versuchen Sie es erneut.';

  @override
  String get couldNotSignMessage => 'Nachricht konnte nicht signiert werden.';

  @override
  String get useDeviceLocaleTitle => 'Nutze Systemsprache';

  @override
  String get useDeviceLocaleDescription => 'Nutze Systemsprache, falls diese unterstützt wird. Anderenfalls nutze Englisch. ';

  @override
  String get language => 'Sprache';

  @override
  String get authenticateToShowOtp => 'Bitte authentifizieren Sie sich, um das Einmalpasswort anzuzeigen.';

  @override
  String get authenticateToUnLockToken => 'Bitte authentifizieren Sie sich, um den Sperrstatus des Tokens zu ändern.';

  @override
  String get biometricRequiredTitle => 'Biometrie ist nicht eingerichtet';

  @override
  String get biometricHint => 'Authentifizierung wird benötigt';

  @override
  String get biometricNotRecognized => 'Biometrie wurde nicht erkannt, bitte versuchen Sie es erneut';

  @override
  String get biometricSuccess => 'Authentifizierung erfolgreich';

  @override
  String get deviceCredentialsRequiredTitle => 'Gerätepasswort ist nicht eingerichtet';

  @override
  String get deviceCredentialsSetupDescription => 'Setzen Sie bitte ein Gerätepasswort in den Einstellungen';

  @override
  String get signInTitle => 'Authentifizierung wird benötigt';

  @override
  String get goToSettingsButton => 'Gehe zu Einstellungen';

  @override
  String get goToSettingsDescription => 'Authentifizierung durch Gerätepasswort oder Biometrie ist nicht eingerichtet. Bitte aktivieren Sie dies in den Geräteeinstellungen.';

  @override
  String get lockOut => 'Biometrie ist deaktiviert. Bitte sperren und entsperren Sie Ihren Bildschirm um diese zu aktivieren.';

  @override
  String get authNotSupportedTitle => 'Gerätepasswort oder Biometrie wird benötigt';

  @override
  String get authNotSupportedBody => 'Diese Aktion erfordert, dass auf dem Gerät ein Passwort oder Biometrie eingerichtet ist.';

  @override
  String get lock => 'Sperren';

  @override
  String get unlock => 'Entsperren';

  @override
  String get noResultTitle => 'Keine Token vorhanden.';

  @override
  String get noResultText1 => 'Tippe auf das ';

  @override
  String get noResultText2 => ' Icon um loszulegen!';

  @override
  String onBoardingTitle1(Object appName) {
    return '$appName';
  }

  @override
  String get onBoardingText1 => 'Zwei-Faktor-Authentifizierung\neinfach gemacht';

  @override
  String get onBoardingTitle2 => 'Maximale Sicherheit';

  @override
  String get onBoardingText2 => 'Speichern Sie Ihre Token sicher auf diesem Gerät\nGeschützt durch Ihre biometrischen Daten';

  @override
  String get onBoardingTitle3 => 'Besuchen Sie uns auf Github';

  @override
  String get onBoardingText3 => 'Diese App ist Open Source';

  @override
  String get errorLogTitle => 'Fehlerprotokoll';

  @override
  String get logMenu => 'Log-Menü';

  @override
  String get showErrorLog => 'Anzeigen';

  @override
  String get clearErrorLog => 'Löschen';

  @override
  String get send => 'Senden';

  @override
  String get sendErrorLogDescription => 'Es wird eine vorgefertigte E-Mail erstellt.\nSie enthält Informationen über die App, den Fehler und das Gerät.\nSie können die E-Mail vor dem Senden bearbeiten.\nWie wir die Informationen verwenden, sehen Sie hier:';

  @override
  String get showPrivacyPolicy => 'Datenschutzerklärung anzeigen';

  @override
  String get errorLogEmpty => 'Das Fehlerprotokoll ist leer.';

  @override
  String get verboseLogging => 'Ausführliche Protokollierung';

  @override
  String get errorLogCleared => 'Fehlerprotokoll gelöscht.';

  @override
  String get ok => 'Ok';

  @override
  String get errorMailBody => 'Die Fehlerprotokolldatei ist angehängt.\nSie können diesen Text durch zusätzliche Informationen über den Fehler ersetzen.';

  @override
  String get showDetails => 'Details anzeigen';

  @override
  String get open => 'Öffnen';

  @override
  String get deleteLockedToken => 'Bitte authentifizieren Sie sich, um den gesperrten Token zu löschen.';

  @override
  String get editLockedToken => 'Bitte authentifizieren Sie sich, um den gesperrten Token zu bearbeiten.';

  @override
  String get retryRollout => 'Erneut ausrollen';

  @override
  String get generatingRSAKeyPair => 'Generiere RSA Schlüsselpaar';

  @override
  String get generatingRSAKeyPairFailed => 'Generieren des RSA Schlüsselpaars fehlgeschlagen';

  @override
  String get sendingRSAPublicKey => 'Sende öffentlichen RSA Schlüssel';

  @override
  String get sendingRSAPublicKeyFailed => 'Senden des öffentlichen RSA Schlüssels fehlgeschlagen';

  @override
  String get parsingResponse => 'Analysiere Antwort';

  @override
  String get parsingResponseFailed => 'Analysieren der Antwort fehlgeschlagen';

  @override
  String get rolloutCompleted => 'Ausrollen abgeschlossen';

  @override
  String get authToAcceptPushRequest => 'Bitte authentifizieren Sie sich, um die Anfrage anzunehmen.';

  @override
  String get authToDeclinePushRequest => 'Bitte authentifizieren Sie sich, um die Anfrage abzulehnen.';

  @override
  String get pushRequestParseError => 'Die Push-Anfrage konnte nicht verarbeitet werden.';

  @override
  String get errorRollOutSSLHandshakeFailed => 'SSL-Handshake fehlgeschlagen. Roll-out nicht möglich.';

  @override
  String errorWhenPullingChallenges(Object name) {
    return 'Fehler beim Abrufen der Authentifizierungsanfragen von $name';
  }

  @override
  String get errorRollOutNotPossibleAnymore => 'Das Ausrollen dieses Tokens ist nicht mehr möglich.';

  @override
  String errorTokenExpired(Object name) {
    return 'Der Token $name ist abgelaufen.';
  }

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get butDiscardIt => 'aber verwerfen';

  @override
  String get declineIt => 'ablehnen';

  @override
  String get requestTriggerdByUserQuestion => 'Wurde diese Anfrage von Ihnen ausgelöst?';

  @override
  String get grantCameraPermissionDialogTitle => 'Kamera-Berechtigung erforderlich';

  @override
  String get grantCameraPermissionDialogContent => 'Um QR-Codes zu scannen, benötigt die App Zugriff auf die Kamera.';

  @override
  String get grantCameraPermissionDialogPermanentlyDenied => 'Sie haben die Berechtigung für den Kamerazugriff permanent verweigert. Bitte aktivieren Sie die Berechtigung in den Einstellungen ihres Smartphones.';

  @override
  String get grantCameraPermissionDialogButton => 'Berechtigung erteilen';

  @override
  String get decryptErrorTitle => 'Entschlüsselung fehlgeschlagen';

  @override
  String get decryptErrorContent => 'Leider konnten Ihre Token nicht entschlüsselt werden. Das deutet darauf hin, dass der Verschlüsselungsschlüssel nicht mehr verfügbar ist. Sie können es erneut versuchen oder die App Daten löschen. Dabei werden alle Token aus der App geschlöscht.';

  @override
  String get decryptErrorButtonDelete => 'Löschen.';

  @override
  String get decryptErrorButtonSendError => 'Fehler senden';

  @override
  String get decryptErrorButtonRetry => 'Wiederholen';

  @override
  String get decryptErrorDeleteConfirmationContent => 'Sind Sie sicher, dass Sie die App Daten löschen möchten?';

  @override
  String get settingsGroupGeneral => 'Allgemeines';

  @override
  String get licensesAndVersion => 'Lizenzen und Version';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get introScanQrCode => 'Sie können QR-Codes scannen, um Token hinzuzufügen.\nWir unterstützen alle gängigen Two-Factor-Authentication Token und auch die eduMFA Token.';

  @override
  String get introEditToken => 'Hier können Sie den Namen des Tokens bearbeiten und einige Details einsehen.';

  @override
  String get introLockToken => 'Um die Sicherheit noch weiter zu erhöhen, können Sie Token sperren.\nDer Token kann dann erst nach der Authentifizierung verwendet werden.';

  @override
  String get introPollForChallenges => 'Sie können neue Push-Anmeldungen abfragen, indem Sie die Liste der Token nach unten ziehen.';

  @override
  String get feedback => 'Feedback';

  @override
  String get feedbackTitle => 'Ihr Feedback ist immer willkommen!';

  @override
  String get feedbackDescription => 'Wenn Sie Fragen, Anregungen oder Probleme haben, lassen Sie es uns wissen.';

  @override
  String get feedbackHint => 'Es öffnet sich eine vorgefertigte E-Mail, die Sie an uns senden können. Falls gewünscht, werden Informationen über Ihr Gerät und die Version der Anwendung hinzugefügt. Vor dem Versenden können Sie die E-Mail überprüfen und bearbeiten.';

  @override
  String get feedbackPrivacyPolicy1 => 'Mit dem Senden des Feedbacks stimmen Sie unserer ';

  @override
  String get feedbackPrivacyPolicy2 => 'Datenschutzerklärung';

  @override
  String get feedbackPrivacyPolicy3 => ' zu.';

  @override
  String get addSystemInfo => 'Systeminfos hinzufügen';

  @override
  String get feedbackSentTitle => 'Feedback gesendet';

  @override
  String get feedbackSentDescription => 'Vielen Dank für Ihre Hilfe bei der Verbesserung dieser App!';

  @override
  String get noMailAppTitle => 'Keine Mail-App gefunden';

  @override
  String get noMailAppDescription => 'Auf diesem Gerät ist keine E-Mail-App installiert oder initialisiert, bitte versuchen Sie es erneut, wenn Sie eine E-Mail-Nachricht senden können.';

  @override
  String get authenticationRequest => 'Authentifizierung';

  @override
  String requestInfo(Object issuer, Object account) {
    return 'Gesendet von $issuer für Ihr Konto: \"$account\"';
  }
}
