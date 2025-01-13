import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get accept => 'Accepteren';

  @override
  String get decline => 'Weigeren';

  @override
  String get name => 'Naam';

  @override
  String get secretKey => 'Geheime sleutel';

  @override
  String get encoding => 'Codering';

  @override
  String get algorithm => 'Algoritme';

  @override
  String get digits => 'Cijfers';

  @override
  String get type => 'Type';

  @override
  String get period => 'Duur';

  @override
  String get rename => 'Wijzigen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get dismiss => 'Sluiten';

  @override
  String get addToken => 'Token toevoegen';

  @override
  String get scanQrCode => 'Scan QR-Code';

  @override
  String get enterDetailsForToken => 'Voer informatie over token in';

  @override
  String get pleaseEnterANameForThisToken => 'Voer de naam in voor deze token.';

  @override
  String get pleaseEnterASecretForThisToken => 'Voer de geheime sleutel in voor deze token.';

  @override
  String get theSecretDoesNotFitTheCurrentEncoding => 'De geheime sleutel past niet bij de huidige codering';

  @override
  String get renameToken => 'Hernoem token';

  @override
  String get confirmDeletion => 'Bevestig verwijderen';

  @override
  String confirmDeletionOf(Object name) {
    return 'Weet u zeker dat u $name wilt verwijderen?';
  }

  @override
  String get confirmTokenDeletionHint => 'U kunt mogelijk niet meer inloggen als u dit token verwijdert. Controleer of u zonder dit token kunt inloggen op het gekoppelde account.';

  @override
  String get confirmFolderDeletionHint => 'Het verwijderen van een map heeft geen effect op de tokens in de map. De tokens worden verplaatst naar de hoofdlijst.';

  @override
  String get generatingPhonePart => 'Genereren telefoon gedeelte';

  @override
  String get phonePart => 'Telefoon gedeelte:';

  @override
  String otpValueCopiedMessage(Object otpValue) {
    return 'Wachtwoord \"$otpValue\" gekopieerd naar het klembord.';
  }

  @override
  String get tokens => 'Token';

  @override
  String get settings => 'Instellingen';

  @override
  String get pushToken => 'Push Token';

  @override
  String get theme => 'Thema';

  @override
  String get lightTheme => 'Licht';

  @override
  String get darkTheme => 'Donker';

  @override
  String get systemTheme => 'Gebruik thema van het apparaat';

  @override
  String get enablePolling => 'Zoeken aanzetten';

  @override
  String get requestPushChallengesPeriodically => 'Activeer het zoeken naar berichten. Gebruik deze optie wanneer de push berichten niet worden ontvangen.';

  @override
  String get synchronizePushTokens => 'Synchroniseer push tokens';

  @override
  String get synchronizesTokensWithServer => 'Synchroniseert tokens met de eduMFA server.';

  @override
  String get sync => 'Synchroniseer';

  @override
  String get synchronizingTokens => 'Tokens synchroniseren.';

  @override
  String get allTokensSynchronized => 'Alle tokens zijn gesynchroniseerd.';

  @override
  String get synchronizationFailed => 'Synchroniseren mislukt voor de volgende tokens, probeer het opnieuw:';

  @override
  String get tokensDoNotSupportSynchronization => 'Voor de volgende tokens wordt synchroniseren niet ondersteunt, ze moeten opnieuw worden aangeleverd:';

  @override
  String errorRollOutFailed(Object name) {
    return 'Uitrollen van token $name mislukt.';
  }

  @override
  String statusCode(Object statusCode) {
    return 'Statuscode: $statusCode';
  }

  @override
  String get errorSynchronizationNoNetworkConnection => 'Token synchroniseren mislukt, eduMFA server kan niet worden bereikt.';

  @override
  String errorRollOutNoConnectionToServer(Object name) {
    return 'Uitrollen mislukt. Geen verbinding met de server.';
  }

  @override
  String errorRollOutUnknownError(Object e) {
    return 'Een onbekende fout heeft plaats gevonden. Uitrollen is niet mogelijk: $e';
  }

  @override
  String get rollingOut => 'Uitrollen';

  @override
  String get pollingChallenges => 'Zoeken naar nieuwe aanvragen';

  @override
  String get unexpectedError => 'Er is een onverwachte fout opgetreden.';

  @override
  String get pollingFailed => 'Vraag mislukt.';

  @override
  String pollingFailedFor(Object serial) {
    return 'Query voor $serial mislukt.';
  }

  @override
  String get noNetworkConnection => 'Geen netwerkverbinding.';

  @override
  String get connectionFailed => 'Verbinding mislukt.';

  @override
  String get checkYourNetwork => 'Controleer je netwerkverbinding en probeer het opnieuw.';

  @override
  String get serverNotReachable => 'De server kon niet worden bereikt.';

  @override
  String get couldNotSignMessage => 'Bericht niet kunnen ondertekenen.';

  @override
  String get useDeviceLocaleTitle => 'Gebruik de taal van het apparaat';

  @override
  String get useDeviceLocaleDescription => 'Gebruik de taal van het apparaat wanneer het wordt ondersteund, val anders terug op Engels.';

  @override
  String get language => 'Taal';

  @override
  String get authenticateToShowOtp => 'Authenticeer om het eenmalige wachtwoord te tonen.';

  @override
  String get authenticateToUnLockToken => 'Authenticeer om de vergrendeling van de token te wijzigen.';

  @override
  String get biometricRequiredTitle => 'Biometrie is niet ingesteld';

  @override
  String get biometricHint => 'Authenticatie vereist';

  @override
  String get biometricNotRecognized => 'Niet herkend. Probeer opnieuw.';

  @override
  String get biometricSuccess => 'Authenticatie geslaagd';

  @override
  String get deviceCredentialsRequiredTitle => 'Inloggevens van het apparaat zijn niet ingesteld';

  @override
  String get deviceCredentialsSetupDescription => 'Stel de inloggegevens in, bij de instellingen van het apparaat';

  @override
  String get signInTitle => 'Authenticatie vereist';

  @override
  String get goToSettingsButton => 'Ga naar instellingen';

  @override
  String get goToSettingsDescription => 'Authenticatie via inloggegevens of biometrie is niet ingesteld. Stel het in bij de instellingen van het apparaat.';

  @override
  String get lockOut => 'Biometrische authenticatie staat uit. Vergrendel en ontgrendel het scherm om het aan te zetten.';

  @override
  String get authNotSupportedTitle => 'Apparaat inloggevens of biometrie is vereist';

  @override
  String get authNotSupportedBody => 'Deze actie vereist dat het apparaat is beveiligd met inlogggevens of biometrie.';

  @override
  String get lock => 'Vergrendel';

  @override
  String get unlock => 'Ontgrendel';

  @override
  String get noResultTitle => 'Nog geen token opgeslagen.';

  @override
  String get noResultText1 => 'Tik op ';

  @override
  String get noResultText2 => ' de knop om te beginnen!';

  @override
  String onBoardingTitle1(Object appName) {
    return '$appName';
  }

  @override
  String get onBoardingText1 => 'Twee-factoren authenticatie\nmakkelijk gemaakt';

  @override
  String get onBoardingTitle2 => 'Maximale Beveiliging';

  @override
  String get onBoardingText2 => 'Bewaar tokens op uw apparaat\nbeveiligd door uw biometrische gegevens';

  @override
  String get onBoardingTitle3 => 'Bezoek ons op Github';

  @override
  String get onBoardingText3 => 'Deze app is open source';

  @override
  String get errorLogTitle => 'Foutenlogboek';

  @override
  String get logMenu => 'Log menu';

  @override
  String get showErrorLog => 'Weergeven';

  @override
  String get clearErrorLog => 'Verwijderen';

  @override
  String get send => 'verzenden';

  @override
  String get sendErrorLogDescription => 'Er wordt een kant-en-klare e-mail gemaakt die informatie bevat over de app, de fout en het apparaat.\nJe kunt de e-mail bewerken voordat je hem verstuurt.\nJe kunt hier zien hoe we de informatie gebruiken:';

  @override
  String get showPrivacyPolicy => 'Privacybeleid tonen';

  @override
  String get errorLogEmpty => 'Het foutenlogboek is leeg.';

  @override
  String get verboseLogging => 'Verbose loggen';

  @override
  String get errorLogCleared => 'Foutenlogboek gewist.';

  @override
  String get ok => 'Ok';

  @override
  String get errorMailBody => 'Het foutlogbestand is bijgevoegd.\nU kunt deze tekst vervangen door aanvullende informatie over de fout.';

  @override
  String get showDetails => 'Details tonen';

  @override
  String get open => 'Openen';

  @override
  String get sendErrorDialogBody => 'Een onverwachte fout heeft plaatsgevonden in de applicatie. De onderstaande informatie kan worden verstuurd naar de ontwikkelaars via e-mail om het probleem in de toekomst te voorkomen.';

  @override
  String get noFbToken => 'Geen Firebase Token beschikbaar';

  @override
  String get firebaseToken => 'Firebase Token';

  @override
  String get noPublicKey => 'Geen openbare sleutel beschikbaar';

  @override
  String get publicKey => 'Openbare sleutel';

  @override
  String get editToken => 'Token bewerken';

  @override
  String get edit => 'Bewerken';

  @override
  String get save => 'Opslaan';

  @override
  String get create => 'Creëer';

  @override
  String get validFor => 'Geldig voor';

  @override
  String get validUntil => 'Geldig tot';

  @override
  String get deleteLockedToken => 'Verifieer om het vergrendelde token te verwijderen.';

  @override
  String get editLockedToken => 'Verifieer om het vergrendelde token te bewerken.';

  @override
  String get expandLockedFolder => 'Verifieer om de vergrendelde map te openen.';

  @override
  String get renameTokenFolder => 'Map hernoemen';

  @override
  String get addANewFolder => 'Nieuwe map maken';

  @override
  String get folderName => 'Mapnaam';

  @override
  String get retryRollout => 'Opnieuw uitrollen';

  @override
  String get generatingRSAKeyPair => 'Genereren RSA sleutelpaar';

  @override
  String get generatingRSAKeyPairFailed => 'Genereren RSA sleutelpaar mislukt';

  @override
  String get sendingRSAPublicKey => 'Versturen van de openbare RSA sleutel';

  @override
  String get sendingRSAPublicKeyFailed => 'Versturen van de openbare RSA sleutel mislukt';

  @override
  String get parsingResponse => 'Antwoord analyseren';

  @override
  String get parsingResponseFailed => 'Antwoord analyseren mislukt';

  @override
  String get rolloutCompleted => 'Uitrollen voltooid';

  @override
  String get authToAcceptPushRequest => 'Authenticeer om de push aanvraag te accepteren.';

  @override
  String get authToDeclinePushRequest => 'Authenticeer om de push aanvraag te weigeren.';

  @override
  String get pushRequestParseError => 'Het pushverzoek kon niet worden verwerkt.';

  @override
  String get imageUrl => 'Afbeeldings-URL';

  @override
  String get errorRollOutSSLHandshakeFailed => 'SSL-handdruk mislukt. Uitrollen niet mogelijk.';

  @override
  String errorWhenPullingChallenges(Object name) {
    return 'Er is een fout opgetreden bij het zoeken naar uitdagingen van $name';
  }

  @override
  String get errorRollOutNotPossibleAnymore => 'Het uitrollen van dit token is niet meer mogelijk.';

  @override
  String errorTokenExpired(Object name) {
    return 'Het token $name is verlopen.';
  }

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get butDiscardIt => 'maar verwijder';

  @override
  String get declineIt => 'weigeren';

  @override
  String get requestTriggerdByUserQuestion => 'Is dit verzoek door jou gedaan?';

  @override
  String get grantCameraPermissionDialogTitle => 'Cameratoestemming is niet verleend';

  @override
  String get grantCameraPermissionDialogContent => 'Geef de camera toestemming om QR-codes te scannen.';

  @override
  String get grantCameraPermissionDialogPermanentlyDenied => 'Cameratoestemming is permanent geweigerd. Geef de camera toestemming in de instellingen van uw telefoon.';

  @override
  String get grantCameraPermissionDialogButton => 'Toestemming verlenen';

  @override
  String get decryptErrorTitle => 'Fout bij decoderen';

  @override
  String get decryptErrorContent => 'Helaas heeft de app je tokens niet kunnen decoderen. Dit geeft aan dat de coderingssleutel is verbroken. U kunt het opnieuw proberen of de app-gegevens verwijderen, waardoor de tokens in de app worden verwijderd.';

  @override
  String get decryptErrorButtonDelete => 'Verwijderen';

  @override
  String get decryptErrorButtonSendError => 'Fout verzenden';

  @override
  String get decryptErrorButtonRetry => 'Opnieuw proberen';

  @override
  String get decryptErrorDeleteConfirmationContent => 'Weet je zeker dat je de app-gegevens wilt verwijderen?';

  @override
  String get settingsGroupGeneral => 'Algemene informatie';

  @override
  String get licensesAndVersion => 'Licenties en versie';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get introScanQrCode => 'Je kunt QR-codes scannen om tokens toe te voegen.We ondersteunen alle gangbare Two-Factor-Authenticatie tokens en ook de eduMFA tokens.';

  @override
  String get introTokenSwipe => 'Veeg tokens naar links om beschikbare acties te zien.';

  @override
  String get introEditToken => 'Hier kun je de naam van het token bewerken en enkele details bekijken.';

  @override
  String get introLockToken => 'Om de beveiliging nog meer te verbeteren, kun je tokens vergrendelen.¨Dan kan het token alleen gebruikt worden na authenticatie.';

  @override
  String get introPollForChallenges => 'Je kunt controleren of er nieuwe uitdagingen zijn door de lijst met tokens naar beneden te slepen.';

  @override
  String legacySigningErrorTitle(Object tokenLabel) {
    return 'Er is een fout opgetreden bij het gebruik van het verouderde token: $tokenLabel';
  }

  @override
  String get legacySigningErrorMessage => 'Het token is aangemaakt in een verouderde versie van de app, wat kan leiden tot problemen bij het gebruik ervan.\nHet wordt aanbevolen om een nieuw push token aan te maken als het probleem zich blijft voordoen!';

  @override
  String get qrScan => 'Scan';

  @override
  String get enterLink => 'Link invoeren';

  @override
  String invalidBackupFile(Object appName) {
    return 'Het geselecteerde bestand is geen geldige backup van $appName.';
  }

  @override
  String invalidQrScan(Object appName) {
    return 'De gescande QR code is geen geldige backup van $appName.';
  }

  @override
  String invalidQrFile(Object appName) {
    return 'Het geselecteerde bestand bevat geen geldige QR code van $appName.';
  }

  @override
  String invalidLink(Object appName) {
    return 'De ingevoerde link is geen geldig token van $appName, of wordt niet ondersteund.';
  }

  @override
  String importExistingToken(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tokens gevonden die al in de applicatie staan.',
      one: 'Er is een token gevonden dat al bestaat in de applicatie.',
      zero: 'Er is geen token gevonden dat al in de toepassing aanwezig is.',
    );
    return '$_temp0';
  }

  @override
  String importConflictToken(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Er is een conflict met tokens die al bestaan.Selecteer welke u wilt behouden.',
      one: 'Er is een conflict met tokens die al bestaan.Selecteer welke u wilt behouden.',
      zero: 'Er is geen conflict met tokens die al bestaan.',
    );
    return '$_temp0';
  }

  @override
  String importNewToken(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Er is een nieuw token $count gevonden dat zal worden geïmporteerd.',
      one: 'Er is een nieuw token gevonden dat zal worden geïmporteerd.',
      zero: 'Er is geen nieuw token gevonden.',
    );
    return '$_temp0';
  }

  @override
  String get importHint2FAS => 'Selecteer uw 2FAS-back-up. Als u geen back-up hebt, maak er dan een aan in de 2FAS-app. Wij raden u aan een wachtwoord te gebruiken.';

  @override
  String get importHintAegisBackupFile => 'Selecteer uw Aegis-export (.JSON).Als u geen export hebt, maak er dan een aan via het instellingenmenu in de Aegis-app. Het gebruik van een wachtwoord wordt aanbevolen.';

  @override
  String get importHintAegisQrScan => 'Scan de QR-code die u ontvangt bij het overbrengen van items uit Aegis.';

  @override
  String get importHintAegisLink => 'Voer de link in die u ontvangt wanneer u vermeldingen van Aegis overdraagt.';

  @override
  String get importHintGoogleQrScan => 'Scan de QR-code die u ontvangt wanneer u uw accounts exporteert vanuit Google Authenticator.';

  @override
  String get importHintGoogleQrFile => 'Selecteer een afbeeldingsbestand met de QR-code die u ontvangt wanneer u uw accounts exporteert vanuit Google Authenticator.\n!! Let op: het is niet veilig om de QR-code op je apparaat op te slaan, omdat de tokens niet versleuteld zijn !!';

  @override
  String get qrFileDecodeError => 'Het was niet mogelijk om de QR code te decoderen van de geselecteerde afbeelding, gebruik in plaats daarvan de QR code scanner.';

  @override
  String get tokenLink => 'tokenlink';

  @override
  String get feedback => 'Feedback';

  @override
  String get feedbackTitle => 'Uw feedback is altijd welkom!';

  @override
  String get feedbackDescription => 'Als je vragen, suggesties of problemen hebt, laat het ons dan weten.';

  @override
  String get feedbackHint => 'Er wordt een kant-en-klare e-mail geopend die je naar ons kunt sturen. Indien gewenst wordt informatie over je apparaat en de versie van de applicatie toegevoegd. U kunt de e-mail controleren en bewerken voordat u deze verzendt.';

  @override
  String get feedbackPrivacyPolicy1 => 'Door feedback te sturen ga je akkoord met ons ';

  @override
  String get feedbackPrivacyPolicy2 => 'privacybeleid';

  @override
  String get feedbackPrivacyPolicy3 => '.';

  @override
  String get addSystemInfo => 'Systeeminformatie toevoegen';

  @override
  String get feedbackSentTitle => 'Feedback verzonden';

  @override
  String get feedbackSentDescription => 'Hartelijk dank voor je hulp om deze applicatie beter te maken!';

  @override
  String get patchNotesDialogTitle => 'Wat is er nieuw?';

  @override
  String get version => 'Versie';

  @override
  String get noMailAppTitle => 'Geen mail app gevonden';

  @override
  String get noMailAppDescription => 'Er is geen e-mail app geïnstalleerd of geïnitialiseerd op dit apparaat, probeer het opnieuw wanneer u in staat bent om een e-mailbericht te verzenden.';

  @override
  String get authenticationRequest => 'Verificatieverzoek';

  @override
  String requestInfo(Object issuer, Object account) {
    return 'Verzonden door $issuer voor uw account: \"$account\"';
  }
}
