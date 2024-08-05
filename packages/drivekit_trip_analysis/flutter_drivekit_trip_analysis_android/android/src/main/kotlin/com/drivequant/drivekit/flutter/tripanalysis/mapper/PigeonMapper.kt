// PigeonMapper object with the mapping function
package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.flutter.tripanalysis.PigeonCancelTrip
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCrashStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackSeverity
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonStartMode
import com.drivequant.drivekit.flutter.tripanalysis.PigeonState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonVehicle
import com.drivequant.drivekit.tripanalysis.entity.TripVehicle
import com.drivequant.drivekit.tripanalysis.model.crashdetection.DKCrashInfo
import com.drivequant.drivekit.tripanalysis.service.crashdetection.CrashStatus
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackSeverity
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackType
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode
import com.drivequant.drivekit.tripanalysis.service.recorder.State
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.*

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

    fun toPigeonState(state: State): PigeonState = when (state) {
        State.INACTIVE -> PigeonState.INACTIVE
        State.STARTING -> PigeonState.STARTING
        State.RUNNING -> PigeonState.RUNNING
        State.STOPPING -> PigeonState.STOPPING
        State.SENDING -> PigeonState.SENDING
    }

    fun toPigeonDKCrashInfo(crashInfo: DKCrashInfo): PigeonDKCrashInfo {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())

        return PigeonDKCrashInfo(
            crashId = crashInfo.crashId,
            date = backendDateFormat.format(crashInfo.date),
            status = this.toPigeonCrashStatus(crashInfo.status),
            probability = crashInfo.probability.toLong(),
            velocity = crashInfo.velocity,
            longitude = crashInfo.longitude,
            latitude = crashInfo.latitude
        )
    }

    fun toPigeonCrashStatus(crashStatus: CrashStatus): PigeonCrashStatus = when (crashStatus) {
        CrashStatus.CONFIRMED -> PigeonCrashStatus.CONFIRMED
        CrashStatus.UNCONFIRMED -> PigeonCrashStatus.UNCONFIRMED
    }

    fun toPigeonDKCrashFeedbackType(feedbackType: CrashFeedbackType): PigeonDKCrashFeedbackType = when (feedbackType) {
        CrashFeedbackType.NO_FEEDBACK -> PigeonDKCrashFeedbackType.NO_FEEDBACK
        CrashFeedbackType.NO_CRASH -> PigeonDKCrashFeedbackType.NO_CRASH
        CrashFeedbackType.CRASH_CONFIRMED -> PigeonDKCrashFeedbackType.CRASH_CONFIRMED
    }

    fun toPigeonDKCrashFeedbackSeverity(severity: CrashFeedbackSeverity): PigeonDKCrashFeedbackSeverity = when (severity) {
        CrashFeedbackSeverity.NONE -> PigeonDKCrashFeedbackSeverity.NONE
        CrashFeedbackSeverity.MINOR -> PigeonDKCrashFeedbackSeverity.MINOR
        CrashFeedbackSeverity.CRITICAL -> PigeonDKCrashFeedbackSeverity.CRITICAL
    }
}
