// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSCoreApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterCoreError'),
    dartPackageName: 'pigeon_core_package',
  ),
)
@HostApi()
abstract class IOSCoreApi {
  void setApiKey(String key);
  void setUserId(String userId);
  String? getUserId();
  void updateUserId(String userId);
  String? getInstallationId();
  @async
  PigeonGetUserInfoResponse getUserInfo({
    PigeonSynchronizationType synchronizationType =
        PigeonSynchronizationType.defaultSync,
  });
  @async
  bool updateUserInfo(PigeonUserInfo userInfo);
  void reset();
  bool isTokenValid();
  void deleteAccount({bool instantDeletion = false});
  String? getApiKey();
  void enableLogging({bool showInConsole = true});
  void disableLogging({bool showInConsole = true});
  String? getLogUriFile();
}

@FlutterApi()
abstract class FlutterCoreApi {
  void driveKitDidConnect();
  void driveKitDidDisconnect();
  void driveKitDidReceiveAuthenticationError(PigeonRequestError error);
  void userIdUpdateStatusChanged(
    PigeonUpdateUserIdStatus status,
    String? userId,
  );
  void driveKitAccountDeletionCompleted(PigeonDeleteAccountStatus status);
  void driveKitBackgroundFetchStatusChanged(PigeonBackgroundFetchStatus status);

  void onDeviceConfigurationChanged(PigeonDeviceConfigurationEvent event);
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum PigeonRequestError {
  wrongUrl,
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  limitReached,
  unknownError;
}

enum PigeonUpdateUserIdStatus {
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
}

enum PigeonBackgroundFetchStatus {
  started,
  completed;
}

enum PigeonDeviceConfigurationEvent {
  locationSensorValid,
  locationSensorInvalid,
  bluetoothSensorValid,
  bluetoothSensorInvalid,
  locationPermissionValid,
  locationPermissionInvalid,
  activityPermissionValid,
  activityPermissionInvalid,
  notificationPermissionValid,
  notificationPermissionInvalid,
  bluetoothPermissionValid,
  bluetoothPermissionInvalid,
  lowPowerModeValid,
  lowPowerModeInvalid,
}

/// User Info
class PigeonUserInfo {
  PigeonUserInfo({
    this.firstname,
    this.lastname,
    this.pseudo,
  });

  final String? firstname;
  final String? lastname;
  final String? pseudo;
}

/// Trip Synchronization Type
enum PigeonSynchronizationType {
  /// synchronize by calling the DriveQuant servers
  defaultSync,

  /// retrieve already synchronized items in the local database
  cache
}

/// The response returned when getting user info
class PigeonGetUserInfoResponse {
  /// Creates a PigeonGetUserInfoResponse instance
  PigeonGetUserInfoResponse({required this.status, required this.userInfo});

  /// user info sync status
  /// final PigeonUserInfoSyncStatus status
  final PigeonUserInfoSyncStatus status;

  /// user info data
  final PigeonUserInfo? userInfo;
}

/// User info synchronization status enum
enum PigeonUserInfoSyncStatus {
  /// Synchronization has been successfully performed
  success,

  /// SynchronizationType has been set to cache.
  cacheDataOnly,

  /// Synchronization has failed,
  /// only user info previously synchronized is returned
  failedToSyncUserInfoCacheOnly,
}
