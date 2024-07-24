// coverage:ignore-file
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// An implementation of [DrivekitCorePlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDrivekitCore extends DrivekitCorePlatform {
  @override
  Future<String> getPlatformName() {
    throw UnimplementedError('getPlatformName() has not been implemented.');
  }

  @override
  Future<void> setApiKey(String key) {
    throw UnimplementedError('setApiKey() has not been implemented.');
  }

  @override
  Future<void> setUserId(String userId) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  @override
  Future<void> reset() {
    throw UnimplementedError('reset() has not been implemented.');
  }

  @override
  Future<bool> isTokenValid() {
    throw UnimplementedError('isTokenValid() has not been implemented.');
  }

  @override
  Future<void> deleteAccount({bool instantDeletion = false}) {
    throw UnimplementedError('deleteAccount() has not been implemented.');
  }

  @override
  Future<String?> getApiKey() {
    throw UnimplementedError('getApiKey() has not been implemented.');
  }
}
