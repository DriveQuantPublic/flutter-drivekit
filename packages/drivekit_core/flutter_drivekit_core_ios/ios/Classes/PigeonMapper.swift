import DriveKitCoreModule

extension PigeonDeleteAccountStatus {
    init(from status: DeleteAccountStatus) {
        switch status {
        case .success:
            self = .success
        case .failedToDelete:
            self = .failedToDelete
        case .forbidden:
            self = .forbidden
        @unknown default:
            fatalError()
        }
    }
}
extension PigeonRequestError {
    init(from status: RequestError) {
        switch status {
        case .wrongUrl:
            self = .wrongUrl
        case .noNetwork:
            self = .noNetwork
        case .unauthenticated:
            self = .unauthenticated
        case .forbidden:
            self = .forbidden
        case .serverError:
            self = .serverError
        case .clientError:
            self = .clientError
        case .limitReached:
            self = .limitReached
        case .unknownError:
            self = .unknownError
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonUpdateUserIdStatus {
    init(from status: UpdateUserIdStatus) {
        switch status {
        case .updated:
            self = .updated
        case .failedToUpdate:
            self = .failedToUpdate
        case .invalidUserId:
            self = .invalidUserId
        case .alreadyUsed:
            self = .alreadyUsed
        case .savedForRepost:
            self = .savedForRepost
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonBackgroundFetchStatus {
    init(from status: DriveKitCoreModule.DriveKitBackgroundFetchStatus) {
        switch status {
        case .started:
            self = .started
        case .completed:
            self = .completed
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonDeviceConfigurationEvent {
    init(from event: DKDeviceConfigurationEvent) {
        switch event.type {
        case .locationPermission:
                if event.isValid {
                    self = .locationPermissionValid
                } else {
                    self = .locationPermissionInvalid
                }
        case .locationSensor:
                if event.isValid {
                    self = .locationSensorValid
                } else {
                    self = .locationSensorInvalid
                }
        case .activityPermission:
                if event.isValid {
                    self = .activityPermissionValid
                } else {
                    self = .activityPermissionInvalid
                }
        case .bluetoothPermission:
                if event.isValid {
                    self = .bluetoothPermissionValid
                } else {
                    self = .bluetoothPermissionInvalid
                }
        case .notificationPermission:
                if event.isValid {
                    self = .notificationPermissionValid
                } else {
                    self = .notificationPermissionInvalid
                }
        case .bluetoothSensor:
                if event.isValid {
                    self = .bluetoothSensorValid
                } else {
                    self = .bluetoothSensorInvalid
                }
        case .lowPowerMode:
                if event.isValid {
                    self = .lowPowerModeValid
                } else {
                    self = .lowPowerModeInvalid
                }
        @unknown default:
                fatalError()
        }
    }
}
