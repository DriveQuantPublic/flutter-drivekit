import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [DrivekitCorePlatform].
class DrivekitCoreAndroid extends DrivekitCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('drivekit_core_android');

  /// Registers this class as the default instance of [DrivekitCorePlatform]
  static void registerWith() {
    DrivekitCorePlatform.instance = DrivekitCoreAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
