import Flutter
import UIKit
import DriveKitCoreModule

extension FlutterError: Error {}

public class DrivekitCorePlugin: NSObject, FlutterPlugin, IOSCoreApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : IOSCoreApi & NSObjectProtocol = DrivekitCorePlugin.init()

        IOSCoreApiSetup.setUp(binaryMessenger: messenger, api: api);
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    public func setApiKey(key:String) {
        DriveKit.shared.setApiKey(key: key)
    }

    public func setUserId(userId:String) {
        DriveKit.shared.setUserId(userId: userId)
    }

    func isTokenValid() throws -> Bool {
        return DriveKit.shared.isTokenValid()
    }
}
