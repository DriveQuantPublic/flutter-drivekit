// PigeonMapper object with the mapping function
package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.flutter.tripanalysis.PigeonCancelTrip
import com.drivequant.drivekit.flutter.tripanalysis.PigeonStartMode
import com.drivequant.drivekit.flutter.tripanalysis.PigeonVehicle
import com.drivequant.drivekit.tripanalysis.entity.TripVehicle
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode

object PigeonMapper {
    fun fromPigeonVehicle(pigeonVehicle: PigeonVehicle): TripVehicle = TripVehicle(
        carTypeIndex = pigeonVehicle.carTypeIndex.toInt(),
        carEngineIndex = pigeonVehicle.carEngineIndex.toInt(),
        carPower = pigeonVehicle.carPower.toDouble(),
        carMass = pigeonVehicle.carMass.toDouble(),
        carGearboxIndex = pigeonVehicle.carGearboxIndex.toInt(),
        carConsumption = pigeonVehicle.carConsumption,
        carAutoGearboxNumber = pigeonVehicle.carAutoGearboxNumber.toInt(),
        engineDisplacement = pigeonVehicle.engineDisplacement.toDouble(),
        carPassengers = pigeonVehicle.carPassengers.toInt(),
        dqIndex = pigeonVehicle.dqIndex,
        sra = pigeonVehicle.sra,
        frontTireSize = pigeonVehicle.frontTireSize,
        rearTireSize = pigeonVehicle.rearTireSize,
        length = pigeonVehicle.length,
        width = pigeonVehicle.width,
        height = pigeonVehicle.height,
        engineCylinderNb = pigeonVehicle.engineCylinderNb.toInt(),
        driveWheels = pigeonVehicle.driveWheels.toInt()
    )

    fun toPigeonStartMode(startMode: StartMode): PigeonStartMode = when (startMode) {
        StartMode.GPS -> PigeonStartMode.GPS
        StartMode.BEACON -> PigeonStartMode.BEACON
        StartMode.MANUAL -> PigeonStartMode.MANUAL
        StartMode.GEOZONE -> PigeonStartMode.GEOZONE
        StartMode.BLUETOOTH -> PigeonStartMode.BLUETOOTH
        StartMode.UNKNOWN_BLUETOOTH -> PigeonStartMode.UNKNOWN_BLUETOOTH
        StartMode.BICYCLE_ACTIVITY -> PigeonStartMode.BICYCLE_ACTIVITY
        StartMode.CONNECTED_CAR -> PigeonStartMode.CONNECTED_CAR
    }

    fun toPigeonCancelTrip(cancelTrip: CancelTrip): PigeonCancelTrip = when (cancelTrip) {
        CancelTrip.USER -> PigeonCancelTrip.USER
        CancelTrip.HIGHSPEED -> PigeonCancelTrip.HIGHSPEED
        CancelTrip.NO_SPEED -> PigeonCancelTrip.NO_SPEED
        CancelTrip.NO_BEACON -> PigeonCancelTrip.NO_BEACON
        CancelTrip.NO_BLUETOOTH_DEVICE -> PigeonCancelTrip.NO_BLUETOOTH_DEVICE
        CancelTrip.MISSING_CONFIGURATION -> PigeonCancelTrip.MISSING_CONFIGURATION
        CancelTrip.NO_GPS_DATA -> PigeonCancelTrip.NO_GPS_DATA
        CancelTrip.RESET -> PigeonCancelTrip.RESET
        CancelTrip.BEACON_NO_SPEED -> PigeonCancelTrip.BEACON_NO_SPEED
        CancelTrip.BLUETOOTH_DEVICE_NO_SPEED -> PigeonCancelTrip.BLUETOOTH_DEVICE_NO_SPEED
    }
}
