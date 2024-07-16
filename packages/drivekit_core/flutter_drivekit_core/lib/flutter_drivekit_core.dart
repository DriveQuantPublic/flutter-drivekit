import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';

DrivekitCorePlatform get _platform => DrivekitCorePlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() => _platform.getPlatformName();
