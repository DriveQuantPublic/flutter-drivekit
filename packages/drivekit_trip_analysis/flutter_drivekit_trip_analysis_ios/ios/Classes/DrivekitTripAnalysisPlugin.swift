import Flutter
import UIKit
import DriveKitTripAnalysisModule

extension FlutterError: Error {}

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : IOSTripAnalysisApi & NSObjectProtocol = DrivekitTripAnalysisPlugin.init()

        IOSTripAnalysisApiSetup.setUp(binaryMessenger: messenger, api: api);
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    public func activateAutoStart(activate: Bool) throws {
        DriveKitTripAnalysis.shared.activateAutoStart(enable: activate)
    }

    func startTrip() throws {
        DriveKitTripAnalysis.shared.startTrip()
    }
}
