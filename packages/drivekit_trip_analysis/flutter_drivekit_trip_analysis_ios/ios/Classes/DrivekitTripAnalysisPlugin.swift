import Flutter
import UIKit
import DriveKitTripAnalysisModule

extension FlutterError: Error {}

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi {
    var flutterAPI: FlutterTripAnalysisApi? = nil

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : IOSTripAnalysisApi & NSObjectProtocol = DrivekitTripAnalysisPlugin.init(binaryMessenger: messenger )
        IOSTripAnalysisApiSetup.setUp(binaryMessenger: messenger, api: api);
    }

    init(binaryMessenger: FlutterBinaryMessenger) {
        self.flutterAPI = FlutterTripAnalysisApi(binaryMessenger: binaryMessenger)
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    public func activateAutoStart(activate: Bool) throws {
        DriveKitTripAnalysis.shared.activateAutoStart(enable: activate)
    }
}
