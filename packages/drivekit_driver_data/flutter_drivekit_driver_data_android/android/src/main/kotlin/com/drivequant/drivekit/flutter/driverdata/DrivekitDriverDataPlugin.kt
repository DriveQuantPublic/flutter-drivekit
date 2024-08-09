package com.drivequant.drivekit.flutter.driverdata

import android.content.Context
import com.drivequant.drivekit.driverdata.DriveKitDriverData
import com.drivequant.drivekit.driverdata.trip.TripDeleteQueryListener
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

    override fun deleteTrip(itinId: String): Boolean {
        DriveKitDriverData.deleteTrip(
            itinId,
            object : TripDeleteQueryListener {
                override fun onResponse(status: Boolean) {
                    // to be implemented
                }
            }
        )
        return false
    }
}
