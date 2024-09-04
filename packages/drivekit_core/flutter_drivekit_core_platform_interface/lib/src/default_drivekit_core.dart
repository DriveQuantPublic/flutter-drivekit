// coverage:ignore-file
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// An implementation of [DriveKitCorePlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDriveKitCore extends DriveKitCorePlatform {
  @override
  void initializePlatform() {
    throw UnimplementedError('initialize() has not been implemented.');
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
  Future<String?> getUserId() {
    throw UnimplementedError('getUserId() has not been implemented.');
  }

  @override
  Future<void> updateUserId(String userId) {
    throw UnimplementedError('updateUserId() has not been implemented.');
  }

  @override
  Future<bool> updateUserInfo(UserInfo userInfo) {
    throw UnimplementedError('updateUserInfo() has not been implemented.');
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

  @override
  Future<void> enableLogging({
    bool showInConsole = true,
    String androidLogPath = '/DriveKit',
  }) {
    throw UnimplementedError('enableLogging() has not been implemented.');
  }

  @override
  Future<void> disableLogging({bool showInConsole = true}) {
    throw UnimplementedError('disableLogging() has not been implemented.');
  }

  @override
  void addDriveKitListener(DriveKitListener listener) {
    throw UnimplementedError('addDriveKitListener() has not been implemented.');
  }

  @override
  void removeDriveKitListener(DriveKitListener listener) {
    throw UnimplementedError(
      'removeDriveKitListener() has not been implemented.',
    );
  }

  @override
  void removeAllDriveKitListeners() {
    throw UnimplementedError(
      'removeAllDriveKitListeners() has not been implemented.',
    );
  }

  @override
  Future<Uri?> getLogUriFile() {
    throw UnimplementedError('getLogUriFile() has not been implemented.');
  }

  @override
  void addDeviceConfigurationListener(DKDeviceConfigurationListener listener) {
    throw UnimplementedError(
      'addDeviceConfigurationListener() has not been implemented.',
    );
  }

  @override
  void removeDeviceConfigurationListener(
    DKDeviceConfigurationListener listener,
  ) {
    throw UnimplementedError(
      'removeDeviceConfigurationListener() has not been implemented.',
    );
  }

  @override
  void removeAllDeviceConfigurationListeners() {
    throw UnimplementedError(
      'removeAllDeviceConfigurationListeners() has not been implemented.',
    );
  }

  @override
  Future<GetUserInfoResponse> getUserInfo({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
  }) {
    throw UnimplementedError('getUserInfo() has not been implemented.');
  }
}
