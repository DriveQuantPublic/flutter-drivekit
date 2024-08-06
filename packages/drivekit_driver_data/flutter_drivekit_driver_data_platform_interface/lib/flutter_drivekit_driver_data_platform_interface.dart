import 'package:flutter_drivekit_driver_data_platform_interface/src/default_drivekit_driver_data.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of drivekit_driver_data must
/// implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DrivekitDriverData`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DrivekitDriverDataPlatform]
/// methods.
abstract class DrivekitDriverDataPlatform extends PlatformInterface {
  /// Constructs a DrivekitDriverDataPlatform.
  DrivekitDriverDataPlatform() : super(token: _token);

  static final Object _token = Object();

  static DrivekitDriverDataPlatform _instance = DefaultDrivekitDriverData();

  /// The default instance of [DrivekitDriverDataPlatform] to use.
  ///
  /// Defaults to [DefaultDrivekitDriverData].
  static DrivekitDriverDataPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DrivekitDriverDataPlatform] when they register
  /// themselves.
  static set instance(DrivekitDriverDataPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String> getPlatformName();
}
