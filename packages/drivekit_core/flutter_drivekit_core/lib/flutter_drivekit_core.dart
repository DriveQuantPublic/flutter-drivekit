import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

DrivekitCorePlatform get _platform => DrivekitCorePlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() => _platform.getPlatformName();

/// Sets the API key.
Future<void> setApiKey(String key) async {
  await _platform.setApiKey(key);
}
