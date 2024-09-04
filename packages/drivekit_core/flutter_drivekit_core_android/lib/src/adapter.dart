import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// Adapts the [PigeonDeleteAccountStatus] class
/// to the [DeleteAccountStatus] class.
extension PigeonDeleteAccountStatusAdapter on PigeonDeleteAccountStatus {
  /// Converts a [PigeonDeleteAccountStatus] to a [DeleteAccountStatus].
  DeleteAccountStatus toModelImplementation() {
    return switch (this) {
      PigeonDeleteAccountStatus.success => DeleteAccountStatus.success,
      PigeonDeleteAccountStatus.failedToDelete =>
        DeleteAccountStatus.failedToDelete,
      PigeonDeleteAccountStatus.forbidden => DeleteAccountStatus.forbidden,
    };
  }
}

/// Adapts the [PigeonRequestError] class to the [RequestError] class.
extension PigeonRequestErrorAdapter on PigeonRequestError {
  /// Converts a [PigeonRequestError] to a [RequestError].
  RequestError toModelImplementation() {
    return switch (this) {
      PigeonRequestError.clientError => RequestError.clientError,
      PigeonRequestError.forbidden => RequestError.forbidden,
      PigeonRequestError.limitReached => RequestError.limitReached,
      PigeonRequestError.noNetwork => RequestError.noNetwork,
      PigeonRequestError.serverError => RequestError.serverError,
      PigeonRequestError.unauthenticated => RequestError.unauthenticated,
      PigeonRequestError.unknownError => RequestError.unknownError,
    };
  }
}

/// Adapts the [PigeonUpdateUserIdStatus] class
/// to the [UpdateUserIdStatus] class.
extension PigeonUpdateUserIdStatusAdapter on PigeonUpdateUserIdStatus {
  /// Converts a [PigeonUpdateUserIdStatus] to a [UpdateUserIdStatus].
  UpdateUserIdStatus toModelImplementation() {
    return switch (this) {
      PigeonUpdateUserIdStatus.alreadyUsed => UpdateUserIdStatus.alreadyUsed,
      PigeonUpdateUserIdStatus.failedToUpdate =>
        UpdateUserIdStatus.failedToUpdate,
      PigeonUpdateUserIdStatus.invalidUserId =>
        UpdateUserIdStatus.invalidUserId,
      PigeonUpdateUserIdStatus.savedForRepost =>
        UpdateUserIdStatus.savedForRepost,
      PigeonUpdateUserIdStatus.updated => UpdateUserIdStatus.updated,
    };
  }
}

/// Adapts the [PigeonDeviceConfigurationEvent] class
/// to the [DKDeviceConfigurationEvent] class.
extension PigeonDeviceConfigurationEventAdapter
    on PigeonDeviceConfigurationEvent {
  /// Converts a [PigeonDeviceConfigurationEvent] to a
  /// [DKDeviceConfigurationEvent].
  DKDeviceConfigurationEvent toModelImplementation() {
    return switch (this) {
      PigeonDeviceConfigurationEvent.locationSensorValid =>
        DKDeviceConfigurationEvent.locationSensorValid,
      PigeonDeviceConfigurationEvent.locationSensorInvalid =>
        DKDeviceConfigurationEvent.locationSensorInvalid,
      PigeonDeviceConfigurationEvent.bluetoothSensorValid =>
        DKDeviceConfigurationEvent.bluetoothSensorValid,
      PigeonDeviceConfigurationEvent.bluetoothSensorInvalid =>
        DKDeviceConfigurationEvent.bluetoothSensorInvalid,
      PigeonDeviceConfigurationEvent.locationPermissionValid =>
        DKDeviceConfigurationEvent.locationPermissionValid,
      PigeonDeviceConfigurationEvent.locationPermissionInvalid =>
        DKDeviceConfigurationEvent.locationPermissionInvalid,
      PigeonDeviceConfigurationEvent.activityPermissionValid =>
        DKDeviceConfigurationEvent.activityPermissionValid,
      PigeonDeviceConfigurationEvent.activityPermissionInvalid =>
        DKDeviceConfigurationEvent.activityPermissionInvalid,
      PigeonDeviceConfigurationEvent.notificationPermissionValid =>
        DKDeviceConfigurationEvent.notificationPermissionValid,
      PigeonDeviceConfigurationEvent.notificationPermissionInvalid =>
        DKDeviceConfigurationEvent.notificationPermissionInvalid,
      PigeonDeviceConfigurationEvent.nearbyDevicePermissionValid =>
        DKDeviceConfigurationEvent.nearbyDevicePermissionValid,
      PigeonDeviceConfigurationEvent.nearbyDevicePermissionInvalid =>
        DKDeviceConfigurationEvent.nearbyDevicePermissionInvalid,
      PigeonDeviceConfigurationEvent.autoResetPermissionValid =>
        DKDeviceConfigurationEvent.autoResetPermissionValid,
      PigeonDeviceConfigurationEvent.autoResetPermissionInvalid =>
        DKDeviceConfigurationEvent.autoResetPermissionInvalid,
      PigeonDeviceConfigurationEvent.appBatteryOptimisationValid =>
        DKDeviceConfigurationEvent.appBatteryOptimisationValid,
      PigeonDeviceConfigurationEvent.appBatteryOptimisationInvalid =>
        DKDeviceConfigurationEvent.appBatteryOptimisationInvalid,
    };
  }
}

/// Adapts the [SynchronizationType] enum to the corresponding Pigeon enum
extension SynchronizationTypeAdapter on SynchronizationType {
  /// Converts a [SynchronizationType] to a corresponding Pigeon enum
  PigeonSynchronizationType toPigeonImplementation() {
    switch (this) {
      case SynchronizationType.defaultSync:
        return PigeonSynchronizationType.defaultSync;
      case SynchronizationType.cache:
        return PigeonSynchronizationType.cache;
    }
  }
}

/// Adapts the [UserInfo] class to the [PigeonUserInfo] class.
extension UserInfoAdapter on UserInfo {
  /// Converts a [UserInfo] to a [PigeonUserInfo].
  PigeonUserInfo toPigeonImplementation() {
    return PigeonUserInfo(
      firstname: firstname,
      lastname: lastname,
      pseudo: pseudo,
    );
  }
}
