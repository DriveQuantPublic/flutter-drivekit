import 'package:flutter_drivekit_trip_simulator_ios/src/trip_simulator_api.g.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';

/// Adapts the [PigeonPresetTrip] enum to the [PresetTrip] enum.
extension PigeonAdapter on PresetTrip {
  /// Converts a [PresetTrip] to a [PigeonPresetTrip].
  PigeonPresetTrip toPigeonImplementation() {
    switch (this) {
      case PresetTrip.shortTrip:
        return PigeonPresetTrip.shortTrip;
      case PresetTrip.mixedTrip:
        return PigeonPresetTrip.mixedTrip;
      case PresetTrip.cityTrip:
        return PigeonPresetTrip.cityTrip;
      case PresetTrip.suburbanTrip:
        return PigeonPresetTrip.suburbanTrip;
      case PresetTrip.highwayTrip:
        return PigeonPresetTrip.highwayTrip;
      case PresetTrip.trainTrip:
        return PigeonPresetTrip.trainTrip;
      case PresetTrip.boatTrip:
        return PigeonPresetTrip.boatTrip;
      case PresetTrip.busTrip:
        return PigeonPresetTrip.busTrip;
      case PresetTrip.tripWithCrashConfirmed20KmH:
        return PigeonPresetTrip.tripWithCrashConfirmed20KmH;
      case PresetTrip.tripWithCrashConfirmed30KmH:
        return PigeonPresetTrip.tripWithCrashConfirmed30KmH;
      case PresetTrip.tripWithCrashConfirmed40KmH:
        return PigeonPresetTrip.tripWithCrashConfirmed40KmH;
      case PresetTrip.tripWithCrashUnconfirmed0KmH:
        return PigeonPresetTrip.tripWithCrashUnconfirmed0KmH;
      case PresetTrip.tripWithCrashConfirmed30KmHStillDriving:
        return PigeonPresetTrip.tripWithCrashConfirmed30KmHStillDriving;
    }
  }
}
