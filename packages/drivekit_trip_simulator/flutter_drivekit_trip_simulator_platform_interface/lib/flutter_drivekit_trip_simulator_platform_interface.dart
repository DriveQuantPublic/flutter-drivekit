import 'package:flutter_drivekit_trip_simulator_platform_interface/src/default_drivekit_trip_simulator.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_trip_simulator_platform_interface/src/model.dart';

/// The interface that implementations of drivekit_trip_simulator must
/// implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DriveKitTripSimulator`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DriveKitTripSimulatorPlatform]
/// methods.
abstract class DriveKitTripSimulatorPlatform extends PlatformInterface {
  /// Constructs a DriveKitTripSimulatorPlatform.
  DriveKitTripSimulatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static DriveKitTripSimulatorPlatform _instance =
      DefaultDriveKitTripSimulator();

  /// The default instance of [DriveKitTripSimulatorPlatform] to use.
  ///
  /// Defaults to [DefaultDriveKitTripSimulator].
  static DriveKitTripSimulatorPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DriveKitTripSimulatorPlatform] when they register
  /// themselves.
  static set instance(DriveKitTripSimulatorPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Starts trip simulation with a preset trip
  Future<void> start(PresetTrip presetTrip);

  /// Stops trip simulation
  Future<void> stop();
}
