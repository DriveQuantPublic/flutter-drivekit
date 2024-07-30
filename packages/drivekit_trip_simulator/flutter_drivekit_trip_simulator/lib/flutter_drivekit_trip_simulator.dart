import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';

DrivekitTripSimulatorPlatform get _platform =>
    DrivekitTripSimulatorPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit TripSimulator SDK.
class DriveKitTripSimulator {
  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// Starts trip simulation with a preset trip
  Future<void> start(PresetTrip presetTrip) => _platform.start(presetTrip);

  /// Stops trip simulation
  Future<void> stop() => _platform.stop();
}
