import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';

export 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart'
    show PresetTrip;

DriveKitTripSimulatorPlatform get _platform =>
    DriveKitTripSimulatorPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit TripSimulator SDK.
class DriveKitTripSimulator {
  const DriveKitTripSimulator._();

  /// unique instance of the DriveKitTripSimulator
  static DriveKitTripSimulator get instance => _instance;
  static const DriveKitTripSimulator _instance = DriveKitTripSimulator._();

  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// Starts trip simulation with a preset trip
  static Future<void> start(PresetTrip presetTrip) =>
      _platform.start(presetTrip);

  /// Stops trip simulation
  static Future<void> stop() => _platform.stop();
}
