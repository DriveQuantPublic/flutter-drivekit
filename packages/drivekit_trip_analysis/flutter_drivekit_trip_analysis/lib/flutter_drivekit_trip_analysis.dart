import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

DrivekitTripAnalysisPlatform get _platform =>
    DrivekitTripAnalysisPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Trip Analysis SDK.
class DrivekitTripAnalysis {
  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// The automatic mode detects vehicle movements and triggers the trip
  /// analysis without driver intervention while the application is in
  /// background. The analysis is stopped automatically at the end of the trip.
  /// This feature is recommended to avoid driver distraction and phone handling
  /// while driving. The automatic mode has been optimised to limit the battery
  /// drain.
  ///
  /// By default, automatic trip detection is disabled, but you can enable it by
  /// calling the following method with the enable parameter to true
  Future<void> activateAutoStart(bool activate) async {
    await _platform.activateAutoStart(activate);
  }

  /// Crash detection features, included into the DriveKit Trip Analysis
  /// component, is able to collect and analyse smartphone sensors data to
  /// automatically detect when a car accident occurs.
  ///
  /// DriveKit Trip Analysis analyzes signals from the GPS sensor and also
  /// from the motion sensors (accelerometer, gyrometer and magnetometer).
  ///
  /// You can activate the feature by calling the following method with the
  /// activate parameter to true
  Future<void> activateCrashDetection(bool activate) async {
    await _platform.activateCrashDetection(activate);
  }
}
