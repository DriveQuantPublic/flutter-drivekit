// Autogenerated from Pigeon (v20.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.drivequant.drivekit.flutter.tripanalysis

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterTripAnalysisError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

private fun createConnectionError(channelName: String): FlutterTripAnalysisError {
  return FlutterTripAnalysisError("channel-error",  "Unable to establish connection on channel: '$channelName'.", "")}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterTripAnalysisError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class PigeonDeleteAccountStatus(val raw: Int) {
  SUCCESS(0),
  FAILED_TO_DELETE(1),
  FORBIDDEN(2);

  companion object {
    fun ofRaw(raw: Int): PigeonDeleteAccountStatus? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class PigeonRequestError(val raw: Int) {
  NO_NETWORK(0),
  UNAUTHENTICATED(1),
  FORBIDDEN(2),
  SERVER_ERROR(3),
  CLIENT_ERROR(4),
  UNKNOWN_ERROR(5),
  LIMIT_REACHED(6);

  companion object {
    fun ofRaw(raw: Int): PigeonRequestError? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class PigeonUpdateUserIdStatus(val raw: Int) {
  UPDATED(0),
  FAILED_TO_UPDATE(1),
  INVALID_USER_ID(2),
  ALREADY_USED(3),
  SAVED_FOR_REPOST(4);

  companion object {
    fun ofRaw(raw: Int): PigeonUpdateUserIdStatus? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}
private object TripAnalysisApiPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as Int?)?.let {
          PigeonDeleteAccountStatus.ofRaw(it)
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as Int?)?.let {
          PigeonRequestError.ofRaw(it)
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as Int?)?.let {
          PigeonUpdateUserIdStatus.ofRaw(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is PigeonDeleteAccountStatus -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }
      is PigeonRequestError -> {
        stream.write(130)
        writeValue(stream, value.raw)
      }
      is PigeonUpdateUserIdStatus -> {
        stream.write(131)
        writeValue(stream, value.raw)
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface AndroidTripAnalysisApi {
  fun getPlatformName(): String
  fun activateAutoStart(activate: Boolean)
  fun activateCrashDetection(activate: Boolean)
  fun startTrip()
  fun stopTrip()
  fun cancelTrip()
  fun isTripRunning(): Boolean

  companion object {
    /** The codec used by AndroidTripAnalysisApi. */
    val codec: MessageCodec<Any?> by lazy {
      TripAnalysisApiPigeonCodec
    }
    /** Sets up an instance of `AndroidTripAnalysisApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: AndroidTripAnalysisApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.getPlatformName$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getPlatformName())
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.activateAutoStart$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val activateArg = args[0] as Boolean
            val wrapped: List<Any?> = try {
              api.activateAutoStart(activateArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.activateCrashDetection$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val activateArg = args[0] as Boolean
            val wrapped: List<Any?> = try {
              api.activateCrashDetection(activateArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.startTrip$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.startTrip()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.stopTrip$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.stopTrip()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.cancelTrip$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.cancelTrip()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.isTripRunning$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.isTripRunning())
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
/** Generated class from Pigeon that represents Flutter messages that can be called from Kotlin. */
class FlutterTripAnalysisApi(private val binaryMessenger: BinaryMessenger, private val messageChannelSuffix: String = "") {
  companion object {
    /** The codec used by FlutterTripAnalysisApi. */
    val codec: MessageCodec<Any?> by lazy {
      TripAnalysisApiPigeonCodec
    }
  }
  fun onAuthenticationError(errorTypeArg: PigeonRequestError, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onAuthenticationError$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(errorTypeArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterTripAnalysisError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onAccountDeleted(statusArg: PigeonDeleteAccountStatus, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onAccountDeleted$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(statusArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterTripAnalysisError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onConnected(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onConnected$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterTripAnalysisError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun onDisconnected(callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.onDisconnected$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(null) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterTripAnalysisError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  fun userIdUpdateStatus(statusArg: PigeonUpdateUserIdStatus, userIdArg: String?, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pigeon_trip_analysis_package.FlutterTripAnalysisApi.userIdUpdateStatus$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(statusArg, userIdArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterTripAnalysisError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
}
