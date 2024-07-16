import Flutter
import UIKit

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
}
