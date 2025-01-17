// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(name) => "Sind Sie sicher dass Sie ${name} löschen möchten?";

  static String m1(name) => "Ausrollen von ${name} ist fehlgeschlagen.";

  static String m2(name) =>
      "Der Rollout von Token ${name} ist fehlgeschlagen, der Server konnte nicht erreicht werden.";

  static String m3(e) =>
      "Ein unbekannter Fehler ist aufgetreten. Aurollen nicht möglich: ${e}";

  static String m4(name) => "Der Token ${name} ist abgelaufen.";

  static String m5(name) =>
      "Fehler beim Abrufen der Authentifizierungsanfragen von ${name}";

  static String m6(serial) => "Abfrage für ${serial} fehlgeschlagen.";

  static String m7(issuer, account) =>
      "Gesendet von ${issuer} für Ihr Konto: \"${account}\"";

  static String m8(statusCode) => "Statuscode: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Akzeptieren"),
        "addSystemInfo":
            MessageLookupByLibrary.simpleMessage("Systeminfos hinzufügen"),
        "addToken": MessageLookupByLibrary.simpleMessage("Token hinzufügen"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Alle Token wurden synchronisiert."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "Diese Aktion erfordert, dass auf dem Gerät ein Passwort oder Biometrie eingerichtet ist."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Gerätepasswort oder Biometrie wird benötigt"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um die Anfrage anzunehmen."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um die Anfrage abzulehnen."),
        "authenticateToShowOtp": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um das Einmalpasswort anzuzeigen."),
        "authenticateToUnLockToken": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um den Sperrstatus des Tokens zu ändern."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Authentifizierung"),
        "autoTheme": MessageLookupByLibrary.simpleMessage("Automatisch"),
        "biometricHint": MessageLookupByLibrary.simpleMessage(
            "Authentifizierung wird benötigt"),
        "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
            "Biometrie wurde nicht erkannt, bitte versuchen Sie es erneut"),
        "biometricRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Biometrie ist nicht eingerichtet"),
        "biometricSuccess": MessageLookupByLibrary.simpleMessage(
            "Authentifizierung erfolgreich"),
        "butDiscardIt": MessageLookupByLibrary.simpleMessage("aber verwerfen"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Bitte überprüfen Sie Ihre Netzwerkverbindung und versuchen Sie es erneut."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Löschen"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Löschen bestätigen"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "Unter Umständen können Sie sich nicht mehr einloggen, wenn Sie diesen Token löschen.\nBitte stellen Sie sicher, dass Sie sich ohne diesen Token in den dazugehörigen Account einloggen können."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Verbindung fehlgeschlagen."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "Nachricht konnte nicht signiert werden."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dunkel"),
        "decline": MessageLookupByLibrary.simpleMessage("Ablehnen"),
        "declineIt": MessageLookupByLibrary.simpleMessage("ablehnen"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Löschen."),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Wiederholen"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Fehler senden"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Leider konnten Ihre Token nicht entschlüsselt werden. Das deutet darauf hin, dass der Verschlüsselungsschlüssel nicht mehr verfügbar ist. Sie können es erneut versuchen oder die App Daten löschen. Dabei werden alle Token aus der App geschlöscht."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Sind Sie sicher, dass Sie die App Daten löschen möchten?"),
        "decryptErrorTitle": MessageLookupByLibrary.simpleMessage(
            "Entschlüsselung fehlgeschlagen"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um den gesperrten Token zu löschen."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Gerätepasswort ist nicht eingerichtet"),
        "deviceCredentialsSetupDescription":
            MessageLookupByLibrary.simpleMessage(
                "Setzen Sie bitte ein Gerätepasswort in den Einstellungen"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Schließen"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Bitte authentifizieren Sie sich, um den gesperrten Token zu bearbeiten."),
        "enablePolling": MessageLookupByLibrary.simpleMessage(
            "Aktives Stellen von Push-Anfragen"),
        "errorLogCleared":
            MessageLookupByLibrary.simpleMessage("Fehlerprotokoll gelöscht."),
        "errorLogEmpty": MessageLookupByLibrary.simpleMessage(
            "Das Fehlerprotokoll ist leer."),
        "errorLogTitle":
            MessageLookupByLibrary.simpleMessage("Fehlerprotokoll"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Die Fehlerprotokolldatei ist angehängt.\nSie können diesen Text durch zusätzliche Informationen über den Fehler ersetzen."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Das Ausrollen dieses Tokens ist nicht mehr möglich."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "SSL-Handshake fehlgeschlagen. Roll-out nicht möglich."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Die Synchronisation ist fehlgeschlagen, da der eduMFA Server nicht erreicht werden konnte."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
        "feedbackDescription": MessageLookupByLibrary.simpleMessage(
            "Wenn Sie Fragen, Anregungen oder Probleme haben, lassen Sie es uns wissen."),
        "feedbackHint": MessageLookupByLibrary.simpleMessage(
            "Es öffnet sich eine vorgefertigte E-Mail, die Sie an uns senden können. Falls gewünscht, werden Informationen über Ihr Gerät und die Version der Anwendung hinzugefügt. Vor dem Versenden können Sie die E-Mail überprüfen und bearbeiten."),
        "feedbackPrivacyPolicy1": MessageLookupByLibrary.simpleMessage(
            "Mit dem Senden des Feedbacks stimmen Sie unserer "),
        "feedbackPrivacyPolicy2":
            MessageLookupByLibrary.simpleMessage("Datenschutzerklärung"),
        "feedbackPrivacyPolicy3": MessageLookupByLibrary.simpleMessage(" zu."),
        "feedbackSentDescription": MessageLookupByLibrary.simpleMessage(
            "Vielen Dank für Ihre Hilfe bei der Verbesserung dieser App!"),
        "feedbackSentTitle":
            MessageLookupByLibrary.simpleMessage("Feedback gesendet"),
        "feedbackTitle": MessageLookupByLibrary.simpleMessage(
            "Ihr Feedback ist immer willkommen!"),
        "generatingPhonePart":
            MessageLookupByLibrary.simpleMessage("Generiere Telefonanteil"),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Generiere RSA Schlüsselpaar"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Generieren des RSA Schlüsselpaars fehlgeschlagen"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Gehe zu Einstellungen"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Authentifizierung durch Gerätepasswort oder Biometrie ist nicht eingerichtet. Bitte aktivieren Sie dies in den Geräteeinstellungen."),
        "grantCameraPermissionDialogButton":
            MessageLookupByLibrary.simpleMessage("Berechtigung erteilen"),
        "grantCameraPermissionDialogContent": MessageLookupByLibrary.simpleMessage(
            "Um QR-Codes zu scannen, benötigt die App Zugriff auf die Kamera."),
        "grantCameraPermissionDialogPermanentlyDenied":
            MessageLookupByLibrary.simpleMessage(
                "Sie haben die Berechtigung für den Kamerazugriff permanent verweigert. Bitte aktivieren Sie die Berechtigung in den Einstellungen ihres Smartphones."),
        "grantCameraPermissionDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Kamera-Berechtigung erforderlich"),
        "introEditToken": MessageLookupByLibrary.simpleMessage(
            "Hier können Sie den Namen des Tokens bearbeiten und einige Details einsehen."),
        "introLockToken": MessageLookupByLibrary.simpleMessage(
            "Um die Sicherheit noch weiter zu erhöhen, können Sie Token sperren.\nDer Token kann dann erst nach der Authentifizierung verwendet werden."),
        "introPollForChallenges": MessageLookupByLibrary.simpleMessage(
            "Sie können neue Push-Anmeldungen abfragen, indem Sie die Liste der Token nach unten ziehen."),
        "introScanQrCode": MessageLookupByLibrary.simpleMessage(
            "Sie können QR-Codes scannen, um Token hinzuzufügen.\nWir unterstützen alle gängigen Two-Factor-Authentication Token und auch die eduMFA Token."),
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Lizenzen und Version"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Hell"),
        "lock": MessageLookupByLibrary.simpleMessage("Sperren"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "Biometrie ist deaktiviert. Bitte sperren und entsperren Sie Ihren Bildschirm um diese zu aktivieren."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Log-Menü"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "no": MessageLookupByLibrary.simpleMessage("Nein"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "Auf diesem Gerät ist keine E-Mail-App installiert oder initialisiert, bitte versuchen Sie es erneut, wenn Sie eine E-Mail-Nachricht senden können."),
        "noMailAppTitle":
            MessageLookupByLibrary.simpleMessage("Keine Mail-App gefunden"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Keine Netzwerkverbindung."),
        "noResultText1": MessageLookupByLibrary.simpleMessage("Tippe auf das "),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage(" Icon um loszulegen!"),
        "noResultTitle":
            MessageLookupByLibrary.simpleMessage("Keine Token vorhanden."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Zwei-Faktor-Authentifizierung\neinfach gemacht"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Speichern Sie Ihre Token sicher auf diesem Gerät\nGeschützt durch Ihre biometrischen Daten"),
        "onBoardingText3":
            MessageLookupByLibrary.simpleMessage("Diese App ist Open Source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Maximale Sicherheit"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Besuchen Sie uns auf Github"),
        "open": MessageLookupByLibrary.simpleMessage("Öffnen"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Analysiere Antwort"),
        "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
            "Analysieren der Antwort fehlgeschlagen"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Telefonanteil:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Abfrage fehlgeschlagen."),
        "pollingFailedFor": m6,
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Datenschutzerklärung"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "Die Push-Anfrage konnte nicht verarbeitet werden."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push Token"),
        "rename": MessageLookupByLibrary.simpleMessage("Umbenennen"),
        "renameToken": MessageLookupByLibrary.simpleMessage("Token umbenennen"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Fordert regelmäßig Push-Anfragen vom Server an. Aktivieren Sie diese Funktion, wenn Nachrichten ansonsten nicht erhalten werden."),
        "requestTriggerdByUserQuestion": MessageLookupByLibrary.simpleMessage(
            "Wurde diese Anfrage von Ihnen ausgelöst?"),
        "retryRollout":
            MessageLookupByLibrary.simpleMessage("Erneut ausrollen"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Ausrollen"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Ausrollen abgeschlossen"),
        "scanQrCode": MessageLookupByLibrary.simpleMessage("QR-Code scannen"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Geheimer Schlüssel"),
        "send": MessageLookupByLibrary.simpleMessage("Senden"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Es wird eine vorgefertigte E-Mail erstellt.\nSie enthält Informationen über die App, den Fehler und das Gerät.\nSie können die E-Mail vor dem Senden bearbeiten.\nWie wir die Informationen verwenden, sehen Sie hier:"),
        "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
            "Sende öffentlichen RSA Schlüssel"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Senden des öffentlichen RSA Schlüssels fehlgeschlagen"),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Allgemeines"),
        "showDetails": MessageLookupByLibrary.simpleMessage("Details anzeigen"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Anzeigen"),
        "showPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Datenschutzerklärung anzeigen"),
        "signInTitle": MessageLookupByLibrary.simpleMessage(
            "Authentifizierung wird benötigt"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Sync"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "Synchronisation ist für die folgenden Token fehlgeschlagen:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchronisiere Push Token"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchronisiert Token mit dem eduMFA Server."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Synchronisiere Token."),
        "theme": MessageLookupByLibrary.simpleMessage("Farbschema"),
        "tokens": MessageLookupByLibrary.simpleMessage("Token"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Die folgenden Token unterstützen keine Synchronisation und müssen erneut ausgerollt werden:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Ein unerwarteter Fehler ist aufgetreten."),
        "unlock": MessageLookupByLibrary.simpleMessage("Entsperren"),
        "useDeviceLocaleDescription": MessageLookupByLibrary.simpleMessage(
            "Nutze Systemsprache, falls diese unterstützt wird. Anderenfalls nutze Englisch. "),
        "useDeviceLocaleTitle":
            MessageLookupByLibrary.simpleMessage("Nutze Systemsprache"),
        "verboseLogging": MessageLookupByLibrary.simpleMessage(
            "Ausführliche Protokollierung"),
        "yes": MessageLookupByLibrary.simpleMessage("Ja")
      };
}
