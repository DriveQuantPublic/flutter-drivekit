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
