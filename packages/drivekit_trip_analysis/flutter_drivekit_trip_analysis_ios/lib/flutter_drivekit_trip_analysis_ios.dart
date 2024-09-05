import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/model_adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// The iOS implementation of [DriveKitTripAnalysisPlatform].
class DriveKitTripAnalysisIOS extends DriveKitTripAnalysisPlatform
    implements FlutterTripAnalysisApi {
  /// Creates a new instance of [DriveKitTripAnalysisIOS].
  /// The optional [iosTripAnalysisApi] parameter is used for
  /// dependency injection in tests.
  DriveKitTripAnalysisIOS({IOSTripAnalysisApi? iosTripAnalysisApi})
      : iosTripAnalysisApi = iosTripAnalysisApi ?? IOSTripAnalysisApi();

  /// Registers this class as the default instance of
  /// [DriveKitTripAnalysisPlatform]
  static void registerWith() {
    DriveKitTripAnalysisPlatform.instance = DriveKitTripAnalysisIOS();
  }

  /// The instance of [IOSTripAnalysisApi], a class that provides access to the
  /// native methods via a method channel generated by pigeon.
  @visibleForTesting
  final IOSTripAnalysisApi iosTripAnalysisApi;

  @override
  void initializePlatform() {
    FlutterTripAnalysisApi.setUp(this);
  }

  final List<TripListener> _listeners = [];

  @override
  Future<bool> isAutoStartActivated() =>
      iosTripAnalysisApi.isAutoStartActivated();

  @override
  Future<void> activateAutoStart(bool activate) =>
      iosTripAnalysisApi.activateAutoStart(activate);

  @override
  Future<bool> isCrashDetectionActivated() =>
      iosTripAnalysisApi.isCrashDetectionActivated();

  @override
  Future<void> activateCrashDetection(bool activate) =>
      iosTripAnalysisApi.activateCrashDetection(activate);

  @override
  Future<void> startTrip() => iosTripAnalysisApi.startTrip();

  @override
  Future<void> stopTrip() => iosTripAnalysisApi.stopTrip();

  @override
  Future<void> cancelTrip() => iosTripAnalysisApi.cancelTrip();

  @override
  Future<bool> isTripRunning() => iosTripAnalysisApi.isTripRunning();

  @override
  Future<void> setStopTimeOut(int timeOut) =>
      iosTripAnalysisApi.setStopTimeOut(timeOut);

  @override
  Future<bool> isMonitoringPotentialTripStart() =>
      iosTripAnalysisApi.isMonitoringPotentialTripStart();

  @override
  Future<void> setMonitorPotentialTripStart(bool activate) =>
      iosTripAnalysisApi.setMonitorPotentialTripStart(activate);

  @override
  Future<void> setVehicle(Vehicle vehicle) =>
      iosTripAnalysisApi.setVehicle(vehicle.toPigeonImplementation());

  @override
  Future<TripResponseStatus?> getTripResponseStatus(
    PostGenericResponse tripResponse,
  ) async {
    final pigeonResult = await iosTripAnalysisApi
        .getTripResponseStatus(tripResponse.toPigeonImplementation());
    return pigeonResult?.toModelImplementation();
  }

  @override
  void addTripListener(TripListener listener) => _listeners.add(listener);

  @override
  void removeTripListener(TripListener listener) => _listeners.remove(listener);

  @override
  void removeAllTripListeners() => _listeners.clear();

  @override
  void beaconDetected() {
    for (final listener in _listeners) {
      listener.beaconDetected?.call();
    }
  }

  @override
  void crashDetected(PigeonDKCrashInfo crashInfo) {
    for (final listener in _listeners) {
      listener.crashDetected?.call(crashInfo.toModelImplementation());
    }
  }

  @override
  void crashFeedbackSent(
    PigeonDKCrashInfo crashInfo,
    PigeonDKCrashFeedbackType feedbackType,
    PigeonDKCrashFeedbackSeverity severity,
  ) {
    for (final listener in _listeners) {
      listener.crashFeedbackSent?.call(
        crashInfo.toModelImplementation(),
        feedbackType.toModelImplementation(),
        severity.toModelImplementation(),
      );
    }
  }

  @override
  void sdkStateChanged(PigeonState state) {
    for (final listener in _listeners) {
      listener.sdkStateChanged?.call(state.toModelImplementation());
    }
  }

  @override
  void tripCancelled(PigeonCancelTrip cancelTrip) {
    for (final listener in _listeners) {
      listener.tripCancelled?.call(cancelTrip.toModelImplementation());
    }
  }

  @override
  void tripFinished(
    PigeonPostGeneric post,
    PigeonPostGenericResponse response,
  ) {
    for (final listener in _listeners) {
      listener.tripFinished?.call(
        post.toModelImplementation(),
        response.toModelImplementation(),
      );
    }
  }

  @override
  void tripPoint(PigeonTripPoint tripPoint) {
    for (final listener in _listeners) {
      listener.tripPoint?.call(tripPoint.toModelImplementation());
    }
  }

  @override
  void tripSavedForRepost() {
    for (final listener in _listeners) {
      listener.tripSavedForRepost?.call();
    }
  }

  @override
  void tripStarted(PigeonStartMode startMode) {
    for (final listener in _listeners) {
      listener.tripStarted?.call(startMode.toModelImplementation());
    }
  }

  @override
  void significantLocationChangeDetected(PigeonLocation location) {
    for (final listener in _listeners) {
      listener.significantLocationChangeDetected
          ?.call(location.toModelImplementation());
    }
  }

  @override
  void potentialTripStart(PigeonStartMode startMode) {
    for (final listener in _listeners) {
      listener.potentialTripStart?.call(startMode.toModelImplementation());
    }
  }

  @override
  Future<Map<String, String>?> getTripMetadata() async {
    final metadata = await iosTripAnalysisApi.getTripMetadata();
    return convertMetadata(metadata);
  }

  @override
  Future<void> updateTripMetadata(String key, String? value) =>
      iosTripAnalysisApi.updateTripMetadata(key, value);

  @override
  Future<void> setTripMetadata(Map<String, String>? metadata) =>
      iosTripAnalysisApi.setTripMetadata(metadata);
}
