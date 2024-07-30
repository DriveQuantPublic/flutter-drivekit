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
  void setMonitorPotentialTripStart(bool activate);
  bool getMonitorPotentialTripStart();
  void setVehicle(PigeonVehicle vehicle);
}

class PigeonVehicle {
  const PigeonVehicle({
    this.carTypeIndex = 1,
    this.carEngineIndex = 1,
    this.carPower = 150,
    this.carMass = 1400,
    this.carGearboxIndex = 2,
    this.carConsumption = 4.5,
    this.carAutoGearboxNumber = 0,
    this.engineDisplacement = 1200,
    this.carPassengers = 1,
    this.dqIndex,
    this.sra,
    this.frontTireSize,
    this.rearTireSize,
    this.length,
    this.width,
    this.height,
    this.engineCylinderNb,
    this.driveWheels,
  });

  final int carTypeIndex;
  final int carEngineIndex;
  final double carPower;
  final double carMass;
  final int carGearboxIndex;
  final double carConsumption;
  final int carAutoGearboxNumber;
  final double engineDisplacement;
  final int carPassengers;
  final String? dqIndex;
  final String? sra;
  final String? frontTireSize;
  final String? rearTireSize;
  final double? length;
  final double? width;
  final double? height;
  final int? engineCylinderNb;
  final int? driveWheels;
}
