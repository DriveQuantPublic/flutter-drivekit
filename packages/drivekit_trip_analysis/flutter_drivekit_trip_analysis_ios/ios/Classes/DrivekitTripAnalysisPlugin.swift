import Flutter
import UIKit
import DriveKitTripAnalysisModule
import CoreLocation

extension FlutterError: Error {}

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi {
    var flutterAPI: FlutterTripAnalysisApi?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripAnalysisApi & NSObjectProtocol = DrivekitTripAnalysisPlugin.init(binaryMessenger: messenger )

        IOSTripAnalysisApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        self.flutterAPI = FlutterTripAnalysisApi(binaryMessenger: binaryMessenger)
        configureDriveTripDelegate()
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

    func setMonitorPotentialTripStart(activate: Bool) {
        DriveKitTripAnalysis.shared.monitorPotentialTripStart = activate
    }

    func getMonitorPotentialTripStart() throws -> Bool {
        return DriveKitTripAnalysis.shared.monitorPotentialTripStart
    }

    func setVehicle(vehicle: PigeonVehicle) throws {
        DriveKitTripAnalysis.shared.setVehicle(
            vehicle: PigeonMapper.initTripVehicle(from: vehicle)
        )
    }

    private func configureDriveTripDelegate() {
        DriveKitTripAnalysis.shared.addTripListener(self)
        }
}

extension DrivekitTripAnalysisPlugin: TripListener {
    public func tripStarted(startMode: DriveKitTripAnalysisModule.StartMode) {
        let pigeonStartMode = PigeonStartMode.init(from: startMode)
        self.flutterAPI?.tripStarted(startMode: pigeonStartMode) {result in
            switch result {
            case .success:
                print("Trip did start.")
            case .failure(let error):
                print("Error on trip start: \(error.localizedDescription)")
            }
        }
    }

    public func tripFinished(post: DriveKitTripAnalysisModule.PostGeneric, response: DriveKitTripAnalysisModule.PostGenericResponse) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func tripCancelled(cancelTrip: DriveKitTripAnalysisModule.CancelTrip) {
        let pigeonValue = PigeonCancelTrip.init(from: cancelTrip)
        self.flutterAPI?.tripCancelled(cancelTrip: pigeonValue) {result in
            switch result {
            case .success:
                print("Trip cancelled.")
            case .failure(let error):
                print("Error on trip cancelled: \(error.localizedDescription)")
            }
        }
    }

    public func tripSavedForRepost() {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func tripPoint(tripPoint: DriveKitTripAnalysisModule.TripPoint) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func beaconDetected() {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func significantLocationChangeDetected(location: CLLocation) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func sdkStateChanged(state: DriveKitTripAnalysisModule.State) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func potentialTripStart(startMode: DriveKitTripAnalysisModule.StartMode) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func crashDetected(crashInfo: DriveKitTripAnalysisModule.DKCrashInfo) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

    public func crashFeedbackSent(
        crashInfo: DriveKitTripAnalysisModule.DKCrashInfo, feedbackType: DriveKitTripAnalysisModule.DKCrashFeedbackType, severity: DriveKitTripAnalysisModule.DKCrashFeedbackSeverity
    ) {
        // TODO implement this method by calling flutter API converting any parameter to pigeonModel
    }

}
