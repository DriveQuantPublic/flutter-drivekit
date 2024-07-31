package com.drivequant.drivekit.flutter.tripsimulator

import android.content.Context
import com.drivequant.drivekit.flutter.core.mapper.TripSimulatorPigeonMapper
import com.drivequant.drivekit.tripsimulator.DriveKitTripSimulator
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
        DriveKitTripSimulator.start(TripSimulatorPigeonMapper.fromPresetTrip(presetTrip))
    }

    override fun stop() {
        DriveKitTripSimulator.stop()
    }
}
