// coverage:ignore-file
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// An implementation of [DrivekitTripAnalysisPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDrivekitTripAnalysis extends DrivekitTripAnalysisPlatform {
  @override
  Future<String> getPlatformName() {
    throw UnimplementedError('getPlatformName() has not been implemented.');
  }

  @override
  Future<void> activateAutoStart(bool activate) {
    throw UnimplementedError('activateAutoStart() has not been implemented.');
  }

  @override
  Future<void> activateCrashDetection(bool activate) {
    throw UnimplementedError(
      'activateCrashDetection() has not been implemented',
    );
  }

  @override
  Future<void> startTrip() {
    throw UnimplementedError('startTrip() has not been implemented.');
  }

  @override
  Future<void> stopTrip() {
    throw UnimplementedError('stopTrip() has not been implemented.');
  }

  @override
  Future<void> cancelTrip() {
    throw UnimplementedError('cancelTrip() has not been implemented.');
  }

  @override
  Future<bool> isTripRunning() {
    throw UnimplementedError('isTripRunning() has not been implemented.');
  }

  @override
  Future<void> setMonitorPotentialTripStart(bool activate) {
    throw UnimplementedError(
      'setMonitorPotentialTripStart() has not been implemented.',
    );
  }

  @override
  Future<bool> getMonitorPotentialTripStart() {
    throw UnimplementedError(
      'getMonitorPotentialTripStart() has not been implemented.',
    );
  }

  @override
  Future<void> setVehicle(Vehicle vehicle) {
    throw UnimplementedError('setVehicle() has not been implemented.');
  }
}
