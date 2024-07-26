import Flutter
import UIKit
import DriveKitCoreModule

extension FlutterError: Error {}

public class DrivekitCorePlugin: NSObject, FlutterPlugin, IOSCoreApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSCoreApi & NSObjectProtocol = DrivekitCorePlugin.init()

        IOSCoreApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    public func getApiKey() throws -> String? {
        return DriveKit.shared.config.getApiKey()
    }

    public func setApiKey(key: String) {
        DriveKit.shared.setApiKey(key: key)
    }

    public func setUserId(userId: String) {
        DriveKit.shared.setUserId(userId: userId)
    }

    public func getUserId() -> String? {
        return DriveKit.shared.config.getUserId()
    }

    public func reset() {
        DriveKit.shared.reset()
    }

    func isTokenValid() throws -> Bool {
        return DriveKit.shared.isTokenValid()
    }

    func deleteAccount(instantDeletion: Bool) throws {
        DriveKit.shared.deleteAccount(instantDeletion: instantDeletion)
    }

    func disableLogging(showInConsole: Bool) throws {
        DriveKit.shared.disableLogging(showInConsole: showInConsole)
    }
}
