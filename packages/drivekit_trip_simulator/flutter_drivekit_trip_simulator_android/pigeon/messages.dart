// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_simulator_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/tripsimulator/TripSimulatorApi.kt',
    kotlinOptions: KotlinOptions(
      errorClassName: 'FlutterCoreError',
      package: 'com.drivequant.drivekit.flutter.tripsimulator',
    ),
    dartPackageName: 'pigeon_trip_simulator_package',
  ),
)
@HostApi()
abstract class AndroidTripSimulatorApi {
  String getPlatformName();
}
