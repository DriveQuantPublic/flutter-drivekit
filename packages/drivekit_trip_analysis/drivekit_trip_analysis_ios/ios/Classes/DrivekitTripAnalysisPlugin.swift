import Flutter
import UIKit

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
}
