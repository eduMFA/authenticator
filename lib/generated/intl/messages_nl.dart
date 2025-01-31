// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  static String m0(name) => "Weet u zeker dat u ${name} wilt verwijderen?";

  static String m1(name) => "Uitrollen van token ${name} mislukt.";

  static String m2(name) => "Uitrollen mislukt. Geen verbinding met de server.";

  static String m3(e) =>
      "Een onbekende fout heeft plaats gevonden. Uitrollen is niet mogelijk: ${e}";

  static String m4(name) => "Het token ${name} is verlopen.";

  static String m5(name) =>
      "Er is een fout opgetreden bij het zoeken naar uitdagingen van ${name}";

  static String m6(serial) => "Query voor ${serial} mislukt.";

  static String m7(issuer, account) =>
      "Verzonden door ${issuer} voor uw account: \"${account}\"";

  static String m8(statusCode) => "Statuscode: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accepteren"),
        "addToken": MessageLookupByLibrary.simpleMessage("Token toevoegen"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Alle tokens zijn gesynchroniseerd."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "Deze actie vereist dat het apparaat is beveiligd met inlogggevens of biometrie."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Apparaat inloggevens of biometrie is vereist"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Authenticeer om de push aanvraag te accepteren."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Authenticeer om de push aanvraag te weigeren."),
        "authenticateToUnLockToken": MessageLookupByLibrary.simpleMessage(
            "Authenticeer om de vergrendeling van de token te wijzigen."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Verificatieverzoek"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Authenticatie vereist"),
        "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
            "Niet herkend. Probeer opnieuw."),
        "biometricRequiredTitle":
            MessageLookupByLibrary.simpleMessage("Biometrie is niet ingesteld"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Authenticatie geslaagd"),
        "cameraPermissionPermanentlyDeniedButton":
            MessageLookupByLibrary.simpleMessage("Toestemming verlenen"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annuleren"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Controleer je netwerkverbinding en probeer het opnieuw."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Verwijderen"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Bevestig verwijderen"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "U kunt mogelijk niet meer inloggen als u dit token verwijdert. Controleer of u zonder dit token kunt inloggen op het gekoppelde account."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Verbinding mislukt."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "Bericht niet kunnen ondertekenen."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Donker"),
        "decline": MessageLookupByLibrary.simpleMessage("Weigeren"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Verwijderen"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Opnieuw proberen"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Fout verzenden"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Helaas heeft de app je tokens niet kunnen decoderen. Dit geeft aan dat de coderingssleutel is verbroken. U kunt het opnieuw proberen of de app-gegevens verwijderen, waardoor de tokens in de app worden verwijderd."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Weet je zeker dat je de app-gegevens wilt verwijderen?"),
        "decryptErrorTitle":
            MessageLookupByLibrary.simpleMessage("Fout bij decoderen"),
        "delete": MessageLookupByLibrary.simpleMessage("Verwijderen"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Verifieer om het vergrendelde token te verwijderen."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Inloggevens van het apparaat zijn niet ingesteld"),
        "deviceCredentialsSetupDescription": MessageLookupByLibrary.simpleMessage(
            "Stel de inloggegevens in, bij de instellingen van het apparaat"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Sluiten"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Verifieer om het vergrendelde token te bewerken."),
        "enablePolling":
            MessageLookupByLibrary.simpleMessage("Zoeken aanzetten"),
        "errorLogCleared":
            MessageLookupByLibrary.simpleMessage("Foutenlogboek gewist."),
        "errorLogEmpty":
            MessageLookupByLibrary.simpleMessage("Het foutenlogboek is leeg."),
        "errorLogTitle": MessageLookupByLibrary.simpleMessage("Foutenlogboek"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Het foutlogbestand is bijgevoegd.\nU kunt deze tekst vervangen door aanvullende informatie over de fout."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Het uitrollen van dit token is niet meer mogelijk."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "SSL-handdruk mislukt. Uitrollen niet mogelijk."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Token synchroniseren mislukt, eduMFA server kan niet worden bereikt."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "generatingPhonePart":
            MessageLookupByLibrary.simpleMessage("Genereren telefoon gedeelte"),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Genereren RSA sleutelpaar"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Genereren RSA sleutelpaar mislukt"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Ga naar instellingen"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Authenticatie via inloggegevens of biometrie is niet ingesteld. Stel het in bij de instellingen van het apparaat."),
        "language": MessageLookupByLibrary.simpleMessage("Taal"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licenties en versie"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Licht"),
        "lock": MessageLookupByLibrary.simpleMessage("Vergrendel"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "Biometrische authenticatie staat uit. Vergrendel en ontgrendel het scherm om het aan te zetten."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Log menu"),
        "name": MessageLookupByLibrary.simpleMessage("Naam"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "Er is geen e-mail app geïnstalleerd of geïnitialiseerd op dit apparaat, probeer het opnieuw wanneer u in staat bent om een e-mailbericht te verzenden."),
        "noMailAppTitle":
            MessageLookupByLibrary.simpleMessage("Geen mail app gevonden"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Geen netwerkverbinding."),
        "noResultText1": MessageLookupByLibrary.simpleMessage("Tik op "),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage(" de knop om te beginnen!"),
        "noResultTitle":
            MessageLookupByLibrary.simpleMessage("Nog geen token opgeslagen."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Twee-factoren authenticatie\nmakkelijk gemaakt"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Bewaar tokens op uw apparaat\nbeveiligd door uw biometrische gegevens"),
        "onBoardingText3":
            MessageLookupByLibrary.simpleMessage("Deze app is open source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Maximale Beveiliging"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Bezoek ons op Github"),
        "open": MessageLookupByLibrary.simpleMessage("Openen"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Antwoord analyseren"),
        "parsingResponseFailed":
            MessageLookupByLibrary.simpleMessage("Antwoord analyseren mislukt"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Telefoon gedeelte:"),
        "pollingFailed": MessageLookupByLibrary.simpleMessage("Vraag mislukt."),
        "pollingFailedFor": m6,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacybeleid"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "Het pushverzoek kon niet worden verwerkt."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push Token"),
        "rename": MessageLookupByLibrary.simpleMessage("Wijzigen"),
        "renameToken": MessageLookupByLibrary.simpleMessage("Hernoem token"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Activeer het zoeken naar berichten. Gebruik deze optie wanneer de push berichten niet worden ontvangen."),
        "retryRollout":
            MessageLookupByLibrary.simpleMessage("Opnieuw uitrollen"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Uitrollen"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Uitrollen voltooid"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Geheime sleutel"),
        "send": MessageLookupByLibrary.simpleMessage("verzenden"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Er wordt een kant-en-klare e-mail gemaakt die informatie bevat over de app, de fout en het apparaat.\nJe kunt de e-mail bewerken voordat je hem verstuurt.\nJe kunt hier zien hoe we de informatie gebruiken:"),
        "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
            "Versturen van de openbare RSA sleutel"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Versturen van de openbare RSA sleutel mislukt"),
        "settings": MessageLookupByLibrary.simpleMessage("Instellingen"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Algemene informatie"),
        "showDetails": MessageLookupByLibrary.simpleMessage("Details tonen"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Weergeven"),
        "showPrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Privacybeleid tonen"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Authenticatie vereist"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Synchroniseer"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "Synchroniseren mislukt voor de volgende tokens, probeer het opnieuw:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchroniseer push tokens"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchroniseert tokens met de eduMFA server."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Tokens synchroniseren."),
        "theme": MessageLookupByLibrary.simpleMessage("Thema"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Voor de volgende tokens wordt synchroniseren niet ondersteunt, ze moeten opnieuw worden aangeleverd:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Er is een onverwachte fout opgetreden."),
        "unlock": MessageLookupByLibrary.simpleMessage("Ontgrendel"),
        "verboseLogging": MessageLookupByLibrary.simpleMessage("Verbose loggen")
      };
}
