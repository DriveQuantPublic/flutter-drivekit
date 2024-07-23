package com.drivequant.drivekit.flutter.core

import android.content.Context
import com.drivequant.drivekit.core.DriveKit
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitCorePlugin :
    FlutterPlugin,
    AndroidCoreApi {
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"

    override fun setApiKey(key: String) {
        DriveKit.setApiKey(key)
    }

    override fun setUserId(userId: String) {
        DriveKit.setUserId(userId)
    }

    override fun reset() {
        DriveKit.reset()
    }

    override fun isTokenValid(): Boolean = DriveKit.isTokenValid()
}
