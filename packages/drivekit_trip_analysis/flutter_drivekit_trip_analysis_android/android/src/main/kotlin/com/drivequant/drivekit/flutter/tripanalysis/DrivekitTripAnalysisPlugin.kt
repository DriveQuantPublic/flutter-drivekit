package com.drivequant.drivekit.flutter.tripanalysis

import android.content.Context
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitTripAnalysisPlugin :
    FlutterPlugin,
    AndroidTripAnalysisApi {
    private var context: Context? = null
    private var flutterApi: FlutterTripAnalysisApi? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(flutterPluginBinding.binaryMessenger, this)
        flutterApi = FlutterTripAnalysisApi(flutterPluginBinding.binaryMessenger)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidTripAnalysisApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"

    override fun activateAutoStart(activate: Boolean) {
        DriveKitTripAnalysis.activateAutoStart(activate)
    }

    // example of how to call flutter from native, will be used with listener
    private fun onAuthenticationError(requestError: PigeonRequestError) {
        flutterApi?.onAuthenticationError(requestError) { echo ->
            Result.success(echo)
        }
    }
}
