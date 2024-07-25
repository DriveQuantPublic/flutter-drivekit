package com.drivequant.drivekit.flutter.tripsimulator

import android.content.Context
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
}
