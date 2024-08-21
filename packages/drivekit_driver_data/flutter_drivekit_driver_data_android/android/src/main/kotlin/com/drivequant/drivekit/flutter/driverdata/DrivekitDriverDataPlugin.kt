package com.drivequant.drivekit.flutter.driverdata

import android.content.Context
import com.drivequant.drivekit.core.SynchronizationType
import com.drivequant.drivekit.databaseutils.entity.Trip
import com.drivequant.drivekit.driverdata.DriveKitDriverData
import com.drivequant.drivekit.driverdata.trip.TripDeleteQueryListener
import com.drivequant.drivekit.driverdata.trip.TripsQueryListener
import com.drivequant.drivekit.driverdata.trip.TripsSyncStatus
import com.drivequant.drivekit.flutter.driverdata.mapper.PigeonMapper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine
import kotlinx.coroutines.runBlocking

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

    override fun deleteTrip(itinId: String): Boolean = runBlocking {
        suspendCoroutine {
            DriveKitDriverData.deleteTrip(
                itinId,
                object : TripDeleteQueryListener {
                    override fun onResponse(status: Boolean) {
                        it.resume(status)
                    }
                }
            )
        }
    }

    override fun getTripsOrderByDateAsc(): PigeonGetTripsResponse = runBlocking {
        suspendCoroutine {
            DriveKitDriverData.getTripsOrderByDateAsc(
                type = SynchronizationType.DEFAULT,
                listener = object : TripsQueryListener {
                    override fun onResponse(status: TripsSyncStatus, trips: List<Trip>) {
                        it.resume(
                            PigeonGetTripsResponse(
                                status = PigeonMapper.toPigeonTripsSyncStatus(status),
                                trips = trips.map { PigeonMapper.toPigeonTrip(it) }
                            )
                        )
                    }
                }
            )
        }
    }
}
