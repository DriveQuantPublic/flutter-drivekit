import 'package:flutter_drivekit_trip_simulator_platform_interface/src/default_drivekit_trip_simulator.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_trip_simulator_platform_interface/src/model.dart';

/// The interface that implementations of drivekit_trip_simulator must
/// implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DrivekitTripSimulator`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DrivekitTripSimulatorPlatform]
/// methods.
abstract class DrivekitTripSimulatorPlatform extends PlatformInterface {
  /// Constructs a DrivekitTripSimulatorPlatform.
  DrivekitTripSimulatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static DrivekitTripSimulatorPlatform _instance =
      DefaultDrivekitTripSimulator();

  /// The default instance of [DrivekitTripSimulatorPlatform] to use.
  ///
  /// Defaults to [DefaultDrivekitTripSimulator].
  static DrivekitTripSimulatorPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DrivekitTripSimulatorPlatform] when they register
  /// themselves.
  static set instance(DrivekitTripSimulatorPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String> getPlatformName();

  /// Starts trip simulation with a preset trip
  Future<void> start(PresetTrip presetTrip);

  /// Stops trip simulation
  Future<void> stop();
}
