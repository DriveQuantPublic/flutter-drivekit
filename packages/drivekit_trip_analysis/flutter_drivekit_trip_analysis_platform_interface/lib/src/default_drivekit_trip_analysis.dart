// coverage:ignore-file
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// An implementation of [DriveKitTripAnalysisPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDriveKitTripAnalysis extends DriveKitTripAnalysisPlatform {
  @override
  void initializePlatform() {
    throw UnimplementedError('initializePlatform() has not been implemented.');
  }

  @override
  Future<bool> isAutoStartActivated() {
    throw UnimplementedError(
      'isAutoStartActivated() has not been implemented.',
    );
  }

  @override
  Future<void> activateAutoStart(bool activate) {
    throw UnimplementedError('activateAutoStart() has not been implemented.');
  }

  @override
  Future<bool> isCrashDetectionActivated() {
    throw UnimplementedError(
      'isCrashDetectionActivated() has not been implemented.',
    );
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
  Future<void> setStopTimeOut(int timeOut) {
    throw UnimplementedError('setStopTimeOut() has not been implemented.');
  }

  @override
  Future<bool> isMonitoringPotentialTripStart() {
    throw UnimplementedError(
      'isMonitoringPotentialTripStart() has not been implemented.',
    );
  }

  @override
  Future<void> setMonitorPotentialTripStart(bool activate) {
    throw UnimplementedError(
      'setMonitorPotentialTripStart() has not been implemented.',
    );
  }

  @override
  Future<void> setVehicle(Vehicle vehicle) {
    throw UnimplementedError('setVehicle() has not been implemented.');
  }

  @override
  Future<void> addTripListener(TripListener listener) {
    throw UnimplementedError('setTripParameters() has not been implemented.');
  }

  @override
  void removeTripListener(TripListener listener) {
    throw UnimplementedError('removeTripListener() has not been implemented.');
  }

  @override
  void removeAllTripListeners() {
    throw UnimplementedError(
      'removeAllTripListeners() has not been implemented.',
    );
  }

  @override
  Future<Map<String, String>?> getTripMetadata() {
    throw UnimplementedError('getTripMetadata>() has not been implemented.');
  }

  @override
  Future<void> updateTripMetadata(String key, String? value) {
    throw UnimplementedError('updateTripMetadata() has not been implemented.');
  }

  @override
  Future<void> setTripMetadata(Map<String, String>? metadata) {
    throw UnimplementedError('setTripMetadata() has not been implemented.');
  }

  @override
  Future<void> deleteTripMetadata(String key) {
    throw UnimplementedError('deleteTripMetadata() has not been implemented.');
  }

  @override
  Future<void> deleteAllTripMetadata() {
    throw UnimplementedError(
      'deleteAllTripMetadata() has not been implemented.',
    );
  }

  @override
  Future<CurrentTripInfo?> getCurrentTripInfo() {
    throw UnimplementedError(
      'getCurrentTripInfo() has not been implemented.',
    );
  }
}
