// ignore_for_file: public_member_api_docs

import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

export 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart'
    show DKDeviceConfigurationListener, DriveKitListener, UserInfo;

DriveKitCorePlatform get _platform => DriveKitCorePlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Core SDK.
class DriveKitCore {
  DriveKitCore._() {
    _platform.initializePlatform();
  }

  /// unique instance of DriveKitCore
  static DriveKitCore get instance => _instance;
  static final DriveKitCore _instance = DriveKitCore._();

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

  /// Get the id of the currently identified user, if exists.
  Future<String?> getUserId() => _platform.getUserId();

  /// Update the userId
  /// To be able to check whenever userId got updated and catch the update
  /// status you have to use [DriveKitListener] listener.
  Future<void> updateUserId(String userId) => _platform.updateUserId(userId);

  /// Update user information data
  Future<bool> updateUserInfo(UserInfo userInfo) =>
      _platform.updateUserInfo(userInfo);

  /// Resets the DriveKit SDK.
  /// If you need to reset DriveKit configuration (user logout for example),
  /// you can call the following method.
  ///
  /// All data saved locally will be erased and default configuration for every
  /// module will be restored.
  Future<void> reset() async {
    await _platform.reset();
  }

  /// Check the validity of the generated token
  /// after connecting with API Key and User ID
  Future<bool> isTokenValid() => _platform.isTokenValid();

  /// Deletes a driver's account
  Future<void> deleteAccount({bool instantDeletion = false}) =>
      _platform.deleteAccount(instantDeletion: instantDeletion);

  /// Check which DriveKit API Key you have set in the SDK.
  Future<String?> getApiKey() => _platform.getApiKey();

  /// DriveKit comes with a logging feature that is enabled by default.
  /// This feature allows you to quickly identify the cause of a problem.
  /// We recommend leaving the log enabled as it does not consume memory space
  /// and is useful in the support phase.
  /// However, if you don't want to use it, it can be disabled.
  Future<void> enableLogging({
    bool showInConsole = true,
    String androidLogPath = '/DriveKit',
  }) =>
      _platform.enableLogging(
        showInConsole: showInConsole,
        androidLogPath: androidLogPath,
      );

  /// You can disable the DriveKit logging by calling.
  /// It is however recommended to keep this setting enabled.
  Future<void> disableLogging({bool showInConsole = true}) =>
      _platform.disableLogging(showInConsole: showInConsole);

  /// Adds a listener on DriveKit core.
  /// See [DriveKitListener] to know which callbacks are available
  void addDriveKitListener(DriveKitListener listener) {
    _platform.addDriveKitListener(listener);
  }

  /// Removes a listener from DriveKit core.
  void removeDriveKitListener(DriveKitListener listener) {
    _platform.removeDriveKitListener(listener);
  }

  /// Removes all listeners from DriveKit core.
  void removeAllDriveKitListeners() {
    _platform.removeAllDriveKitListeners();
  }

  /// You can retrieve the Uri log file by calling the following method.
  Future<Uri?> getLogUriFile() => _platform.getLogUriFile();

  /// Adds a device configuration listener.
  /// See [DKDeviceConfigurationListener] to know which callbacks are available
  void addDeviceConfigurationListener(DKDeviceConfigurationListener listener) {
    _platform.addDeviceConfigurationListener(listener);
  }

  /// Removes a device configuration listener
  void removeDeviceConfigurationListener(
    DKDeviceConfigurationListener listener,
  ) {
    _platform.removeDeviceConfigurationListener(listener);
  }

  /// Removes all listeners from DriveKit core.
  void removeAllDeviceConfigurationListeners() {
    _platform.removeAllDeviceConfigurationListeners();
  }

  /// Retrieve user info data
  Future<GetUserInfoResponse> getUserInfo({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
  }) =>
      _platform.getUserInfo(synchronizationType: synchronizationType);
}
