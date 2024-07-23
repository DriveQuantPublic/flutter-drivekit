package com.drivequant.drivekit.flutter.tripanalysis

import android.content.Context
import com.drivequant.drivekit.core.DriveKit
import com.drivequant.drivekit.core.driver.UpdateUserIdStatus
import com.drivequant.drivekit.core.driver.deletion.DeleteAccountStatus
import com.drivequant.drivekit.core.networking.DriveKitListener
import com.drivequant.drivekit.core.networking.RequestError
import com.drivequant.drivekit.flutter.tripanalysis.mapper.PigeonMapper.toPigeon
import com.drivequant.drivekit.tripanalysis.DriveKitTripAnalysis
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitTripAnalysisPlugin :
    FlutterPlugin,
    AndroidTripAnalysisApi {
    private var context: Context? = null
    private var flutterApi: FlutterTripAnalysisApi? = null

    init {
        configureDriveKitListener()
    }

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

    private fun configureDriveKitListener() {
        DriveKit.addDriveKitListener(object : DriveKitListener {
            override fun onAccountDeleted(status: DeleteAccountStatus) {
                TODO("Not yet implemented")
            }

            override fun onAuthenticationError(errorType: RequestError) {
                flutterApi?.onAuthenticationError(errorType.toPigeon()) { echo ->
                    Result.success(echo)
                }
            }

            override fun onConnected() {
                TODO("Not yet implemented")
            }

            override fun onDisconnected() {
                TODO("Not yet implemented")
            }

            override fun userIdUpdateStatus(status: UpdateUserIdStatus, userId: String?) {
                TODO("Not yet implemented")
            }
        })
    }
}
