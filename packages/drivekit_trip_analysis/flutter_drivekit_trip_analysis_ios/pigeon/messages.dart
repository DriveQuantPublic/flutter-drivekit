// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSTripAnalysisApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterTripAnalysisError'),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class IOSTripAnalysisApi {
  String getPlatformName();
  void activateAutoStart(bool activate);
  void activateCrashDetection(bool activate);
  void startTrip();
  void stopTrip();
  void cancelTrip();
  bool isTripRunning();
}

@FlutterApi()
abstract class FlutterTripAnalysisApi {
  void driveKitDidConnect();
  void driveKitDidDisconnect();
  void driveKitDidReceiveAuthenticationError(PigeonRequestError error);
  void userIdUpdateStatusChanged(PigeonUpdateUserIdStatus status, String? userId);
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
