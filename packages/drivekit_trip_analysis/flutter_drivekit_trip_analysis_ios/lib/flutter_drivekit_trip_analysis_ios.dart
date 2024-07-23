import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// The iOS implementation of [DrivekitTripAnalysisPlatform].
class DrivekitTripAnalysisIOS extends DrivekitTripAnalysisPlatform {
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
  Future<String> getPlatformName() => iosTripAnalysisApi.getPlatformName();

  @override
  Future<void> activateAutoStart(bool activate) =>
      iosTripAnalysisApi.activateAutoStart(activate);

  @override
  Future<void> activateCrashDetection(bool activate) =>
      iosTripAnalysisApi.activateCrashDetection(activate);

  @override
  Future<void> startTrip() => iosTripAnalysisApi.startTrip();
}
