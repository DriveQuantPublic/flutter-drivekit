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
  String getPlatformName();
  void setApiKey(String key);
  void setUserId(String userId);
  String? getUserId();
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
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum PigeonRequestError{
  wrongUrl,
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  limitReached,
  unknownError;
}

enum PigeonUpdateUserIdStatus{
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
}

enum PigeonBackgroundFetchStatus{
  started,
  completed;
}
