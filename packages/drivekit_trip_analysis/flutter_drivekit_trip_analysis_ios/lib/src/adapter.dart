import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// Adapts the [PigeonVehicle] class to the [Vehicle] class.
extension PigeonAdapter on Vehicle {
  /// Converts a [Vehicle] to a [PigeonVehicle].
  PigeonVehicle toPigeonImplementation() {
    return PigeonVehicle(
      carTypeIndex: carTypeIndex,
      carEngineIndex: carEngineIndex,
      carPower: carPower.toDouble(),
      carMass: carMass.toDouble(),
      carGearboxIndex: carGearboxIndex,
      carConsumption: carConsumption,
      carAutoGearboxNumber: carAutoGearboxNumber,
      engineDisplacement: engineDisplacement.toDouble(),
      carPassengers: carPassengers,
      dqIndex: dqIndex,
      sra: sra,
      frontTireSize: frontTireSize,
      rearTireSize: rearTireSize,
      length: length,
      width: width,
      height: height,
      engineCylinderNb: engineCylinderNb,
      driveWheels: driveWheels,
    );
  }
}
