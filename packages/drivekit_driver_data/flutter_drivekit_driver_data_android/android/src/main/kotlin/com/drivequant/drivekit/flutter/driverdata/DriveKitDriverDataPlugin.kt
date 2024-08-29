package com.drivequant.drivekit.flutter.driverdata

import android.content.Context
import com.drivequant.drivekit.databaseutils.entity.Route
import com.drivequant.drivekit.databaseutils.entity.Trip
import com.drivequant.drivekit.driverdata.DriveKitDriverData
import com.drivequant.drivekit.driverdata.trip.RouteQueryListener
import com.drivequant.drivekit.driverdata.trip.RouteStatus
import com.drivequant.drivekit.driverdata.trip.TripDeleteQueryListener
import com.drivequant.drivekit.driverdata.trip.TripQueryListener
import com.drivequant.drivekit.driverdata.trip.TripsQueryListener
import com.drivequant.drivekit.driverdata.trip.TripsSyncStatus
import com.drivequant.drivekit.flutter.driverdata.mapper.PigeonMapper
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DriveKitDriverDataPlugin :
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

    override fun getTripsOrderByDateAsc(synchronizationType: PigeonSynchronizationType, transportationModes: List<PigeonTransportationMode>, callback: (Result<PigeonGetTripsResponse>) -> Unit) {
        DriveKitDriverData.getTripsOrderByDateAsc(
            type = PigeonMapper.fromPigeonSynchronizationType(synchronizationType),
            transportationModes = transportationModes.map { PigeonMapper.fromPigeonTransportationMode(it) },
            listener = object : TripsQueryListener {
                override fun onResponse(status: TripsSyncStatus, trips: List<Trip>) {
                    callback(
                        Result.success(
                            PigeonGetTripsResponse(
                                status = PigeonMapper.toPigeonTripsSyncStatus(status),
                                trips = trips.map { PigeonMapper.toPigeonTrip(it) }
                            )
                        )
                    )
                }
            }
        )
    }

    override fun getTripsOrderByDateDesc(synchronizationType: PigeonSynchronizationType, transportationModes: List<PigeonTransportationMode>, callback: (Result<PigeonGetTripsResponse>) -> Unit) {
        DriveKitDriverData.getTripsOrderByDateDesc(
            type = PigeonMapper.fromPigeonSynchronizationType(synchronizationType),
            transportationModes = transportationModes.map { PigeonMapper.fromPigeonTransportationMode(it) },
            listener = object : TripsQueryListener {
                override fun onResponse(status: TripsSyncStatus, trips: List<Trip>) {
                    callback(
                        Result.success(
                            PigeonGetTripsResponse(
                                status = PigeonMapper.toPigeonTripsSyncStatus(status),
                                trips = trips.map { PigeonMapper.toPigeonTrip(it) }
                            )
                        )
                    )
                }
            }
        )
    }

    override fun getTrip(itinId: String, callback: (Result<PigeonGetTripResponse>) -> Unit) {
        DriveKitDriverData.getTrip(
            itinId = itinId,
            listener = object : TripQueryListener {
                override fun onResponse(status: TripsSyncStatus, trip: Trip?) {
                    val pigeonTrip: PigeonTrip? = trip?.let {
                        PigeonMapper.toPigeonTrip(it)
                    }

                    callback(
                        Result.success(
                            PigeonGetTripResponse(
                                status = PigeonMapper.toPigeonTripsSyncStatus(status),
                                trip = pigeonTrip
                            )
                        )
                    )
                }
            }
        )
    }

    override fun getRoute(itinId: String, callback: (Result<PigeonGetRouteResponse>) -> Unit) {
        DriveKitDriverData.getRoute(
            itinId = itinId,
            listener = object : RouteQueryListener {
                override fun onResponse(status: RouteStatus, route: Route?) {
                    val pigeonRoute: PigeonRoute? = route?.let {
                        PigeonMapper.toPigeonRoute(it)
                    }
                    callback(
                        Result.success(
                            PigeonGetRouteResponse(
                                status = PigeonMapper.toRouteStatus(status),
                                route = pigeonRoute
                            )
                        )
                    )
                }
            }
        )
    }

    override fun deleteTrip(itinId: String, callback: (Result<Boolean>) -> Unit) {
        DriveKitDriverData.deleteTrip(
            itinId,
            object : TripDeleteQueryListener {
                override fun onResponse(status: Boolean) {
                    callback(Result.success(status))
                }
            }
        )
    }
}
