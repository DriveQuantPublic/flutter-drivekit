import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// The Android implementation of [DrivekitTripAnalysisPlatform].
class DrivekitTripAnalysisAndroid extends DrivekitTripAnalysisPlatform {
  /// Creates a new instance of [DrivekitTripAnalysisAndroid].
  /// The optional [androidTripAnalysisApi] parameter is used for
  /// dependency injection in tests.
  DrivekitTripAnalysisAndroid({AndroidTripAnalysisApi? androidTripAnalysisApi})
      : androidTripAnalysisApi =
            androidTripAnalysisApi ?? AndroidTripAnalysisApi();

  /// Registers this class as the default instance of
  /// [DrivekitTripAnalysisPlatform]
  static void registerWith() {
    DrivekitTripAnalysisPlatform.instance = DrivekitTripAnalysisAndroid();
  }

  /// The instance of [AndroidTripAnalysisApi], a class that provides
  /// access to the native methods via a method channel generated by pigeon.
  @visibleForTesting
  final AndroidTripAnalysisApi androidTripAnalysisApi;

  @override
  Future<String> getPlatformName() => androidTripAnalysisApi.getPlatformName();

  @override
  Future<void> activateAutoStart(bool activate) =>
      androidTripAnalysisApi.activateAutoStart(activate);

  @override
  Future<void> activateCrashDetection(bool activate) =>
      androidTripAnalysisApi.activateCrashDetection(activate);

  @override
  Future<void> startTrip() => androidTripAnalysisApi.startTrip();
}
