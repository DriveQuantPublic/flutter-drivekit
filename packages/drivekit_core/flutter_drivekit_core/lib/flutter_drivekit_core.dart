import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

DrivekitCorePlatform get _platform => DrivekitCorePlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Core SDK.
class DriveKitCore {
  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// Sets the API key.
  Future<void> setApiKey(String key) async {
    await _platform.setApiKey(key);
  }

  /// Identifies the user with the given id.
  Future<void> setUserId(String userId) async {
    await _platform.setUserId(userId);
  }
}
