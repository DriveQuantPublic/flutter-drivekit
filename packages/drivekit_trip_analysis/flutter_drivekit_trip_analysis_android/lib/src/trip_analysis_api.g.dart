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

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
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
  failed_to_delete,
  forbidden,
}

enum PigeonRequestError {
  no_network,
  unauthenticated,
  forbidden,
  server_error,
  client_error,
  unknown_error,
  limit_reached,
}

enum PigeonUpdateUserIdStatus {
  updated,
  failed_to_update,
  invalid_user_id,
  already_used,
  saved_for_repost,
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonDeleteAccountStatus) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else     if (value is PigeonRequestError) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else     if (value is PigeonUpdateUserIdStatus) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonDeleteAccountStatus.values[value];
      case 130: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonRequestError.values[value];
      case 131: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PigeonUpdateUserIdStatus.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class AndroidTripAnalysisApi {
  /// Constructor for [AndroidTripAnalysisApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AndroidTripAnalysisApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String __pigeon_messageChannelSuffix;

  Future<String> getPlatformName() async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.getPlatformName$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
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
      return (__pigeon_replyList[0] as String?)!;
    }
  }

  Future<void> activateAutoStart(bool activate) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.activateAutoStart$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[activate]) as List<Object?>?;
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

  Future<void> activateCrashDetection(bool activate) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.activateCrashDetection$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[activate]) as List<Object?>?;
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

  Future<void> startTrip() async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.startTrip$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
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

  Future<void> stopTrip() async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.stopTrip$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
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

  Future<void> cancelTrip() async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.cancelTrip$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
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

  Future<bool> isTripRunning() async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.isTripRunning$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
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
}

abstract class FlutterTripAnalysisApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void onAuthenticationError(PigeonRequestError errorType);

  static void setUp(FlutterTripAnalysisApi? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onAuthenticationError$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onAuthenticationError was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PigeonRequestError? arg_errorType = (args[0] as PigeonRequestError?);
          assert(arg_errorType != null,
              'Argument for dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onAuthenticationError was null, expected non-null PigeonRequestError.');
          try {
            api.onAuthenticationError(arg_errorType!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
