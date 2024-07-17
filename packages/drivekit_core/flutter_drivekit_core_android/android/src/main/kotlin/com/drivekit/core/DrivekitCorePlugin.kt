package com.drivekit.core

import AndroidCoreApi
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.drivequant.drivekit.core.DriveKit

class DrivekitCorePlugin : FlutterPlugin, AndroidCoreApi {
    private var context: Context? = null


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String {
        return "android"
    }

    override fun setApiKey(key:String) {
       DriveKit.setApiKey(key)
    }

    override fun setUserId(userId:String) {
        DriveKit.setUserId(userId)
    }

}
