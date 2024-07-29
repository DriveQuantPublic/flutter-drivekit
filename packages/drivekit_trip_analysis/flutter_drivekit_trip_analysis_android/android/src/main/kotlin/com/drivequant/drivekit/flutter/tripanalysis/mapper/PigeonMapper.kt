// PigeonMapper object with the mapping function
package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.flutter.tripanalysis.PigeonVehicle
import com.drivequant.drivekit.tripanalysis.entity.TripVehicle

object PigeonMapper {
    fun fromPigeonVehicle(pigeonVehicle: PigeonVehicle): TripVehicle = TripVehicle(
        carTypeIndex = pigeonVehicle.carTypeIndex.toInt(),
        carEngineIndex = pigeonVehicle.carEngineIndex.toInt(),
        carPower = pigeonVehicle.carPower,
        carMass = pigeonVehicle.carMass,
        carGearboxIndex = pigeonVehicle.carGearboxIndex.toInt(),
        carConsumption = pigeonVehicle.carConsumption,
        carAutoGearboxNumber = pigeonVehicle.carAutoGearboxNumber.toInt(),
        engineDisplacement = pigeonVehicle.engineDisplacement,
        carPassengers = pigeonVehicle.carPassengers.toInt(),
        dqIndex = pigeonVehicle.dqIndex,
        sra = pigeonVehicle.sra,
        frontTireSize = pigeonVehicle.frontTireSize,
        rearTireSize = pigeonVehicle.rearTireSize,
        length = pigeonVehicle.length,
        width = pigeonVehicle.width,
        height = pigeonVehicle.height,
        engineCylinderNb = pigeonVehicle.engineCylinderNb?.toInt(),
        driveWheels = pigeonVehicle.driveWheels?.toInt()
    )
}
