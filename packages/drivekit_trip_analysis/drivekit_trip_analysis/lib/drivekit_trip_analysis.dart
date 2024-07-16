import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';

DrivekitTripAnalysisPlatform get _platform =>
    DrivekitTripAnalysisPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() => _platform.getPlatformName();
