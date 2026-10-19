import Flutter
import UIKit
import XCTest
import Security
@testable import Runner

class RunnerTests: XCTestCase {

  func testFailedUpdateDoesNotAttemptReplacement() {
    var additions = 0
    let status = SafeKeychainWriter.write(
      key: "test", value: "new",
      update: { _, _ in errSecInteractionNotAllowed },
      add: { _ in additions += 1; return errSecSuccess }
    )
    XCTAssertEqual(status, errSecInteractionNotAllowed)
    XCTAssertEqual(additions, 0)
  }

  func testSuccessfulUpdateDoesNotAddAnotherItem() {
    let status = SafeKeychainWriter.write(
      key: "test", value: "new",
      update: { _, _ in errSecSuccess },
      add: { _ in XCTFail("Existing item must only be updated"); return errSecDuplicateItem }
    )
    XCTAssertEqual(status, errSecSuccess)
  }

  func testMissingItemCanBeAddedAndFailuresArePropagated() {
    let status = SafeKeychainWriter.write(
      key: "test", value: "new",
      update: { _, _ in errSecItemNotFound },
      add: { query in
        let attributes = query as NSDictionary
        XCTAssertEqual(attributes[kSecAttrAccount] as? String, "test")
        XCTAssertEqual(attributes[kSecAttrService] as? String, "flutter_secure_storage_service")
        XCTAssertEqual(attributes[kSecAttrAccessible] as? String, kSecAttrAccessibleWhenUnlocked as String)
        return errSecInteractionNotAllowed
      }
    )
    XCTAssertEqual(status, errSecInteractionNotAllowed)
  }

  func testConcurrentInsertionRetriesTheUpdateWithoutDeleting() {
    var updates = 0
    let status = SafeKeychainWriter.write(
      key: "test", value: "new",
      update: { _, _ in
        updates += 1
        return updates == 1 ? errSecItemNotFound : errSecSuccess
      },
      add: { _ in errSecDuplicateItem }
    )
    XCTAssertEqual(status, errSecSuccess)
    XCTAssertEqual(updates, 2)
  }

}
