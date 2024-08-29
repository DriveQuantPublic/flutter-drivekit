import Flutter
import UIKit
import DriveKitCoreModule

extension FlutterError: Error {}

public class DriveKitCorePlugin: NSObject, FlutterPlugin, IOSCoreApi {
    var flutterAPI: FlutterCoreApi?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSCoreApi & NSObjectProtocol = DriveKitCorePlugin.init(binaryMessenger: messenger )

        IOSCoreApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        self.flutterAPI = FlutterCoreApi(binaryMessenger: binaryMessenger)
        configureDriveKitDelegate()
        configureDeviceConfigurationDelegate()
    }

    public func getApiKey() throws -> String? {
        return DriveKit.shared.config.getApiKey()
    }

    public func setApiKey(key: String) {
        DriveKit.shared.setApiKey(key: key)
    }

    public func setUserId(userId: String) {
        DriveKit.shared.setUserId(userId: userId)
    }

    public func getUserId() -> String? {
        return DriveKit.shared.config.getUserId()
    }

    public func reset() {
        DriveKit.shared.reset()
    }

    func isTokenValid() throws -> Bool {
        return DriveKit.shared.isTokenValid()
    }

    func deleteAccount(instantDeletion: Bool) throws {
        DriveKit.shared.deleteAccount(instantDeletion: instantDeletion)
    }

    func enableLogging(showInConsole: Bool) throws {
        DriveKit.shared.enableLogging(showInConsole: showInConsole)
    }

    func disableLogging(showInConsole: Bool) throws {
        DriveKit.shared.disableLogging(showInConsole: showInConsole)
    }

    func getLogUriFile() throws -> String? {
        return DriveKitLog.shared.getZippedLogFilesUrl()?.absoluteString
    }

    private func configureDriveKitDelegate() {
        DriveKit.shared.addDriveKitDelegate(self)
    }

    private func configureDeviceConfigurationDelegate() {
        DriveKit.shared.addDeviceConfigurationDelegate(self)
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

extension DriveKitCorePlugin: DriveKitDelegate {
    public func driveKitDidConnect(_ driveKit: DriveKitCoreModule.DriveKit) {
        executeOnMainThread {
            self.flutterAPI?.driveKitDidConnect { result in
                switch result {
                case .success:
                    print("DriveKit did connect successfully.")
                case .failure(let error):
                    print("Error connecting DriveKit: \(error.localizedDescription)")
                }
            }
        }
    }

    public func driveKitDidDisconnect(_ driveKit: DriveKitCoreModule.DriveKit) {
        executeOnMainThread {
            self.flutterAPI?.driveKitDidDisconnect { result in
                switch result {
                case .success:
                    print("DriveKit did disconnect successfully.")
                case .failure(let error):
                    print("Error disconnecting DriveKit: \(error.localizedDescription)")
                }
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, didReceiveAuthenticationError error: DriveKitCoreModule.RequestError) {
        let pigeonError = PigeonRequestError.init(from: error)
        executeOnMainThread {
            self.flutterAPI?.driveKitDidReceiveAuthenticationError(error: pigeonError) { result in
                switch result {
                case .success:
                    print("DriveKit did receive authentication error successfully.")
                case .failure(let error):
                    print("Error receiving authentication error in DriveKit: \(error.localizedDescription)")
                }
            }
        }
    }

    public func userIdUpdateStatusChanged(status: DriveKitCoreModule.UpdateUserIdStatus, userId: String?) {
        let pigeonStatus = PigeonUpdateUserIdStatus.init(from: status)
        executeOnMainThread {
            self.flutterAPI?.userIdUpdateStatusChanged(status: pigeonStatus, userId: userId) { result in
                switch result {
                case .success:
                    print("User ID update status changed successfully.")
                case .failure(let error):
                    print("Error changing user ID update status: \(error.localizedDescription)")
                }
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, accountDeletionCompleted status: DriveKitCoreModule.DeleteAccountStatus) {
        let pigeonStatus = PigeonDeleteAccountStatus.init(from: status)
        executeOnMainThread {
            self.flutterAPI?.driveKitAccountDeletionCompleted(status: pigeonStatus) { result in
                switch result {
                case .success:
                    print("DriveKit account deletion completed successfully.")
                case .failure(let error):
                    print("Error completing account deletion in DriveKit: \(error.localizedDescription)")
                }
            }
        }
    }

    public func driveKit(_ driveKit: DriveKitCoreModule.DriveKit, backgroundFetchStatusChanged status: DriveKitCoreModule.DriveKitBackgroundFetchStatus) {
        let pigeonStatus = PigeonBackgroundFetchStatus.init(from: status)
        executeOnMainThread {
            self.flutterAPI?.driveKitBackgroundFetchStatusChanged(status: pigeonStatus) { result in
                switch result {
                case .success:
                    print("DriveKit background fetch status changed successfully.")
                case .failure(let error):
                    print("Error changing background fetch status in DriveKit: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension DriveKitCorePlugin: DKDeviceConfigurationDelegate {
    public func deviceConfigurationDidChange(event: DKDeviceConfigurationEvent) {
        let event = PigeonDeviceConfigurationEvent.init(from: event)
        executeOnMainThread {
            self.flutterAPI?.onDeviceConfigurationChanged(event: event) { _ in
                print("Device configuration event: \(event)")
            }
        }
    }
}
