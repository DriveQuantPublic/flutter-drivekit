import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_core_ios/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// The iOS implementation of [DrivekitCorePlatform].
class DrivekitCoreIOS extends DrivekitCorePlatform {
  /// Creates a new instance of [DrivekitCoreIOS].
  /// The optional [iosCoreApi] parameter is used for
  /// dependency injection in tests.
  DrivekitCoreIOS({IOSCoreApi? iosCoreApi})
      : iosCoreApi = iosCoreApi ?? IOSCoreApi();

  /// Registers this class as the default instance of [DrivekitCorePlatform]
  static void registerWith() {
    DrivekitCorePlatform.instance = DrivekitCoreIOS();
  }

  /// The instance of [IOSCoreApi], a class that provides access to the
  /// native methods via a method channel generated by pigeon.
  @visibleForTesting
  final IOSCoreApi iosCoreApi;

  @override
  Future<String> getPlatformName() => iosCoreApi.getPlatformName();

  @override
  Future<void> setApiKey(String key) => iosCoreApi.setApiKey(key);

  @override
  Future<void> setUserId(String userId) => iosCoreApi.setUserId(userId);

  @override
  Future<void> reset() => iosCoreApi.reset();

  @override
  Future<bool> isTokenValid() => iosCoreApi.isTokenValid();
}
