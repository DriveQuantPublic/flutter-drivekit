import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// Adapts the [PigeonGetUserInfoResponse] class to
/// the corresponding class in the model.
extension PigeonGetUserInfoResponseAdapter on PigeonGetUserInfoResponse {
  /// Converts a [PigeonGetUserInfoResponse] to a corresponding model class.
  GetUserInfoResponse toModelImplementation() {
    return GetUserInfoResponse(
      status: status.toModelImplementation(),
      userInfo: userInfo?.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonUserInfoSyncStatus] enum to the corresponding model enum
extension PigeonUserInfoSyncStatusAdapter on PigeonUserInfoSyncStatus {
  /// Converts a [PigeonUserInfoSyncStatus] to a corresponding model enum.
  UserInfoSyncStatus toModelImplementation() {
    switch (this) {
      case PigeonUserInfoSyncStatus.success:
        return UserInfoSyncStatus.success;
      case PigeonUserInfoSyncStatus.cacheDataOnly:
        return UserInfoSyncStatus.cacheDataOnly;
      case PigeonUserInfoSyncStatus.failedToSyncUserInfoCacheOnly:
        return UserInfoSyncStatus.failedToSyncUserInfoCacheOnly;
    }
  }
}

/// Adapts the [PigeonUserInfo] class to the corresponding class
/// in the model.
extension PigeonUserInfoAdapter on PigeonUserInfo {
  /// Converts a [PigeonUserInfo] to a corresponding model class.
  UserInfo toModelImplementation() {
    return UserInfo(
      firstname: firstname,
      lastname: lastname,
      pseudo: pseudo,
    );
  }
}
