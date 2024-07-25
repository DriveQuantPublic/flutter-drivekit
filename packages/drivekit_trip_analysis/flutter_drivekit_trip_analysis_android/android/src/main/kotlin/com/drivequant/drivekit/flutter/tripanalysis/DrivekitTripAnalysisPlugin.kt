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

    override fun activateCrashDetection(activate: Boolean) {
        DriveKitTripAnalysis.activateCrashDetection(activate)
    }

    override fun startTrip() {
        DriveKitTripAnalysis.startTrip()
    }
    override fun stopTrip() {
        DriveKitTripAnalysis.stopTrip()
    }

    override fun cancelTrip() {
        DriveKitTripAnalysis.cancelTrip()
    }

    override fun isTripRunning(): Boolean = DriveKitTripAnalysis.isTripRunning()

    private fun configureDriveKitListener() {
        DriveKit.addDriveKitListener(
            object : DriveKitListener {
                override fun onAccountDeleted(status: DeleteAccountStatus) {
                    flutterApi?.pigeonOnAccountDeleted(status.toPigeon()) { echo ->
                        Result.success(echo)
                    }
                }

                override fun onAuthenticationError(errorType: RequestError) {
                    flutterApi?.pigeonOnAuthenticationError(errorType.toPigeon()) { echo ->
                        Result.success(echo)
                    }
                }

                override fun onConnected() {
                    flutterApi?.pigeonOnConnected { echo -> Result.success(echo) }
                }

                override fun onDisconnected() {
                    flutterApi?.pigeonOnDisconnected { echo -> Result.success(echo) }
                }

                override fun userIdUpdateStatus(status: UpdateUserIdStatus, userId: String?) {
                    flutterApi?.pigeonUserIdUpdateStatus(status.toPigeon(), userId) { echo ->
                        Result.success(echo)
                    }
                }
            }
        )
    }
}
