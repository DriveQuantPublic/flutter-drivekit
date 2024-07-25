import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// The Android implementation of [DrivekitCorePlatform].
class DrivekitCoreAndroid extends DrivekitCorePlatform
    implements FlutterCoreApi {
  /// Creates a new instance of [DrivekitCoreAndroid].
  /// The optional [androidCoreApi] parameter is used for
  /// dependency injection in tests.
  DrivekitCoreAndroid({AndroidCoreApi? androidCoreApi})
      : androidCoreApi = androidCoreApi ?? AndroidCoreApi();

  /// Registers this class as the default instance of [DrivekitCorePlatform]
  static void registerWith() {
    DrivekitCorePlatform.instance = DrivekitCoreAndroid();
  }

  /// The instance of [AndroidCoreApi], a class that provides access to the
  /// native methods via a method channel generated by pigeon.
  @visibleForTesting
  final AndroidCoreApi androidCoreApi;

  @override
  void initializePlatform() {
    FlutterCoreApi.setUp(this);
  }

  @override
  Future<String> getPlatformName() => androidCoreApi.getPlatformName();

  @override
  Future<void> setApiKey(String key) => androidCoreApi.setApiKey(key);

  @override
  Future<void> setUserId(String userId) => androidCoreApi.setUserId(userId);

  @override
  Future<String?> getUserId() => androidCoreApi.getUserId();

  @override
  Future<void> reset() => androidCoreApi.reset();

  @override
  Future<bool> isTokenValid() => androidCoreApi.isTokenValid();

  @override
  Future<void> deleteAccount({bool instantDeletion = false}) =>
      androidCoreApi.deleteAccount(instantDeletion: instantDeletion);

  @override
  Future<String?> getApiKey() => androidCoreApi.getApiKey();

  @override
  Future<void> disableLogging({bool showInConsole = true}) =>
      androidCoreApi.disableLogging(showInConsole: showInConsole);

  @override
  void pigeonOnConnected() {}

  @override
  void pigeonOnAccountDeleted(PigeonDeleteAccountStatus status) {}

  @override
  void pigeonOnAuthenticationError(PigeonRequestError errorType) {}

  @override
  void pigeonOnDisconnected() {}

  @override
  void pigeonUserIdUpdateStatus(
    PigeonUpdateUserIdStatus status,
    String? userId,
  ) {}
}
