import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [DrivekitTripAnalysisPlatform].
class DrivekitTripAnalysisIOS extends DrivekitTripAnalysisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('drivekit_trip_analysis_ios');

  /// Registers this class as the default instance
  /// of [DrivekitTripAnalysisPlatform]
  static void registerWith() {
    DrivekitTripAnalysisPlatform.instance = DrivekitTripAnalysisIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
