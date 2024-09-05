import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/model_adapter.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// The Android implementation of [DriveKitTripAnalysisPlatform].
class DriveKitTripAnalysisAndroid extends DriveKitTripAnalysisPlatform
    implements FlutterTripAnalysisApi {
  /// Creates a new instance of [DriveKitTripAnalysisAndroid].
  /// The optional [androidTripAnalysisApi] parameter is used for
  /// dependency injection in tests.
  DriveKitTripAnalysisAndroid({AndroidTripAnalysisApi? androidTripAnalysisApi})
      : androidTripAnalysisApi =
            androidTripAnalysisApi ?? AndroidTripAnalysisApi();

  /// Registers this class as the default instance of
  /// [DriveKitTripAnalysisPlatform]
  static void registerWith() {
    DriveKitTripAnalysisPlatform.instance = DriveKitTripAnalysisAndroid();
  }

  /// The instance of [AndroidTripAnalysisApi], a class that provides
  /// access to the native methods via a method channel generated by pigeon.
  @visibleForTesting
  final AndroidTripAnalysisApi androidTripAnalysisApi;

  @override
  void initializePlatform() {
    FlutterTripAnalysisApi.setUp(this);
  }

  final List<TripListener> _listeners = [];

  @override
  Future<bool> isAutoStartActivated() =>
      androidTripAnalysisApi.isAutoStartActivated();

  @override
  Future<void> activateAutoStart(bool activate) =>
      androidTripAnalysisApi.activateAutoStart(activate);

  @override
  Future<bool> isCrashDetectionActivated() =>
      androidTripAnalysisApi.isCrashDetectionActivated();

  @override
  Future<void> activateCrashDetection(bool activate) =>
      androidTripAnalysisApi.activateCrashDetection(activate);

  @override
  Future<void> startTrip() => androidTripAnalysisApi.startTrip();

  @override
  Future<void> stopTrip() => androidTripAnalysisApi.stopTrip();

  @override
  Future<void> cancelTrip() => androidTripAnalysisApi.cancelTrip();

  @override
  Future<bool> isTripRunning() => androidTripAnalysisApi.isTripRunning();

  @override
  Future<void> setStopTimeOut(int timeOut) =>
      androidTripAnalysisApi.setStopTimeOut(timeOut);

  @override
  Future<bool> isMonitoringPotentialTripStart() =>
      androidTripAnalysisApi.isMonitoringPotentialTripStart();

  @override
  Future<void> setMonitorPotentialTripStart(bool activate) =>
      androidTripAnalysisApi.setMonitorPotentialTripStart(activate);

  @override
  Future<void> setVehicle(Vehicle vehicle) =>
      androidTripAnalysisApi.setVehicle(vehicle.toPigeonImplementation());

  @override
  void addTripListener(TripListener listener) => _listeners.add(listener);

  @override
  void removeTripListener(TripListener listener) => _listeners.remove(listener);

  @override
  void removeAllTripListeners() => _listeners.clear();

  @override
  Future<TripResponseStatus?> getTripResponseStatus(
    PostGenericResponse tripResponse,
  ) async {
    final tripStatus = await androidTripAnalysisApi
        .getTripResponseStatus(tripResponse.toPigeonImplementation());
    return tripStatus?.toModelImplementation();
  }

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
  void potentialTripStart(PigeonStartMode startMode) {
    for (final listener in _listeners) {
      listener.potentialTripStart?.call(startMode.toModelImplementation());
    }
  }

  @override
  Future<Map<String, String>?> getTripMetadata() async {
    final metadata = await androidTripAnalysisApi.getTripMetadata();
    return convertMetadata(metadata);
  }

  @override
  Future<void> updateTripMetadata(String key, String? value) =>
      androidTripAnalysisApi.updateTripMetadata(key, value);

  @override
  Future<void> setTripMetadata(Map<String, String>? metadata) =>
      androidTripAnalysisApi.setTripMetadata(metadata);
}
