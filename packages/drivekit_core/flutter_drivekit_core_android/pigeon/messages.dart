// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/core/CoreApi.kt',
    kotlinOptions: KotlinOptions(
      errorClassName: 'FlutterCoreError',
      package: 'com.drivequant.drivekit.flutter.core',
    ),
    dartPackageName: 'pigeon_core_package',
  ),
)
@HostApi()
abstract class AndroidCoreApi {
  void setApiKey(String key);
  void setUserId(String userId);
  String? getUserId();
  void updateUserId(String userId);
  @async
  bool updateUserInfo(PigeonUserInfo userInfo);
  void reset();
  bool isTokenValid();
  void deleteAccount({bool instantDeletion = false});
  String? getApiKey();
  void enableLogging({
    bool showInConsole = true,
    String androidLogPath = '/DriveKit',
  });
  void disableLogging({bool showInConsole = true});
  String? getLogUriFile();
  GetUserInfoResponse getUserInfo({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
  });
}

@FlutterApi()
abstract class FlutterCoreApi {
  void onAuthenticationError(PigeonRequestError errorType);
  void onAccountDeleted(PigeonDeleteAccountStatus status);
  void onConnected();
  void onDisconnected();
  void userIdUpdateStatus(
    PigeonUpdateUserIdStatus status,
    String? userId,
  );

  void onDeviceConfigurationChanged(PigeonDeviceConfigurationEvent event);
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum PigeonRequestError {
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  unknownError,
  limitReached;
}

enum PigeonUpdateUserIdStatus {
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
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
  nearbyDevicePermissionValid,
  nearbyDevicePermissionInvalid,
  autoResetPermissionValid,
  autoResetPermissionInvalid,
  appBatteryOptimisationValid,
  appBatteryOptimisationInvalid,
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
