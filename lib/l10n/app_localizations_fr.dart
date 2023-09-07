import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get accept => 'Accepter';

  @override
  String get decline => 'Refuser';

  @override
  String get name => 'Nom';

  @override
  String get secret => 'Secret';

  @override
  String get encoding => 'Encodage';

  @override
  String get algorithm => 'Algorithme';

  @override
  String get digits => 'Chiffres';

  @override
  String get type => 'Type';

  @override
  String get period => 'Période';

  @override
  String get rename => 'Renommer';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get dismiss => 'Fermer';

  @override
  String get addToken => 'Ajouter un jeton';

  @override
  String get scanQrCode => 'Numériser QR-Code';

  @override
  String get enterDetailsForToken => 'Saisissez les détails du jeton';

  @override
  String get pleaseEnterANameForThisToken => 'Veuillez saisir un nom pour ce jeton.';

  @override
  String get pleaseEnterASecretForThisToken => 'Veuillez saisir un secret pour ce jeton.';

  @override
  String get theSecretDoesNotFitTheCurrentEncoding => 'Le secret n\'est pas compatible avec \nl\'encodage actuel.';

  @override
  String get renameToken => 'Renommer jeton';

  @override
  String get confirmDeletion => 'Confirmer suppression';

  @override
  String confirmDeletionOf(Object name) {
    return 'Confirmer la suppression de $name?';
  }

  @override
  String get generatingPhonePart => 'Générer la part du téléphone';

  @override
  String get phonePart => 'Part du téléphone:';

  @override
  String otpValueCopiedMessage(Object otpValue) {
    return 'Le mot de passe \"$otpValue\" a été copié dans le presse-papier.';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get pushToken => 'Jeton de type Push';

  @override
  String get theme => 'Thème';

  @override
  String get lightTheme => 'Thème lumineux';

  @override
  String get darkTheme => 'Thème sombre';

  @override
  String get systemTheme => 'Utiliser le thème de l\'appareil';

  @override
  String get enablePolling => 'Activer l\'interrogation du serveur.';

  @override
  String get requestPushChallengesPeriodically => 'Demander des challenges push depuis le serveur périodiquement. Activer cette fonction si les challenges push ne sont pas reçus normalement.';

  @override
  String get synchronizePushTokens => 'Synchoniser les jetons Push';

  @override
  String get synchronizesTokensWithServer => 'Synchroniser les jetons Push avec le serveur privacyIDEA.';

  @override
  String get sync => 'Synchroniser';

  @override
  String get synchronizingTokens => 'Synchroniser les jetons.';

  @override
  String get allTokensSynchronized => 'Tous les jetons ont été synchronisés.';

  @override
  String get synchronizationFailed => 'La synchronisation a échoué pour ces jetons, veuillez reéssayer:';

  @override
  String get tokensDoNotSupportSynchronization => 'Ces jetons ne supportent pas la synchronisation et doivent être de nouveau générés:';

  @override
  String errorRollOutFailed(Object name, Object errorCode) {
    return 'Le déploiement du jeton $name a échoué. Erreur réseau: $errorCode';
  }

  @override
  String get errorSynchronizationNoNetworkConnection => 'La synchronization a échoué car le serveur est injoignable.';

  @override
  String errorRollOutNoConnectionToServer(Object name) {
    return 'Rolling out token $name failed, the server could not be reached.';
  }

  @override
  String errorRollOutUnknownError(Object e) {
    return 'Le déploiement a échoué suite à une erreur inconnue: $e';
  }

  @override
  String get rollingOut => 'Déploiement en cours';

  @override
  String get pollingChallenges => 'Vérification de nouveaux challenges';

  @override
  String get unexpectedError => 'Une erreur inattendue s\'est produite.';

  @override
  String get pollingFailNoNetworkConnection => 'L\'interrogation a échoué. Le serveur est injoignable.';

  @override
  String get useDeviceLocaleTitle => 'Utiliser la langue de l\'appareil';

  @override
  String get useDeviceLocaleDescription => 'Utilisez la langue de l\'appareil si elle est prise en charge, sinon l\'anglais par défaut.';

  @override
  String get language => 'Langue';

  @override
  String get authenticateToShowOtp => 'Veuillez vous authentifier pour afficher un mot de passe à usage unique.';

  @override
  String get authenticateToUnLockToken => 'Veuillez vous authentifier pour modifier l\'état de verrouillage du jeton.';

  @override
  String get biometricRequiredTitle => 'La biométrie n\'est pas configurée';

  @override
  String get biometricHint => 'Authentification requise';

  @override
  String get biometricNotRecognized => 'Pas reconnu. Réessayer.';

  @override
  String get biometricSuccess => 'Authentification réussie';

  @override
  String get deviceCredentialsRequiredTitle => 'Les informations d\'identification de l\'appareil ne sont pas configurées';

  @override
  String get deviceCredentialsSetupDescription => 'Configurer les informations d\'identification de l\'appareil dans les paramètres de l\'appareil';

  @override
  String get signInTitle => 'Authentification requise';

  @override
  String get goToSettingsButton => 'Aller aux paramètres';

  @override
  String get goToSettingsDescription => 'L\'authentification par identifiants ou biométrie n\'est pas configurée sur votre appareil. Veuillez le configurer dans les paramètres de l\'appareil.';

  @override
  String get lockOut => 'L\'authentification biométrique est désactivée. Veuillez verrouiller et déverrouiller votre écran pour l\'activer.';

  @override
  String get authNotSupportedTitle => 'Informations d\'identification de l\'appareil ou données biométriques requises';

  @override
  String get authNotSupportedBody => 'Cette action nécessite que l\'appareil soit sécurisé par des identifiants ou des données biométriques.';

  @override
  String get lock => 'Bloquer';

  @override
  String get unlock => 'Ouvrir';

  @override
  String get noResultTitle => 'Aucun jeton n\'est encore stocké.';

  @override
  String get noResultText1 => 'Appuyez sur le \n';

  @override
  String get noResultText2 => 'bouton pour commencer!';

  @override
  String onBoardingTitle1(String appName) {
    return '$appName';
  }

  @override
  String get onBoardingText1 => 'Authentification à deux facteurs\nrendue facile';

  @override
  String get onBoardingTitle2 => 'Sécurité Maximale';

  @override
  String get onBoardingText2 => 'Stockez les jetons sur votre \nappareil en toute sécurité\nProtégé par votre biométrie';

  @override
  String get onBoardingTitle3 => 'Rendez-nous visite sur Github';

  @override
  String get onBoardingText3 => 'Cette application est open source';

  @override
  String get errorLogTitle => 'Journaux d\'erreurs';

  @override
  String get sendErrorHint => 'Envoyez-nous le journal des erreurs par courrier électronique';

  @override
  String get enableVerboseLogging => 'Activer la journalisation verbeuse';

  @override
  String get clearErrorLogHint => 'Efface le fichier journal des erreurs locales';

  @override
  String get logMenu => 'Menu journal';

  @override
  String get sendErrorDialogHeader => 'Envoyer par e-mail';

  @override
  String get ok => 'Ok';

  @override
  String get noLogToSend => 'Il y a un journal à envoyer';

  @override
  String get errorLogFileAttached => 'Le fichier journal des erreurs est joint';

  @override
  String get errorLogCleared => 'Journaux d\'erreur effacés';

  @override
  String get showDetails => 'Afficher les détails';

  @override
  String get open => 'Ouvrir';

  @override
  String get sendErrorDialogBody => 'Une erreur inattendue est survenue dans l\'application. L\'information suivante peut être transmise aux développeurs par email afin d\'aider à corriger cette erreur dans le futur.';

  @override
  String get noFbToken => 'Pas de jeton Firebase';

  @override
  String get firebaseToken => 'Jeton Firebase';

  @override
  String get noPublicKey => 'Pas de clé publique';

  @override
  String get publicKey => 'Clé publique';

  @override
  String get editToken => 'Modifier le jeton';

  @override
  String get edit => 'Modifier';

  @override
  String get save => 'Enregistrer';

  @override
  String get validFor => 'Valide pour';

  @override
  String get validUntil => 'Valide jusqu\'à';

  @override
  String get deleteLockedToken => 'Veuillez vous authentifier pour supprimer le jeton verrouillé.';

  @override
  String get editLockedToken => 'Veuillez vous authentifier pour modifier le jeton verrouillé.';

  @override
  String get uncollapseLockedFolder => 'Veuillez vous authentifier pour ouvrir le dossier verrouillé.';

  @override
  String get renameTokenFolder => 'Renommer le dossier';

  @override
  String get addANewFolder => 'Créer un nouveau dossier';

  @override
  String get folderName => 'Nom du dossier';

  @override
  String get retryRollout => 'Réessayer le déploiement';

  @override
  String get generatingRSAKeyPair => 'Génération de la paire de clés RSA';

  @override
  String get generatingRSAKeyPairFailed => 'La génération de la paire de clés RSA a échoué';

  @override
  String get sendingRSAPublicKey => 'Sending public RSA key';

  @override
  String get sendingRSAPublicKeyFailed => 'Sending public RSA key failed';

  @override
  String get parsingResponse => 'Analyse de la réponse';

  @override
  String get parsingResponseFailed => 'L\'analyse de la réponse a échoué';

  @override
  String get rolloutCompleted => 'Déploiement terminé';

  @override
  String get authToAcceptPushRequest => 'Please authenticate to accept the push request.';

  @override
  String get authToDeclinePushRequest => 'Please authenticate to decline the push request.';

  @override
  String get incomingAuthRequestError => 'The message didn\'t provided the needed data or the data was malformed.';

  @override
  String get imageUrl => 'Image URL';

  @override
  String get errorRollOutSSLHandshakeFailed => 'SSL handshake failed. Roll-out not possible.';

  @override
  String get errorWhenPullingChallenges => 'An error occured when polling for challenges';

  @override
  String errorRollOutTokenExpired(Object name) {
    return 'The token $name has expired. Roll-out not possible. Token removed.';
  }
}
