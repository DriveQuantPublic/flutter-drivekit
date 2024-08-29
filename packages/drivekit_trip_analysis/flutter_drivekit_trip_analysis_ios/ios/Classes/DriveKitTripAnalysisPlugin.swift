import Flutter
import UIKit
import DriveKitTripAnalysisModule
import CoreLocation

extension FlutterError: Error {}

public class DriveKitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi {
    var flutterAPI: FlutterTripAnalysisApi?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripAnalysisApi & NSObjectProtocol = DriveKitTripAnalysisPlugin.init(binaryMessenger: messenger )

        IOSTripAnalysisApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        self.flutterAPI = FlutterTripAnalysisApi(binaryMessenger: binaryMessenger)
        configureDriveTripDelegate()
    }

    public func isAutoStartActivated() throws -> Bool {
        return DriveKitTripAnalysis.shared.config.autostart && DriveKitTripAnalysis.shared.config.vehicleAutoStart
    }

    public func activateAutoStart(activate: Bool) throws {
        DriveKitTripAnalysis.shared.activateAutoStart(enable: activate)
    }

    public func isCrashDetectionActivated() throws -> Bool {
        return DriveKitTripAnalysis.shared.config.crashDetection
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

    func isMonitoringPotentialTripStart() throws -> Bool {
        return DriveKitTripAnalysis.shared.monitorPotentialTripStart
    }

    func setMonitorPotentialTripStart(activate: Bool) {
        DriveKitTripAnalysis.shared.monitorPotentialTripStart = activate
    }

    func setVehicle(vehicle: PigeonVehicle) throws {
        DriveKitTripAnalysis.shared.setVehicle(
            vehicle: PigeonMapper.initTripVehicle(from: vehicle)
        )
    }

    private func configureDriveTripDelegate() {
        DriveKitTripAnalysis.shared.addTripListener(self)
    }

    func getTripResponseStatus(tripResponse: PigeonPostGenericResponse) throws -> PigeonTripResponseStatus? {
        return tripResponse.getStatus()
    }

}

extension DriveKitTripAnalysisPlugin: TripListener {
    public func tripStarted(startMode: DriveKitTripAnalysisModule.StartMode) {
        let pigeonStartMode = PigeonStartMode.init(from: startMode)
        executeOnMainThread {
            self.flutterAPI?.tripStarted(startMode: pigeonStartMode) { result in
                switch result {
                case .success:
                    print("Trip did start.")
                case .failure(let error):
                    print("Error on trip start: \(error.localizedDescription)")
                }
            }
        }
    }

    public func tripFinished(post: DriveKitTripAnalysisModule.PostGeneric, response: DriveKitTripAnalysisModule.PostGenericResponse) {
        let pigeonPostValue = PigeonPostGeneric.init(from: post)
        let pigeonResponseValue = PigeonPostGenericResponse.init(from: response)

        executeOnMainThread {
            self.flutterAPI?.tripFinished(
                post: pigeonPostValue,
                response: pigeonResponseValue) { result in
                    switch result {
                    case .success:
                        print("tripFinished event sent with success.")
                    case .failure(let error):
                        print("Error when sending tripFinished event: \(error.localizedDescription)")
                    }
                }
        }
    }

    public func tripCancelled(cancelTrip: DriveKitTripAnalysisModule.CancelTrip) {
        let pigeonValue = PigeonCancelTrip.init(from: cancelTrip)
        executeOnMainThread {
            self.flutterAPI?.tripCancelled(cancelTrip: pigeonValue) { result in
                switch result {
                case .success:
                    print("Trip cancelled.")
                case .failure(let error):
                    print("Error on trip cancelled: \(error.localizedDescription)")
                }
            }
        }
    }

    public func tripSavedForRepost() {
        executeOnMainThread {
            self.flutterAPI?.tripSavedForRepost { result in
                switch result {
                case .success:
                    print("tripSavedForRepost event sent with success.")
                case .failure(let error):
                    print("Error when sending tripSavedForRepost event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func tripPoint(tripPoint: DriveKitTripAnalysisModule.TripPoint) {
        let tripPointValue = PigeonTripPoint.init(from: tripPoint)
        executeOnMainThread {
            self.flutterAPI?.tripPoint(tripPoint: tripPointValue) { result in
                switch result {
                case .success:
                    print("tripPoint event sent with success.")
                case .failure(let error):
                    print("Error when sending tripPoint event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func beaconDetected() {
        executeOnMainThread {
            self.flutterAPI?.beaconDetected { result in
                switch result {
                case .success:
                    print("beaconDetected event sent with success.")
                case .failure(let error):
                    print("Error when sending beaconDetected event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func significantLocationChangeDetected(location: CLLocation) {
        let locationValue = PigeonLocation(from: location)
        executeOnMainThread {
            self.flutterAPI?.significantLocationChangeDetected(location: locationValue) { result in
                switch result {
                case .success:
                    print("significantLocationChangeDetected event sent with success.")
                case .failure(let error):
                    print("Error when sending significantLocationChangeDetected event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func sdkStateChanged(state: DriveKitTripAnalysisModule.State) {
        let stateValue = PigeonState.init(from: state)
        executeOnMainThread {
            self.flutterAPI?.sdkStateChanged(state: stateValue) { result in
                switch result {
                case .success:
                    print("sdkStateChanged event sent with success.")
                case .failure(let error):
                    print("Error when sending sdkStateChanged event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func potentialTripStart(startMode: DriveKitTripAnalysisModule.StartMode) {
        let pigeonStartMode = PigeonStartMode.init(from: startMode)
        executeOnMainThread {
            self.flutterAPI?.potentialTripStart(startMode: pigeonStartMode) { result in
                switch result {
                case .success:
                    print("potentialTripStart event sent with success.")
                case .failure(let error):
                    print("Error when sending potentialTripStart event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func crashDetected(crashInfo: DriveKitTripAnalysisModule.DKCrashInfo) {
        let pigeonCrashInfo = PigeonDKCrashInfo(from: crashInfo)
        executeOnMainThread {
            self.flutterAPI?.crashDetected(crashInfo: pigeonCrashInfo) { result in
                switch result {
                case .success:
                    print("crashDetected event sent with success.")
                case .failure(let error):
                    print("Error when sending crashDetected event: \(error.localizedDescription)")
                }
            }
        }
    }

    public func crashFeedbackSent(
        crashInfo: DriveKitTripAnalysisModule.DKCrashInfo, feedbackType: DriveKitTripAnalysisModule.DKCrashFeedbackType, severity: DriveKitTripAnalysisModule.DKCrashFeedbackSeverity
    ) {
        let pigeonCrashInfo = PigeonDKCrashInfo(from: crashInfo)
        let pigeonCrashFeedbackType = PigeonDKCrashFeedbackType.init(from: feedbackType)
        let pigeonCrashFeedbackSeverity = PigeonDKCrashFeedbackSeverity.init(from: severity)
        executeOnMainThread {
            self.flutterAPI?.crashFeedbackSent(
                crashInfo: pigeonCrashInfo,
                feedbackType: pigeonCrashFeedbackType,
                severity: pigeonCrashFeedbackSeverity
            ) { result in
                switch result {
                case .success:
                    print("crashFeedbackSent event sent with success.")
                case .failure(let error):
                    print("Error when sending crashFeedbackSent event: \(error.localizedDescription)")
                }
            }
        }
    }

    private func executeOnMainThread(_ task: @escaping () -> Void) {
        if Thread.isMainThread {
            task()
        } else {
            DispatchQueue.main.async {
                task()
            }
        }
    }
}
