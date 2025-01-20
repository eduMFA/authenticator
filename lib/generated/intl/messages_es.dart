// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(name) => "¿Está seguro de que desea eliminar ${name}?";

  static String m1(name) => "Error en la extracción de el token ${name}.";

  static String m2(name) =>
      "El despliegue del token ${name} ha fallado, no se ha podido acceder al servidor.";

  static String m4(name) => "El token ${name} ha caducado.";

  static String m5(name) =>
      "Se ha producido un error al buscar retos de ${name}";

  static String m6(serial) => "Fallo de sondeo para ${serial}";

  static String m7(issuer, account) =>
      "Enviado por ${issuer} para su cuenta: \"${account}\"";

  static String m8(statusCode) => "Código de estado: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Aceptar"),
        "addToken": MessageLookupByLibrary.simpleMessage("Añadir token"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "Todas los tokens están sincronizadas."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "Esta acción requiere que el dispositivo esté protegido mediante credenciales o datos biométricos."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Se requieren credenciales de dispositivo o datos biométricos"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentifíquese para aceptar la solicitud push."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentifíquese para rechazar la solicitud push."),
        "authenticateToShowOtp": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentifíquese para mostrar la contraseña de una sola vez."),
        "authenticateToUnLockToken": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentifíquese para cambiar el estado de bloqueo del token."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Autenticación"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Autenticación necesaria"),
        "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
            "No reconocido. Inténtelo de nuevo."),
        "biometricRequiredTitle":
            MessageLookupByLibrary.simpleMessage("Biometría no configurada"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Autenticación correcta"),
        "butDiscardIt": MessageLookupByLibrary.simpleMessage("pero descártelo"),
        "cameraPermissionPermanentlyDeniedButton":
            MessageLookupByLibrary.simpleMessage("Conceder permiso"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anular"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Compruebe su conexión de red e inténtelo de nuevo."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Borrar"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Confiem supresión"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "Es posible que ya no pueda iniciar sesión si elimina este token.\nAsegúrese de que puede iniciar sesión en la cuenta asociada sin este token."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Conexión fallida."),
        "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
            "No se ha podido firmar el mensaje."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Negro"),
        "decline": MessageLookupByLibrary.simpleMessage("Negar"),
        "declineIt": MessageLookupByLibrary.simpleMessage("rechazar"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Borrar"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Reintentar"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Enviar error"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Lamentablemente, la aplicación no ha podido descifrar tus tokens. Esto indica que la clave de cifrado está rota. Puedes volver a intentarlo o borrar los datos de la app, lo que eliminaría los tokens de la app."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "¿Estás seguro de que quieres borrar los datos de la aplicación?"),
        "decryptErrorTitle":
            MessageLookupByLibrary.simpleMessage("Error de descifrado"),
        "delete": MessageLookupByLibrary.simpleMessage("Borrar"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentíquese para eliminar el token bloqueado."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "No se han configurado las credenciales del dispositivo."),
        "deviceCredentialsSetupDescription": MessageLookupByLibrary.simpleMessage(
            "Configurar las credenciales del dispositivo en los ajustes del dispositivo"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Desestimar"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Por favor, autentíquese para editar el token bloqueado."),
        "enablePolling":
            MessageLookupByLibrary.simpleMessage("Activar polling"),
        "errorLogCleared":
            MessageLookupByLibrary.simpleMessage("Registro de errores borrado"),
        "errorLogEmpty": MessageLookupByLibrary.simpleMessage(
            "El registro de errores está vacío"),
        "errorLogTitle":
            MessageLookupByLibrary.simpleMessage("Registro de errores"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "Se adjunta el archivo de registro de errores.\nPuede sustituir este texto por información adicional sobre el error."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "El despliegue de este token ya no es posible."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "Ha fallado el protocolo SSL. No es posible el despliegue."),
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Error al sincronizar los tokens. No se ha podido acceder al servidor de EduMFA."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "generatingPhonePart":
            MessageLookupByLibrary.simpleMessage("Generar parte telefónico"),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Generando par de claves RSA"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Error al generar el par de claves RSA"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Ir a la configuración"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "La autenticación por credenciales o biométrica no está configurada en tu dispositivo. Por favor, configúrala en los ajustes del dispositivo."),
        "introEditToken": MessageLookupByLibrary.simpleMessage(
            "Aquí puedes editar el nombre del token y ver algunos detalles"),
        "introLockToken": MessageLookupByLibrary.simpleMessage(
            "Para mejorar la seguridad aún más, puedes bloquear los tokens.\nEntonces el token sólo se puede utilizar después de la autenticación."),
        "introPollForChallenges": MessageLookupByLibrary.simpleMessage(
            "Puedes buscar nuevos retos arrastrando hacia abajo la lista de tokens"),
        "introScanQrCode": MessageLookupByLibrary.simpleMessage(
            "Puedes escanear códigos QR para añadir tokens.\nSoportamos todos los tokens comunes de Two-Factor-Authentication y también los tokens eduMFA"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licencias y versión"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Luminoso"),
        "lock": MessageLookupByLibrary.simpleMessage("Cierre"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "La autenticación biométrica está desactivada. Bloquea y desbloquea la pantalla para activarla."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Menú de registro"),
        "name": MessageLookupByLibrary.simpleMessage("Nombre"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "No hay ninguna app de correo electrónico instalada o inicializada en este dispositivo, inténtalo de nuevo cuando puedas enviar un mensaje de correo electrónico."),
        "noMailAppTitle": MessageLookupByLibrary.simpleMessage(
            "No hay aplicación de correo electrónico"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("No hay conexión a la red."),
        "noResultText1": MessageLookupByLibrary.simpleMessage("Indique el  "),
        "noResultText2": MessageLookupByLibrary.simpleMessage(" para empezar."),
        "noResultTitle": MessageLookupByLibrary.simpleMessage(
            "Aún no hay tokens almacenadas."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Autenticación de dos factores\nmuy fácil"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Almacena fichas de forma segura en tu teléfono.\nProtegido por tus datos biométricos."),
        "onBoardingText3": MessageLookupByLibrary.simpleMessage(
            "Esta aplicación es de código abierto"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Máxima seguridad"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Visítenos en Github"),
        "open": MessageLookupByLibrary.simpleMessage("Abrir"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Analizando la respuesta"),
        "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
            "Error al analizar la respuesta"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Pieza de teléfono:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Consulta fallida."),
        "pollingFailedFor": m6,
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "No se ha podido procesar la solicitud push."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push Token"),
        "rename": MessageLookupByLibrary.simpleMessage("Renombrar"),
        "renameToken": MessageLookupByLibrary.simpleMessage("Renombrar token"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Solicita retos push al servidor periódicamente. Habilite esta opción si los retos push no se reciben normalmente."),
        "requestTriggerdByUserQuestion": MessageLookupByLibrary.simpleMessage(
            "¿Fue usted quien provocó esta petición?"),
        "retryRollout":
            MessageLookupByLibrary.simpleMessage("Reintentar despliegue"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Despliegue"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Despliegue completado"),
        "scanQrCode":
            MessageLookupByLibrary.simpleMessage("Escanear código QR"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Clave secreta"),
        "send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "Se crea un correo electrónico listo.\nContiene información sobre la app, el error y el dispositivo.\nPuedes editar el correo antes de enviarlo.\nAquí puede ver cómo utilizamos la información:"),
        "sendingRSAPublicKey":
            MessageLookupByLibrary.simpleMessage("Enviando clave pública RSA"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Error al enviar la clave pública RSA"),
        "settings": MessageLookupByLibrary.simpleMessage("Configuración"),
        "settingsGroupGeneral":
            MessageLookupByLibrary.simpleMessage("Información general"),
        "showDetails": MessageLookupByLibrary.simpleMessage("Mostrar detalles"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Mostrar"),
        "showPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Mostrar política de privacidad"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Autenticación necesaria"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Sinchronizar"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "La sincronización ha fallado para los siguientes tokens, por favor inténtelo de nuevo:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Sinchronizar push tokens"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Sinchronizar tokens con el eduMFA servidor."),
        "synchronizingTokens": MessageLookupByLibrary.simpleMessage(
            "Sincronización de los tokens."),
        "systemTheme": MessageLookupByLibrary.simpleMessage(
            "Utilizar el tema del teléfono"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "Las siguientes tokens no admiten la sincronización y deben volver a desplegarse:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Se ha producido un error inesperado."),
        "unlock": MessageLookupByLibrary.simpleMessage("Desbloquear"),
        "useDeviceLocaleDescription": MessageLookupByLibrary.simpleMessage(
            "Utilizar el idioma del dispositivo si está soportado, en caso contrario por defecto inglés."),
        "useDeviceLocaleTitle": MessageLookupByLibrary.simpleMessage(
            "Utiliza el idioma del teléfono"),
        "verboseLogging":
            MessageLookupByLibrary.simpleMessage("Registro detallado"),
        "yes": MessageLookupByLibrary.simpleMessage("Sí")
      };
}
