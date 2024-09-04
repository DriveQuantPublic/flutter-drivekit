// Autogenerated from Pigeon (v20.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse(
    {Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden,
}

enum PigeonRequestError {
  wrongUrl,
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  limitReached,
  unknownError,
}

enum PigeonUpdateUserIdStatus {
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost,
}

enum PigeonBackgroundFetchStatus {
  started,
  completed,
}

enum PigeonDeviceConfigurationEvent {
  locationSensorValid,
  locationSensorInvalid,
  bluetoothSensorValid,
  bluetoothSensorInvalid,
  locationPermissionValid,
  locationPermissionInvalid,
  activityPermissionValid,
  activityPermissionInvalid,
  notificationPermissionValid,
  notificationPermissionInvalid,
  bluetoothPermissionValid,
  bluetoothPermissionInvalid,
  lowPowerModeValid,
  lowPowerModeInvalid,
}

/// Trip Synchronization Type
enum PigeonSynchronizationType {
  /// synchronize by calling the DriveQuant servers
  defaultSync,

  /// retrieve already synchronized items in the local database
  cache,
}

/// User info synchronization status enum
enum PigeonUserInfoSyncStatus {
  /// Synchronization has been successfully performed
  success,

  /// SynchronizationType has been set to cache.
  cacheDataOnly,

  /// Synchronization has failed,
  /// only user info previously synchronized is returned
  failedToSyncTripsCacheOnly,
}

/// User Info
class PigeonUserInfo {
  PigeonUserInfo({
    this.firstname,
    this.lastname,
    this.pseudo,
  });

  String? firstname;

  String? lastname;

  String? pseudo;

  Object encode() {
    return <Object?>[
      firstname,
      lastname,
      pseudo,
    ];
  }

  static PigeonUserInfo decode(Object result) {
    result as List<Object?>;
    return PigeonUserInfo(
      firstname: result[0] as String?,
      lastname: result[1] as String?,
      pseudo: result[2] as String?,
    );
  }
}

/// the response returned when getting user info
class PigeonGetUserInfoResponse {
  PigeonGetUserInfoResponse({
    required this.status,
    this.userInfo,
  });

  /// user info sync status
  /// final PigeonUserInfoSyncStatus status
  PigeonUserInfoSyncStatus status;

  /// user info data
  PigeonUserInfo? userInfo;

  Object encode() {
    return <Object?>[
      status,
      userInfo,
    ];
  }

  static PigeonGetUserInfoResponse decode(Object result) {
    result as List<Object?>;
    return PigeonGetUserInfoResponse(
      status: result[0]! as PigeonUserInfoSyncStatus,
      userInfo: result[1] as PigeonUserInfo?,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonUserInfo) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is PigeonGetUserInfoResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is PigeonDeleteAccountStatus) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    } else if (value is PigeonRequestError) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    } else if (value is PigeonUpdateUserIdStatus) {
      buffer.putUint8(133);
      writeValue(buffer, value.index);
    } else if (value is PigeonBackgroundFetchStatus) {
      buffer.putUint8(134);
      writeValue(buffer, value.index);
    } else if (value is PigeonDeviceConfigurationEvent) {
      buffer.putUint8(135);
      writeValue(buffer, value.index);
    } else if (value is PigeonSynchronizationType) {
      buffer.putUint8(136);
      writeValue(buffer, value.index);
    } else if (value is PigeonUserInfoSyncStatus) {
      buffer.putUint8(137);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        return PigeonUserInfo.decode(readValue(buffer)!);
      case 130:
        return PigeonGetUserInfoResponse.decode(readValue(buffer)!);
      case 131:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonDeleteAccountStatus.values[value];
      case 132:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonRequestError.values[value];
      case 133:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonUpdateUserIdStatus.values[value];
      case 134:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonBackgroundFetchStatus.values[value];
      case 135:
        final int? value = readValue(buffer) as int?;
        return value == null
            ? null
            : PigeonDeviceConfigurationEvent.values[value];
      case 136:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonSynchronizationType.values[value];
      case 137:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonUserInfoSyncStatus.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class IOSCoreApi {
  /// Constructor for [IOSCoreApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  IOSCoreApi(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String __pigeon_messageChannelSuffix;

  Future<void> setApiKey(String key) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.setApiKey$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[key]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setUserId(String userId) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.setUserId$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[userId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String?> getUserId() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getUserId$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return (__pigeon_replyList[0] as String?);
    }
  }

  Future<void> updateUserId(String userId) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.updateUserId$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[userId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<PigeonGetUserInfoResponse> getUserInfo(
      {PigeonSynchronizationType synchronizationType =
          PigeonSynchronizationType.defaultSync}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getUserInfo$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[synchronizationType]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as PigeonGetUserInfoResponse?)!;
    }
  }

  Future<bool> updateUserInfo(PigeonUserInfo userInfo) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.updateUserInfo$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[userInfo]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<void> reset() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.reset$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool> isTokenValid() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.isTokenValid$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<void> deleteAccount({bool instantDeletion = false}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.deleteAccount$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[instantDeletion]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String?> getApiKey() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getApiKey$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return (__pigeon_replyList[0] as String?);
    }
  }

  Future<void> enableLogging({bool showInConsole = true}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.enableLogging$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[showInConsole]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> disableLogging({bool showInConsole = true}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.disableLogging$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[showInConsole]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String?> getLogUriFile() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getLogUriFile$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return (__pigeon_replyList[0] as String?);
    }
  }
}

abstract class FlutterCoreApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void driveKitDidConnect();

  void driveKitDidDisconnect();

  void driveKitDidReceiveAuthenticationError(PigeonRequestError error);

  void userIdUpdateStatusChanged(
      PigeonUpdateUserIdStatus status, String? userId);

  void driveKitAccountDeletionCompleted(PigeonDeleteAccountStatus status);

  void driveKitBackgroundFetchStatusChanged(PigeonBackgroundFetchStatus status);

  void onDeviceConfigurationChanged(PigeonDeviceConfigurationEvent event);

  static void setUp(
    FlutterCoreApi? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidConnect$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          try {
            api.driveKitDidConnect();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidDisconnect$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          try {
            api.driveKitDidDisconnect();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidReceiveAuthenticationError$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidReceiveAuthenticationError was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonRequestError? arg_error =
              (args[0] as PigeonRequestError?);
          assert(arg_error != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidReceiveAuthenticationError was null, expected non-null PigeonRequestError.');
          try {
            api.driveKitDidReceiveAuthenticationError(arg_error!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.userIdUpdateStatusChanged$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.userIdUpdateStatusChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonUpdateUserIdStatus? arg_status =
              (args[0] as PigeonUpdateUserIdStatus?);
          assert(arg_status != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.userIdUpdateStatusChanged was null, expected non-null PigeonUpdateUserIdStatus.');
          final String? arg_userId = (args[1] as String?);
          try {
            api.userIdUpdateStatusChanged(arg_status!, arg_userId);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitAccountDeletionCompleted$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitAccountDeletionCompleted was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonDeleteAccountStatus? arg_status =
              (args[0] as PigeonDeleteAccountStatus?);
          assert(arg_status != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitAccountDeletionCompleted was null, expected non-null PigeonDeleteAccountStatus.');
          try {
            api.driveKitAccountDeletionCompleted(arg_status!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitBackgroundFetchStatusChanged$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitBackgroundFetchStatusChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonBackgroundFetchStatus? arg_status =
              (args[0] as PigeonBackgroundFetchStatus?);
          assert(arg_status != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitBackgroundFetchStatusChanged was null, expected non-null PigeonBackgroundFetchStatus.');
          try {
            api.driveKitBackgroundFetchStatusChanged(arg_status!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.onDeviceConfigurationChanged$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.onDeviceConfigurationChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonDeviceConfigurationEvent? arg_event =
              (args[0] as PigeonDeviceConfigurationEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.onDeviceConfigurationChanged was null, expected non-null PigeonDeviceConfigurationEvent.');
          try {
            api.onDeviceConfigurationChanged(arg_event!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
