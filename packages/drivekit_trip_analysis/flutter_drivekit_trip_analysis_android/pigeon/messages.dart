// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/tripanalysis/TripAnalysisApi.kt',
    kotlinOptions: KotlinOptions(
      errorClassName: 'FlutterTripAnalysisError',
      package: 'com.drivequant.drivekit.flutter.tripanalysis',
    ),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class AndroidTripAnalysisApi {
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
  void onAuthenticationError(PigeonRequestError errorType);
  void onAccountDeleted(PigeonDeleteAccountStatus status);
  void onConnected();
  void onDisconnected();
  void userIdUpdateStatus(PigeonUpdateUserIdStatus status, String? userId);
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum PigeonRequestError{
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  unknownError,
  limitReached;
}

enum PigeonUpdateUserIdStatus{
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
}
