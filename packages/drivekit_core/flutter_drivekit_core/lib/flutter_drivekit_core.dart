import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

DrivekitCorePlatform get _platform => DrivekitCorePlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Core SDK.
class DriveKitCore {
  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// Sets the DriveQuant API key.
  /// You should store the key in a secure place in your app, and then
  /// call this method with the key to initiate the SDK.
  /// If you don't have an API key, please contact [DriveQuant](https://docs.drivequant.com/#contact-us).
  ///
  /// DriveKit SDK will not work until you set the API key and the userId.
  Future<void> setApiKey(String key) async {
    await _platform.setApiKey(key);
  }

  /// Identifies the user with the given id.
  /// Each driver must be identified with a unique identifier.
  /// You can call setApiKey and setUserId methods anywhere in the code.
  /// DriveKit will save the value locally. If the app is killed and
  /// relaunched, DriveKit will be reconfigured automatically
  ///
  /// DriveKit SDK will not work until you set the API key and the userId.
  Future<void> setUserId(String userId) async {
    await _platform.setUserId(userId);
  }

  /// Resets the DriveKit SDK.
  /// If you need to reset DriveKit configuration (user logout for example),
  /// you can call the following method.
  ///
  /// All data saved locally will be erased and default configuration for every
  /// module will be restored.
  Future<void> reset() async {
    await _platform.reset();
  }
}
