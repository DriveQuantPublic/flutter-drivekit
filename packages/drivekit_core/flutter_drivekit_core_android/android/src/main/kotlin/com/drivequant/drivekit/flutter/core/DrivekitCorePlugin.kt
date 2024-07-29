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
        flutterApi = FlutterCoreApi(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        AndroidCoreApi.setUp(binding.binaryMessenger, null)
        context = null
        flutterApi = null
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

    override fun enableLogging(showInConsole: Boolean, androidLogPath: String) {
        DriveKit.enableLogging(androidLogPath, showInConsole)
    }

    override fun disableLogging(showInConsole: Boolean) {
        DriveKit.disableLogging(showInConsole)
    }

    private fun configureDriveKitListener() {
        DriveKit.addDriveKitListener(
            object : DriveKitListener {
                override fun onAccountDeleted(status: DeleteAccountStatus) {
                    flutterApi?.onAccountDeleted(status.toPigeon()) { echo ->
                        Result.success(echo)
                    }
                }

                override fun onAuthenticationError(errorType: RequestError) {
                    flutterApi?.onAuthenticationError(errorType.toPigeon()) { echo ->
                        Result.success(echo)
                    }
                }

                override fun onConnected() {
                    flutterApi?.onConnected { echo -> Result.success(echo) }
                }

                override fun onDisconnected() {
                    flutterApi?.onDisconnected { echo -> Result.success(echo) }
                }

                override fun userIdUpdateStatus(status: UpdateUserIdStatus, userId: String?) {
                    flutterApi?.userIdUpdateStatus(status.toPigeon(), userId) { echo ->
                        Result.success(echo)
                    }
                }
            }
        )
    }
}
