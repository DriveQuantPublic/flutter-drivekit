package com.drivequant.drivekit.flutter.driverdata

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitDriverDataPlugin :
    FlutterPlugin,
    AndroidDriverDataApi {
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidDriverDataApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidDriverDataApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"
}
