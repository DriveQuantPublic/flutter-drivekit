import Flutter
import UIKit
import DriveKitTripAnalysisModule
import DriveKitCoreModule

extension FlutterError: Error {}

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin, IOSTripAnalysisApi {
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

extension DrivekitTripAnalysisPlugin: DriveKitDelegate {
    public func driveKitDidConnect(_ driveKit: DriveKitCoreModule.DriveKit) {
        flutterAPI?.driveKitDidConnect { result in
            switch result {
            case .success():
                print("DriveKit did connect successfully.")
            case .failure(let error):
                print("Error connecting DriveKit: \(error.localizedDescription)")
            }
        }
    }

    public func driveKitDidDisconnect(_ driveKit: DriveKitCoreModule.DriveKit) {
        flutterAPI?.driveKitDidDisconnect { result in
            switch result {
            case .success():
                print("DriveKit did disconnect successfully.")
            case .failure(let error):
                print("Error disconnecting DriveKit: \(error.localizedDescription)")
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, didReceiveAuthenticationError error: DriveKitCoreModule.RequestError) {
        guard let pigeonError = PigeonRequestError(rawValue: error.rawValue) else { return }
        flutterAPI?.driveKitDidReceiveAuthenticationError(error: pigeonError) { result in
            switch result {
            case .success():
                print("DriveKit did receive authentication error successfully.")
            case .failure(let error):
                print("Error receiving authentication error in DriveKit: \(error.localizedDescription)")
            }
        }
    }

    public func userIdUpdateStatusChanged(status: DriveKitCoreModule.UpdateUserIdStatus, userId: String?) {
        guard let pigeonStatus = PigeonUpdateUserIdStatus(rawValue: status.rawValue) else { return }
        flutterAPI?.userIdUpdateStatusChanged(status: pigeonStatus, userId: userId) { result in
            switch result {
            case .success():
                print("User ID update status changed successfully.")
            case .failure(let error):
                print("Error changing user ID update status: \(error.localizedDescription)")
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, accountDeletionCompleted status: DriveKitCoreModule.DeleteAccountStatus) {
        guard let pigeonStatus = PigeonDeleteAccountStatus(rawValue: status.rawValue) else { return }
        flutterAPI?.driveKitAccountDeletionCompleted(status: pigeonStatus) { result in
            switch result {
            case .success():
                print("DriveKit account deletion completed successfully.")
            case .failure(let error):
                print("Error completing account deletion in DriveKit: \(error.localizedDescription)")
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, backgroundFetchStatusChanged status: DriveKitCoreModule.DriveKitBackgroundFetchStatus) {
        guard let pigeonStatus = PigeonBackgroundFetchStatus(rawValue: status.rawValue) else { return }
        flutterAPI?.driveKitBackgroundFetchStatusChanged(status: pigeonStatus) { result in
            switch result {
            case .success():
                print("DriveKit background fetch status changed successfully.")
            case .failure(let error):
                print("Error changing background fetch status in DriveKit: \(error.localizedDescription)")
            }
        }
    }
}


