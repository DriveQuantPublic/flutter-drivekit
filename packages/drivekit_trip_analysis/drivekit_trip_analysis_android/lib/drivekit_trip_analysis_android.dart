import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [DrivekitTripAnalysisPlatform].
class DrivekitTripAnalysisAndroid extends DrivekitTripAnalysisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('drivekit_trip_analysis_android');

  /// Registers this class as the default instance
  /// of [DrivekitTripAnalysisPlatform]
  static void registerWith() {
    DrivekitTripAnalysisPlatform.instance = DrivekitTripAnalysisAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
