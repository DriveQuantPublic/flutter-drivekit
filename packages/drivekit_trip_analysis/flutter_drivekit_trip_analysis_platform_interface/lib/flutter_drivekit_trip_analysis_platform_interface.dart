import 'package:flutter_drivekit_trip_analysis_platform_interface/src/default_drivekit_trip_analysis.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of drivekit_trip_analysis must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DrivekitTripAnalysis`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly
/// added [DrivekitTripAnalysisPlatform] methods.
abstract class DrivekitTripAnalysisPlatform extends PlatformInterface {
  /// Constructs a DrivekitTripAnalysisPlatform.
  DrivekitTripAnalysisPlatform() : super(token: _token);

  static final Object _token = Object();

  static DrivekitTripAnalysisPlatform _instance = DefaultDrivekitTripAnalysis();

  /// The default instance of [DrivekitTripAnalysisPlatform] to use.
  ///
  /// Defaults to [DefaultDrivekitTripAnalysis].
  static DrivekitTripAnalysisPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DrivekitTripAnalysisPlatform]
  /// when they register themselves.
  static set instance(DrivekitTripAnalysisPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String> getPlatformName();

  /// Activate autostart mode.
  Future<void> activateAutoStart(bool activate);

  /// Activate crash detection.
  Future<void> activateCrashDetection(bool activate);

  /// Manually start a trip
  Future<void> startTrip();
}
