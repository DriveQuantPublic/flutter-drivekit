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
  void setVehicle(PigeonVehicle vehicle);
}

class PigeonVehicle {
  const PigeonVehicle({
    this.carTypeIndex = 1,
  });

  final int carTypeIndex;
}

}
