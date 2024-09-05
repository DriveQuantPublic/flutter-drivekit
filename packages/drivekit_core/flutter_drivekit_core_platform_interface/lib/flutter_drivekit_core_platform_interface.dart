import 'package:flutter_drivekit_core_platform_interface/src/default_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_core_platform_interface/src/model.dart';

/// The interface that implementations of drivekit_core must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DriveKitCore`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DriveKitCorePlatform] methods.
abstract class DriveKitCorePlatform extends PlatformInterface {
  /// Constructs a DriveKitCorePlatform.
  DriveKitCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static DriveKitCorePlatform _instance = DefaultDriveKitCore();

  /// The default instance of [DriveKitCorePlatform] to use.
  ///
  /// Defaults to [DefaultDriveKitCore].
  static DriveKitCorePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DriveKitCorePlatform] when they register themselves.
  static set instance(DriveKitCorePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Must be called when the app-facing package is initialized
  /// Useful to start listening to method channels
  void initializePlatform();

  /// Set the API key.
  Future<void> setApiKey(String key);

  /// Identifies the user with the given id.
  Future<void> setUserId(String userId);

  /// Get the userId.
  Future<String?> getUserId();

  /// Update the userId
  Future<void> updateUserId(String userId);

  /// Retrieve user info data
  Future<GetUserInfoResponse> getUserInfo({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
  });

  /// You can add information to a user's account such as first name, last name
  /// and pseudo.
  Future<bool> updateUserInfo(UserInfo userInfo);

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

  /// Remove a [DriveKitListener]
  void removeDriveKitListener(DriveKitListener listener);

  /// Remove all [DriveKitListener]
  void removeAllDriveKitListeners();

  /// Get the log file uri
  Future<Uri?> getLogUriFile();

  /// Add a [DKDeviceConfigurationListener], which listens to the device config
  /// changes.
  void addDeviceConfigurationListener(DKDeviceConfigurationListener listener);

  /// Remove specific a [DKDeviceConfigurationListener]
  void removeDeviceConfigurationListener(
    DKDeviceConfigurationListener listener,
  );

  /// Remove all [DKDeviceConfigurationListener]
  void removeAllDeviceConfigurationListeners();
}
