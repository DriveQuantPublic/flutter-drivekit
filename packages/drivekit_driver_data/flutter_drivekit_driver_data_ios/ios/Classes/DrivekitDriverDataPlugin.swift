import Flutter
import UIKit
import DriveKitDriverDataModule

extension FlutterError: Error {}

public class DrivekitDriverDataPlugin: NSObject, FlutterPlugin, IOSDriverDataApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSDriverDataApi & NSObjectProtocol = DrivekitDriverDataPlugin.init()

        IOSDriverDataApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }
}
