import Flutter
import UIKit
import Security
import firebase_messaging

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FLTFirebaseMessagingPlugin.configureNotificationCenterDelegate()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "SafeTokenStorage") {
      SafeTokenStorage.register(with: registrar)
    }
  }
}

// Use the existing plugin's service, account keys, and accessibility so no migration is needed.
final class SafeTokenStorage: NSObject, FlutterPlugin {
  private let queue = DispatchQueue(label: "io.edumfa.authenticator.token_storage")

  static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "io.edumfa.authenticator/token_storage", binaryMessenger: registrar.messenger()
    )
    registrar.addMethodCallDelegate(SafeTokenStorage(), channel: channel)
  }

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "write" else {
      result(FlutterMethodNotImplemented)
      return
    }
    guard let arguments = call.arguments as? [String: String],
          let key = arguments["key"], let value = arguments["value"] else {
      result(FlutterError(code: "invalid_arguments", message: "Expected a key and value.", details: nil))
      return
    }
    queue.async {
      let status = SafeKeychainWriter.write(key: key, value: value)
      DispatchQueue.main.async {
        if status == errSecSuccess {
          result(nil)
        } else {
          result(FlutterError(code: "keychain_write_failed",
                              message: "Token changes could not be saved.", details: Int(status)))
        }
      }
    }
  }

}

enum SafeKeychainWriter {
  static func write(
    key: String, value: String,
    update: (CFDictionary, CFDictionary) -> OSStatus = { SecItemUpdate($0, $1) },
    add: (CFDictionary) -> OSStatus = { SecItemAdd($0, nil) }
  ) -> OSStatus {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: "flutter_secure_storage_service",
      kSecAttrAccount: key,
    ]
    let data = Data(value.utf8)
    let status = update(query as CFDictionary, [kSecValueData: data] as CFDictionary)
    guard status == errSecItemNotFound else { return status }

    var item = query
    item[kSecValueData] = data
    item[kSecAttrAccessible] = kSecAttrAccessibleWhenUnlocked
    item[kSecAttrSynchronizable] = false
    let added = add(item as CFDictionary)
    // Another engine may have inserted the same key between update and add.
    if added == errSecDuplicateItem {
      return update(query as CFDictionary, [kSecValueData: data] as CFDictionary)
    }
    return added
  }
}
