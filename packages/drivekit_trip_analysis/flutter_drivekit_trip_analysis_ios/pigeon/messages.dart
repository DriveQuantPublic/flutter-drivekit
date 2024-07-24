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
    this.engineDisplacement = 1200,
    this.frontTireSize = '205/55/16',
    this.rearTireSize = '205/55/16',
    this.length = 4.5,
    this.width = 1.8,
    this.height = 1.45,
    this.engineCylinderNb = 4,
    this.driveWheels = 0,
  });

  final int carTypeIndex;
  final int carEngineIndex;
  final int carPower;
  final int carMass;
  final int carGearboxIndex;
  final double carConsumption;
  final int engineDisplacement;
  final String frontTireSize;
  final String rearTireSize;
  final double length;
  final double width;
  final double height;
  final int engineCylinderNb;
  final int driveWheels;
}
