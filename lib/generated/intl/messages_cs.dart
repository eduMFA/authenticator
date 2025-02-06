// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a cs locale. All the
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
  String get localeName => 'cs';

  static String m0(name) => "Opravdu chcete smazat token ${name}?";

  static String m1(name) => "Registrace tokenu ${name} selhala.";

  static String m2(name) =>
      "Registrace tokenu ${name} selhala. Server není dostupný.";

  static String m3(e) =>
      "Vyskytla se neznámá chyba. Registrace není možná: ${e}";

  static String m4(name) => "Platnost tokenu ${name} vypršela.";

  static String m5(name) => "Při dotazování na výzvy ${name} došlo k chybě.";

  static String m6(serial) => "Dotaz na ${serial} se nezdařil.";

  static String m7(issuer, account) =>
      "Odesláno ${issuer} pro váš účet: \"${account}\"";

  static String m8(statusCode) => "Stavový kód: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Přijmout"),
        "addToken": MessageLookupByLibrary.simpleMessage("Přidat token"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Všechny tokeny jsou synchronizované."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "Tato akce vyžaduje, aby bylo zařízení chráněno zámkem zařízení nebo biometrickým ověřením."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Vyžadován zámek zařízení nebo biometrické ověření"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Pro přijetí požadavku na push notifikaci se přihlaste."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Pro odmítnutí požadavku na push notifikaci se přihlaste."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Žádost o ověření"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Vyžadováno přihlášení"),
        "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
            "Ověření se nezdařilo. Zkuste to znovu."),
        "biometricRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Biometrické ověření není nastaveno"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Přihlášení bylo úspěšné"),
        "cameraPermissionPermanentlyDeniedButton":
            MessageLookupByLibrary.simpleMessage("Udělit oprávnění"),
        "cancel": MessageLookupByLibrary.simpleMessage("Zrušit"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Zkontrolujte prosím síťové připojení a zkuste to znovu."),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Potvrdit smazání"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "Pokud tento token odstraníte, nebude již možné se přihlásit.\nProsím, ujistěte se, že se můžete přihlásit k přidruženému účtu bez tohoto tokenu."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Připojení se nezdařilo."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "Zprávu se nepodařilo podepsat."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Tmavý"),
        "decline": MessageLookupByLibrary.simpleMessage("Odmítnout"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Odstranit"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Opakování"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Odeslat chybu"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Bohužel se aplikaci nepodařilo dešifrovat vaše tokeny. To znamená, že šifrovací klíč je poškozen. Můžete to zkusit znovu nebo odstranit data aplikace, čímž by došlo k odstranění tokenů v aplikaci."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Jste si jisti, že chcete data aplikace odstranit?"),
        "decryptErrorTitle":
            MessageLookupByLibrary.simpleMessage("Chyba dešifrování"),
        "delete": MessageLookupByLibrary.simpleMessage("Smazat"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Prosím, autentifikujte se pro smazání uzamčeného tokenu."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Není nastaven zámek zařízení"),
        "deviceCredentialsSetupDescription":
            MessageLookupByLibrary.simpleMessage(
                "Nastave zámek zařízení v nastavení zařízení"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Zavřít"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Prosím, autentifikujte se pro úpravu uzamčeného tokenu."),
        "enablePolling":
            MessageLookupByLibrary.simpleMessage("Povolit polling"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Přiložen je soubor protokolu o chybách.\nTento text můžete nahradit dalšími informacemi o chybě."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Roll-out tohoto tokenu již není možný."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "SSL handshake se nezdařil. Roll-out není možný."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Synchronizace tokenů selhala, připojení k serveru eduMFA se nezdařilo."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "generatingPhonePart":
            MessageLookupByLibrary.simpleMessage("Generování klientské části"),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Generování párů klíčů RSA"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Generování páru klíčů RSA se nezdařilo"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Otevřít nastavení"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Není nastaveno přihlášení zámkem zařízení ani biometrické ověření. Aktivujte je v nastavení zařízení."),
        "language": MessageLookupByLibrary.simpleMessage("Jazyk"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licence a verze"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Světlý"),
        "lock": MessageLookupByLibrary.simpleMessage("Zamknout"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "Biometrické ověření je deaktivováno. Pro aktivaci zamkněte a znovu odemkněte obrazovku/zařízení."),
        "name": MessageLookupByLibrary.simpleMessage("Název"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message."),
        "noMailAppTitle": MessageLookupByLibrary.simpleMessage(
            "Není nainstalována žádná e-mailová aplikace"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Žádné připojení k síti."),
        "noResultText1":
            MessageLookupByLibrary.simpleMessage("stiskněte tlačítko "),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage(" a začněte s používáním."),
        "noResultTitle": MessageLookupByLibrary.simpleMessage(
            "Nejsou nainstalovány žádné tokeny."),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "vícefázové ověření\nusnadněno"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Uložte tokeny do svého zařízení\nchráněné biometrickým ověřením"),
        "onBoardingText3": MessageLookupByLibrary.simpleMessage(
            "Tuto aplikaci má open source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Maximální Bezpečnost"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Navštivte náš profil Github"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Rozbor odpovědi"),
        "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
            "Parsování odpovědi se nezdařilo"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Klientská část:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Dotaz se nezdařil."),
        "pollingFailedFor": m6,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Zásady ochrany osobních údajů"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "Požadavek na odeslání se nepodařilo zpracovat."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push notifikace"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Periodicky získávat výzvy ze serveru. Povolte pokud nefunguje příjem push notifikací."),
        "retryRollout": MessageLookupByLibrary.simpleMessage("Zkusit znovu"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Registrace"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Zavedení dokončeno"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Tajný klíč"),
        "send": MessageLookupByLibrary.simpleMessage("Odeslat"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Vytvoří se připravený e-mail.\nObsahuje informace o aplikaci, chybě a zařízení.\nPřed odesláním můžete e-mail upravit.\nZde se můžete podívat, jak informace používáme:"),
        "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
            "Odeslání veřejného klíče RSA"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Nepodařilo se odeslat veřejný klíč RSA"),
        "settings": MessageLookupByLibrary.simpleMessage("Nastavení"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Obecné informace"),
        "showDetails":
            MessageLookupByLibrary.simpleMessage("Zobrazit podrobnosti"),
        "showPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Zobrazit zásady ochrany osobních údajů"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Vyžadováno přihlášení"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Synchronizovat"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "Synchronizace následujících tokenů selhala, zkuste to znovu:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchronizace push tokenů"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchronizovat tokeny se serverem eduMFA."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Tokeny se synchronizují."),
        "theme": MessageLookupByLibrary.simpleMessage("Vzhled"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Následující tokeny nepodporují synchronizaci a musí být znovu zaregistrovány:"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("Nastala neočekávaná chyba.")
      };
}
