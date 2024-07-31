import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// The iOS implementation of [DrivekitTripAnalysisPlatform].
class DrivekitTripAnalysisIOS extends DrivekitTripAnalysisPlatform
    implements FlutterTripAnalysisApi {
  /// Creates a new instance of [DrivekitTripAnalysisIOS].
  /// The optional [iosTripAnalysisApi] parameter is used for
  /// dependency injection in tests.
  DrivekitTripAnalysisIOS({IOSTripAnalysisApi? iosTripAnalysisApi})
      : iosTripAnalysisApi = iosTripAnalysisApi ?? IOSTripAnalysisApi();

  /// Registers this class as the default instance of
  /// [DrivekitTripAnalysisPlatform]
  static void registerWith() {
    DrivekitTripAnalysisPlatform.instance = DrivekitTripAnalysisIOS();
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
  Future<void> activateAutoStart(bool activate) =>
      iosTripAnalysisApi.activateAutoStart(activate);

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
  Future<void> setMonitorPotentialTripStart(bool activate) =>
      iosTripAnalysisApi.setMonitorPotentialTripStart(activate);

  @override
  Future<bool> getMonitorPotentialTripStart() =>
      iosTripAnalysisApi.getMonitorPotentialTripStart();

  @override
  Future<void> setVehicle(Vehicle vehicle) =>
      iosTripAnalysisApi.setVehicle(vehicle.toPigeonImplementation());

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
    // TODO: implement crashDetected
  }

  @override
  void crashFeedbackSent(
    PigeonDKCrashInfo crashInfo,
    PigeonDKCrashFeedbackType feedbackType,
    PigeonDKCrashFeedbackSeverity severity,
  ) {
    // TODO: implement crashFeedbackSent
  }

  @override
  void sdkStateChanged(PigeonState state) {
    // TODO: implement sdkStateChanged
  }

  @override
  void significantLocationChangeDetected(PigeonState state) {
    // TODO: implement significantLocationChangeDetected
  }

  @override
  void tripCancelled(PigeonCancelTrip cancelTrip) {
    // TODO: implement tripCancelled
  }

  @override
  void tripFinished(
    PigeonPostGeneric post,
    PigeonPostGenericResponse response,
  ) {
    // TODO: implement tripFinished
  }

  @override
  void tripPoint(PigeonTripPoint tripPoint) {
    // TODO: implement tripPoint
  }

  @override
  void tripSavedForRepost() {
    // TODO: implement tripSavedForRepost
  }

  @override
  void tripStarted(PigeonStartMode startMode) {
    // TODO: implement tripStarted
  }
}
