import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// Adapts the [PigeonVehicle] class to the [Vehicle] class.
extension PigeonAdapter on Vehicle {
  /// Converts a [Vehicle] to a [PigeonVehicle].
  PigeonVehicle toPigeonImplementation() {
    return PigeonVehicle(carTypeIndex: carTypeIndex);
  }
}
