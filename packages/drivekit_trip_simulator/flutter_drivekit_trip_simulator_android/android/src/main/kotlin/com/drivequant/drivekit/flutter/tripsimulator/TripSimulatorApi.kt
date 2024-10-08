// Autogenerated from Pigeon (v20.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.drivequant.drivekit.flutter.tripsimulator

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
  return if (exception is FlutterCoreError) {
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
class FlutterCoreError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class PigeonPresetTrip(val raw: Int) {
  SHORT_TRIP(0),
  MIXED_TRIP(1),
  CITY_TRIP(2),
  SUBURBAN_TRIP(3),
  HIGHWAY_TRIP(4),
  TRAIN_TRIP(5),
  BOAT_TRIP(6),
  BUS_TRIP(7),
  TRIP_WITH_CRASH_CONFIRMED10KM_H(8),
  TRIP_WITH_CRASH_CONFIRMED20KM_H(9),
  TRIP_WITH_CRASH_CONFIRMED30KM_H(10),
  TRIP_WITH_CRASH_UNCONFIRMED0KM_H(11),
  TRIP_WITH_CRASH_CONFIRMED30KM_HSTILL_DRIVING(12);

  companion object {
    fun ofRaw(raw: Int): PigeonPresetTrip? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}
private object TripSimulatorApiPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as Int?)?.let {
          PigeonPresetTrip.ofRaw(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is PigeonPresetTrip -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface AndroidTripSimulatorApi {
  fun start(presetTrip: PigeonPresetTrip)
  fun stop()

  companion object {
    /** The codec used by AndroidTripSimulatorApi. */
    val codec: MessageCodec<Any?> by lazy {
      TripSimulatorApiPigeonCodec
    }
    /** Sets up an instance of `AndroidTripSimulatorApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: AndroidTripSimulatorApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_simulator_package.AndroidTripSimulatorApi.start$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val presetTripArg = args[0] as PigeonPresetTrip
            val wrapped: List<Any?> = try {
              api.start(presetTripArg)
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
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pigeon_trip_simulator_package.AndroidTripSimulatorApi.stop$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.stop()
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
    }
  }
}
