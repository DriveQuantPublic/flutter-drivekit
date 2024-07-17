import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

DrivekitTripAnalysisPlatform get _platform =>
    DrivekitTripAnalysisPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Trip Analysis SDK.
class DrivekitTripAnalysis {
  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();
}
