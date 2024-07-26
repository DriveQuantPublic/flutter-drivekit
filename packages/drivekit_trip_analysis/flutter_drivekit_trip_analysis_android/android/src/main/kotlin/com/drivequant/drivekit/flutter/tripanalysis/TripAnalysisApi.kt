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
private object TripAnalysisApiPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return     super.readValueOfType(type, buffer)
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    super.writeValue(stream, value)
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
  fun setMonitorPotentialTripStart(activate: Boolean)
  fun getMonitorPotentialTripStart(): Boolean

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
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.setMonitorPotentialTripStart$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val activateArg = args[0] as Boolean
            val wrapped: List<Any?> = try {
              api.setMonitorPotentialTripStart(activateArg)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_analysis_package.AndroidTripAnalysisApi.getMonitorPotentialTripStart$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              listOf(api.getMonitorPotentialTripStart())
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
