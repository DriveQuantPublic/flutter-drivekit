import Flutter
import UIKit
import DriveKitCoreModule
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

    public func setStopTimeOut(timeOut: Int64) {
        DriveKitTripAnalysis.shared.setStopTimeOut(timeOut: Int(timeOut))
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

    func getTripMetadata() -> [String: String]? {
        return DriveKitTripAnalysis.shared.getTripMetadata()
    }

    func updateTripMetadata(key: String, value: String?) {
        DriveKitTripAnalysis.shared.updateTripMetadata(key: key, value: value)
    }

    func setTripMetadata(metadata: [String: String]?) {
        DriveKitTripAnalysis.shared.setTripMetadata(metadata)
    }

    func deleteTripMetadata(key: String) {
        DriveKitTripAnalysis.shared.deleteTripMetadata(key: key)
    }

    func deleteAllTripMetadata() {
        DriveKitTripAnalysis.shared.deleteTripMetadata()
    }

    func getCurrentTripInfo() -> PigeonCurrentTripInfo? {
        let nativeTripInfo = DriveKitTripAnalysis.shared.getCurrentTripInfo()
        if let nativeTripInfo {
            let currentTripInfo = PigeonCurrentTripInfo.init(from: nativeTripInfo)
            return currentTripInfo
        }
        return nil
    }

    func getLastTripLocation() -> PigeonLastTripLocation? {
        let nativeLastTripLocation = DriveKitTripAnalysis.shared.getLastTripLocation()
        if let nativeLastTripLocation {
            let lastTripLocation = PigeonLastTripLocation.init(from: nativeLastTripLocation)
            return lastTripLocation
        }
        return nil
    }

    func isTripSharingAvailable() -> Bool {
        return DriveKitTripAnalysis.shared.tripSharing.isAvailable()
    }
    
    func createTripSharingLink(durationInSeconds: Int64, completion: @escaping (Result<PigeonCreateTripSharingLinkResponse, Error>) -> Void) {
        DriveKitTripAnalysis.shared.tripSharing.createLink(durationInSeconds: Int(durationInSeconds)) { status, data in
            let pigeonStatus = PigeonCreateTripSharingLinkStatus(from: status)
            let pigeonData: PigeonTripSharingLink?
            if let data {
                pigeonData = PigeonTripSharingLink.init(from: data)
            } else {
                pigeonData = nil
            }
            completion(Result.success(PigeonCreateTripSharingLinkResponse(status: pigeonStatus, data: pigeonData)))
        }
    }
    
    func getTripSharingLink(synchronizationType: PigeonSynchronizationType, completion: @escaping (Result<PigeonGetTripSharingLinkResponse, any Error>) -> Void){
        DriveKitTripAnalysis.shared.tripSharing.getLink(synchronizationType: SynchronizationType(from: synchronizationType)) { status, data in
            let pigeonStatus = PigeonGetTripSharingLinkStatus(from: status)
            let pigeonData: PigeonTripSharingLink?
            if let data {
                pigeonData = PigeonTripSharingLink.init(from: data)
            } else {
                pigeonData = nil
            }
            completion(Result.success(PigeonGetTripSharingLinkResponse(status: pigeonStatus, data: pigeonData)))
        }
    }

    func revokeTripSharingLink(completion: @escaping (Result<PigeonRevokeTripSharingLinkStatus, Error>) -> Void) {
        DriveKitTripAnalysis.shared.tripSharing.revokeLink { status in
            completion(Result.success(PigeonRevokeTripSharingLinkStatus(from: status)))
        }
    }
}

extension DriveKitTripAnalysisPlugin: TripListener {
    public func tripRecordingStarted(state: any DKTripRecordingStartedState) {
        let pigeonTripRecordingStartedState = PigeonTripRecordingStartedState.init(from: state)

        executeOnMainThread {
            self.flutterAPI?.tripRecordingStarted(
                state: pigeonTripRecordingStartedState) { result in
                    switch result {
                    case .success:
                        print("tripRecordingStarted event sent with success.")
                    case .failure(let error):
                        print("Error when sending tripRecordingStarted event: \(error.localizedDescription)")
                    }
                }
        }
    }

    public func tripRecordingConfirmed(state: any DKTripRecordingConfirmedState) {
        let pigeonTripRecordingConfirmedState = PigeonTripRecordingConfirmedState.init(from: state)

        executeOnMainThread {
            self.flutterAPI?.tripRecordingConfirmed(
                state: pigeonTripRecordingConfirmedState) { result in
                    switch result {
                    case .success:
                        print("tripRecordingConfirmed event sent with success.")
                    case .failure(let error):
                        print("Error when sending tripRecordingConfirmed event: \(error.localizedDescription)")
                    }
                }
        }
    }

    public func tripRecordingCanceled(state: any DKTripRecordingCanceledState) {
        let pigeonTripRecordingCanceledState = PigeonTripRecordingCanceledState.init(from: state)

        executeOnMainThread {
            self.flutterAPI?.tripRecordingCanceled(
                state: pigeonTripRecordingCanceledState) { result in
                    switch result {
                    case .success:
                        print("tripRecordingCanceled event sent with success.")
                    case .failure(let error):
                        print("Error when sending tripRecordingCanceled event: \(error.localizedDescription)")
                    }
                }
        }
    }

    public func tripRecordingFinished(state: any DKTripRecordingFinishedState) {
        let pigeonTripRecordingFinishedState = PigeonTripRecordingFinishedState.init(from: state)

        executeOnMainThread {
            self.flutterAPI?.tripRecordingFinished(
                state: pigeonTripRecordingFinishedState) { result in
                    switch result {
                    case .success:
                        print("tripRecordingFinished event sent with success.")
                    case .failure(let error):
                        print("Error when sending tripRecordingFinished event: \(error.localizedDescription)")
                    }
                }
        }
    }

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

    public func tripFinished(responseStatus: TripResponseStatus) {
        let pigeonTripResponseStatus = PigeonTripResponseStatus.init(from: responseStatus)

        executeOnMainThread {
            self.flutterAPI?.tripFinished(
                response: pigeonTripResponseStatus) { result in
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
                    print("Trip canceled.")
                case .failure(let error):
                    print("Error on trip canceled: \(error.localizedDescription)")
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
