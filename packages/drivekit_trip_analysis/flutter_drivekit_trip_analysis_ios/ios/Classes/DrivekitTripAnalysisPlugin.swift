import Flutter
import UIKit
import DriveKitTripAnalysisModule
import DriveKitCoreModule

extension FlutterError: Error {}

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi, DriveKitDelegate {
    var flutterAPI: FlutterTripAnalysisApi? = nil

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripAnalysisApi & NSObjectProtocol = DrivekitTripAnalysisPlugin.init(binaryMessenger: messenger )
        IOSTripAnalysisApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        self.flutterAPI = FlutterTripAnalysisApi(binaryMessenger: binaryMessenger)
        configureDriveKitDelegate()
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    public func activateAutoStart(activate: Bool) throws {
        DriveKitTripAnalysis.shared.activateAutoStart(enable: activate)
    }

    public func activateCrashDetection(activate: Bool) throws {
        DriveKitTripAnalysis.shared.activateCrashDetection(activate)
    }

    public func startTrip() throws {
        DriveKitTripAnalysis.shared.startTrip()
    }

    public func stopTrip() {
        DriveKitTripAnalysis.shared.stopTrip()
    }

    public func cancelTrip() {
        DriveKitTripAnalysis.shared.cancelTrip()
    }

    func isTripRunning() throws -> Bool {
        return DriveKitTripAnalysis.shared.isTripRunning()
    }

    private func configureDriveKitDelegate(){
        DriveKit.shared.addDriveKitDelegate(self)
    }
}
