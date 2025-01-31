// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(name) => "Confirmer la suppression de ${name}?";

  static String m1(name) => "Le déploiement du jeton ${name} a échoué.";

  static String m2(name) =>
      "El despliegue del token ${name} ha fallado, no se ha podido acceder al servidor.";

  static String m3(e) =>
      "Le déploiement a échoué suite à une erreur inconnue: ${e}";

  static String m4(name) => "Le jeton ${name} a expiré.";

  static String m5(name) =>
      "Une erreur s\'est produite lors de l\'interrogation des défis de ${name}";

  static String m6(serial) => "Echec de la requête pour ${serial}.";

  static String m7(issuer, account) =>
      "Envoyé par ${issuer} pour votre compte : \"${account}\"";

  static String m8(statusCode) => "Code d\'état : ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accepter"),
        "addToken": MessageLookupByLibrary.simpleMessage("Ajouter un jeton"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Tous les jetons ont été synchronisés."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "Cette action nécessite que l\'appareil soit sécurisé par des identifiants ou des données biométriques."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Informations d\'identification de l\'appareil ou données biométriques requises"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Veuillez vous authentifier pour accepter la demande de connexion."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Veuillez vous authentifier pour refuser la demande de connexion."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Authentification"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Authentification requise"),
        "biometricNotRecognized":
            MessageLookupByLibrary.simpleMessage("Pas reconnu. Réessayer."),
        "biometricRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "La biométrie n\'est pas configurée"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Authentification réussie"),
        "cameraPermissionPermanentlyDeniedButton":
            MessageLookupByLibrary.simpleMessage("Accorder l\'autorisation"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Veuillez vérifier votre connexion réseau et réessayer."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Effacer"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Confirmer suppression"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "Il se peut que vous ne puissiez plus vous connecter si vous supprimez ce token.\nVeuillez vous assurer que vous pouvez vous connecter au compte associé sans ce token."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("La connexion a échoué."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "Impossible de signer le message."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Thème sombre"),
        "decline": MessageLookupByLibrary.simpleMessage("Refuser"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Supprimer"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Réessayer"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Erreur d\'envoi"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Malheureusement, l\'application n\'a pas pu décrypter vos jetons. Cela indique que la clé de cryptage est cassée. Vous pouvez réessayer ou supprimer les données de l\'application, ce qui supprimera les jetons dans l\'application."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Êtes-vous sûr de vouloir supprimer les données de l\'application ?"),
        "decryptErrorTitle":
            MessageLookupByLibrary.simpleMessage("Erreur de décryptage"),
        "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Veuillez vous authentifier pour supprimer le jeton verrouillé."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Les informations d\'identification de l\'appareil ne sont pas configurées"),
        "deviceCredentialsSetupDescription": MessageLookupByLibrary.simpleMessage(
            "Configurer les informations d\'identification de l\'appareil dans les paramètres de l\'appareil"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Fermer"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Veuillez vous authentifier pour modifier le jeton verrouillé."),
        "enablePolling": MessageLookupByLibrary.simpleMessage(
            "Activer l\'interrogation du serveur."),
        "errorLogCleared":
            MessageLookupByLibrary.simpleMessage("Journal d\'erreur nettoyé"),
        "errorLogEmpty": MessageLookupByLibrary.simpleMessage(
            "Le journal des erreurs est vide"),
        "errorLogTitle":
            MessageLookupByLibrary.simpleMessage("Journal d\'erreur"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Le fichier journal des erreurs est joint.\nVous pouvez remplacer ce texte par des informations supplémentaires sur l\'erreur."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Le déploiement de ce jeton n\'est plus possible."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "Échec de la prise de contact SSL. Le déploiement n\'est pas possible."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "La synchronization a échoué car le serveur est injoignable."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "generatingPhonePart": MessageLookupByLibrary.simpleMessage(
            "Générer la part du téléphone"),
        "generatingRSAKeyPair": MessageLookupByLibrary.simpleMessage(
            "Génération de la paire de clés RSA"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "La génération de la paire de clés RSA a échoué"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Aller aux paramètres"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "L\'authentification par identifiants ou biométrie n\'est pas configurée sur votre appareil. Veuillez le configurer dans les paramètres de l\'appareil."),
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licences et version"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Thème lumineux"),
        "lock": MessageLookupByLibrary.simpleMessage("Bloquer"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "L\'authentification biométrique est désactivée. Veuillez verrouiller et déverrouiller votre écran pour l\'activer."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Menu du journal"),
        "name": MessageLookupByLibrary.simpleMessage("Nom"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "Aucune application de messagerie n\'est installée ou initialisée sur cet appareil. Veuillez réessayer lorsque vous serez en mesure d\'envoyer un message électronique."),
        "noMailAppTitle": MessageLookupByLibrary.simpleMessage(
            "Aucune application de messagerie trouvée"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("Pas de connexion au réseau."),
        "noResultText1":
            MessageLookupByLibrary.simpleMessage("Appuyez sur le \n"),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage("bouton pour commencer!"),
        "noResultTitle": MessageLookupByLibrary.simpleMessage(
            "Aucun jeton n\'est encore stocké."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Authentification à deux facteurs\nrendue facile"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Stockez les jetons sur votre \nappareil en toute sécurité\nProtégé par votre biométrie"),
        "onBoardingText3": MessageLookupByLibrary.simpleMessage(
            "Cette application est open source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Sécurité Maximale"),
        "onBoardingTitle3": MessageLookupByLibrary.simpleMessage(
            "Rendez-nous visite sur Github"),
        "open": MessageLookupByLibrary.simpleMessage("Ouvrir"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Analyse de la réponse"),
        "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
            "L\'analyse de la réponse a échoué"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Part du téléphone:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Échec de la requête."),
        "pollingFailedFor": m6,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Politique de confidentialité"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "La demande push n\'a pas pu être traitée."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Jeton de type Push"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Demander des challenges push depuis le serveur périodiquement. Activer cette fonction si les challenges push ne sont pas reçus normalement."),
        "retryRollout":
            MessageLookupByLibrary.simpleMessage("Réessayer le déploiement"),
        "rollingOut":
            MessageLookupByLibrary.simpleMessage("Déploiement en cours"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Déploiement terminé"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Clé secrète"),
        "send": MessageLookupByLibrary.simpleMessage("Envoyer"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Un e-mail pré-rempli est créé.\nIl contient des informations sur l\'application, l\'erreur et le périphérique.\nVous pouvez modifier l\'e-mail avant de l\'envoyer.\nVous pouvez voir ici comment nous utilisons les informations:"),
        "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
            "Envoi de la clé publique RSA"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "L\'envoi de la clé publique RSA a échoué"),
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Généralités"),
        "showDetails":
            MessageLookupByLibrary.simpleMessage("Afficher les détails"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Afficher"),
        "showPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Afficher la déclaration de confidentialité"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Authentification requise"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Synchroniser"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "La synchronisation a échoué pour ces jetons, veuillez reéssayer:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchoniser les jetons Push"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchroniser les jetons Push avec le serveur eduMFA."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Synchroniser les jetons."),
        "theme": MessageLookupByLibrary.simpleMessage("Thème"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Ces jetons ne supportent pas la synchronisation et doivent être de nouveau générés:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Une erreur inattendue s\'est produite."),
        "verboseLogging":
            MessageLookupByLibrary.simpleMessage("Journalisation verbeuse")
      };
}
