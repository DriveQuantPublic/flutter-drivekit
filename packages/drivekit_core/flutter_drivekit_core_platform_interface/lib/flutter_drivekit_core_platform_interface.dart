import 'package:flutter_drivekit_core_platform_interface/src/method_channel_drivekit_core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of drivekit_core must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DrivekitCore`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DrivekitCorePlatform] methods.
abstract class DrivekitCorePlatform extends PlatformInterface {
  /// Constructs a DrivekitCorePlatform.
  DrivekitCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static DrivekitCorePlatform _instance = MethodChannelDrivekitCore();

  /// The default instance of [DrivekitCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelDrivekitCore].
  static DrivekitCorePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DrivekitCorePlatform] when they register themselves.
  static set instance(DrivekitCorePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String> getPlatformName();
}
