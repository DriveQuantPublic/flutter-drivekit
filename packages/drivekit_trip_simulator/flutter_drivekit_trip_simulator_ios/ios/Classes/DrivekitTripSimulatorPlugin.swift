import Flutter
import UIKit
import DriveKitTripSimulatorModule

extension FlutterError: Error {}

public class DrivekitTripSimulatorPlugin: NSObject, FlutterPlugin, IOSTripSimulatorApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripSimulatorApi & NSObjectProtocol = DrivekitTripSimulatorPlugin.init()

        IOSTripSimulatorApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }
}
