import 'package:flutter_drivekit_core_platform_interface/src/default_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_core_platform_interface/src/model.dart';

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

  static DrivekitCorePlatform _instance = DefaultDrivekitCore();

  /// The default instance of [DrivekitCorePlatform] to use.
  ///
  /// Defaults to [DefaultDrivekitCore].
  static DrivekitCorePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DrivekitCorePlatform] when they register themselves.
  static set instance(DrivekitCorePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Must be called when the app-facing package is initialized
  /// Useful to start listening to method channels
  void initializePlatform();

  /// Return the current platform name.
  Future<String> getPlatformName();

  /// Set the API key.
  Future<void> setApiKey(String key);

  /// Identifies the user with the given id.
  Future<void> setUserId(String userId);

  /// Get the userId.
  Future<String?> getUserId();

  /// Resets the DriveKit SDK.
  Future<void> reset();

  /// Check the validity of the generated token
  /// after connecting with API Key and User ID
  Future<bool> isTokenValid();

  /// Deletes a driver's account.
  Future<void> deleteAccount({bool instantDeletion = false});

  /// Get the API key that has been set, or null
  Future<String?> getApiKey();

  /// Enable the DriveKit logs
  Future<void> enableLogging({
    bool showInConsole = true,
    String androidLogPath = '/DriveKit',
  });

  /// Disable the DriveKit logs
  Future<void> disableLogging({bool showInConsole = true});

  /// Add a [DriveKitListener], which listens to the DriveKit SDK
  void addDriveKitListener(DriveKitListener listener);

  /// Get the log file uri
  Future<LogFileUri?> getLogUriFile();
}
