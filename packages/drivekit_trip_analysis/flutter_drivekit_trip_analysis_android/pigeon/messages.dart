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
}

enum PigeonDeleteAccountStatus {
  success,
  failed_to_delete,
  forbidden;
}

enum PigeonRequestError{
  no_network,
  unauthenticated,
  forbidden,
  server_error,
  client_error,
  unknown_error,
  limit_reached;
}

enum PigeonUpdateUserIdStatus{
  updated,
  failed_to_update,
  invalid_user_id,
  already_used,
  saved_for_repost;
}
