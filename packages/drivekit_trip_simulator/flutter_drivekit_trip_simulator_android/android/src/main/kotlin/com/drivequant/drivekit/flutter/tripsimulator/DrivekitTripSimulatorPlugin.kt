package com.drivequant.drivekit.flutter.tripsimulator

import android.content.Context
import com.drivequant.drivekit.tripsimulator.DriveKitTripSimulator
import com.drivequant.drivekit.tripsimulator.PresetTrip
import com.drivequant.drivekit.tripsimulator.model.PresetTripCrash1
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitTripSimulatorPlugin :
    FlutterPlugin,
    AndroidTripSimulatorApi {
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripSimulatorApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripSimulatorApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"

    override fun start(presetTrip: PigeonPresetTrip) {
        when (presetTrip) {
            PigeonPresetTrip.SHORT_TRIP -> DriveKitTripSimulator.start(PresetTrip.SHORT_TRIP)
            PigeonPresetTrip.MIXED_TRIP -> DriveKitTripSimulator.start(PresetTrip.MIXED_TRIP)
            PigeonPresetTrip.CITY_TRIP -> DriveKitTripSimulator.start(PresetTrip.CITY_TRIP)
            PigeonPresetTrip.SUBURBAN_TRIP -> DriveKitTripSimulator.start(PresetTrip.SUBURBAN_TRIP)
            PigeonPresetTrip.HIGHWAY_TRIP -> DriveKitTripSimulator.start(PresetTrip.HIGHWAY_TRIP)
            PigeonPresetTrip.TRAIN_TRIP -> DriveKitTripSimulator.start(PresetTrip.TRAIN_TRIP)
            PigeonPresetTrip.BOAT_TRIP -> DriveKitTripSimulator.start(PresetTrip.BOAT_TRIP)
            PigeonPresetTrip.BUS_TRIP -> DriveKitTripSimulator.start(PresetTrip.BUS_TRIP)
            PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED10KM_H -> DriveKitTripSimulator.start(PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_10KMH))
            PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED20KM_H -> DriveKitTripSimulator.start(PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_20KMH))
            PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED30KM_H -> DriveKitTripSimulator.start(PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.CONFIRMED_30KMH))
            PigeonPresetTrip.TRIP_WITH_CRASH_UNCONFIRMED0KM_H -> DriveKitTripSimulator.start(PresetTrip.TRIP_WITH_CRASH_1(PresetTripCrash1.UNCONFIRMED_0KMH))
            PigeonPresetTrip.TRIP_WITH_CRASH_CONFIRMED30KM_HSTILL_DRIVING -> DriveKitTripSimulator.start(PresetTrip.TRIP_WITH_CRASH_2_STILL_DRIVING)
        }
    }

    override fun stop() {
        DriveKitTripSimulator.stop()
    }
}
