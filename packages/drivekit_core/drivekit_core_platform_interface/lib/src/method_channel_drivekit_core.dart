import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

/// An implementation of [DrivekitCorePlatform] that uses method channels.
class MethodChannelDrivekitCore extends DrivekitCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('drivekit_core');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
