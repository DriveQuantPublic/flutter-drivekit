// coverage:ignore-file
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';

/// An implementation of [DrivekitTripSimulatorPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDrivekitTripSimulator extends DrivekitTripSimulatorPlatform {
  @override
  Future<String> getPlatformName() {
    throw UnimplementedError('getPlatformName() has not been implemented.');
  }

  @override
  Future<void> start(PresetTrip presetTrip) {
    throw UnimplementedError('start() has not been implemented.');
  }

  @override
  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }
}
