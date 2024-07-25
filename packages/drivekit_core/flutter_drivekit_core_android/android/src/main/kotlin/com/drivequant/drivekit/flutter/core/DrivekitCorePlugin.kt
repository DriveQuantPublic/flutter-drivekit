package com.drivequant.drivekit.flutter.core

import android.content.Context
import com.drivequant.drivekit.core.DriveKit
import com.drivequant.drivekit.core.driver.UpdateUserIdStatus
import com.drivequant.drivekit.core.driver.deletion.DeleteAccountStatus
import com.drivequant.drivekit.core.networking.DriveKitListener
import com.drivequant.drivekit.core.networking.RequestError
import com.drivequant.drivekit.flutter.core.mapper.PigeonMapper.toPigeon
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DrivekitCorePlugin :
    FlutterPlugin,
    AndroidCoreApi {
    private var context: Context? = null
    private var flutterApi: FlutterCoreApi? = null

    init {
        configureDriveKitListener()
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(flutterPluginBinding.binaryMessenger, this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(binding.binaryMessenger, null)
        context = null
    }

    override fun getPlatformName(): String = "android"

    override fun getApiKey() = DriveKit.getApiKey()

    override fun setApiKey(key: String) {
        DriveKit.setApiKey(key)
    }

    override fun setUserId(userId: String) {
        DriveKit.setUserId(userId)
    }

    override fun getUserId(): String? = DriveKit.config.userId

    override fun reset() {
        DriveKit.reset()
    }

    override fun isTokenValid(): Boolean = DriveKit.isTokenValid()

    override fun deleteAccount(instantDeletion: Boolean) {
        DriveKit.deleteAccount(instantDeletion)
    }

    override fun disableLogging(showInConsole: Boolean) {
        DriveKit.disableLogging(showInConsole)
    }

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
