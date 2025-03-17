// PigeonMapper object with the mapping function
package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.core.SynchronizationType
import com.drivequant.drivekit.core.common.model.DKCoordinateAccuracy
import com.drivequant.drivekit.core.common.model.DKTripLocation
import com.drivequant.drivekit.core.extension.toDriveKitBackendFormat
import com.drivequant.drivekit.databaseutils.entity.AdvancedEnergyEstimation
import com.drivequant.drivekit.databaseutils.entity.BrakeWear
import com.drivequant.drivekit.databaseutils.entity.Call
import com.drivequant.drivekit.databaseutils.entity.DeclaredTransportationMode
import com.drivequant.drivekit.databaseutils.entity.DriverDistraction
import com.drivequant.drivekit.databaseutils.entity.EcoDriving
import com.drivequant.drivekit.databaseutils.entity.EcoDrivingContext
import com.drivequant.drivekit.databaseutils.entity.EnergyEstimation
import com.drivequant.drivekit.databaseutils.entity.EvaluationData
import com.drivequant.drivekit.databaseutils.entity.FuelEstimation
import com.drivequant.drivekit.databaseutils.entity.FuelEstimationDrivingContext
import com.drivequant.drivekit.databaseutils.entity.Logbook
import com.drivequant.drivekit.databaseutils.entity.ManeuverData
import com.drivequant.drivekit.databaseutils.entity.Pollutants
import com.drivequant.drivekit.databaseutils.entity.Safety
import com.drivequant.drivekit.databaseutils.entity.SafetyContext
import com.drivequant.drivekit.databaseutils.entity.SafetyEvent
import com.drivequant.drivekit.databaseutils.entity.SpeedLimitContext
import com.drivequant.drivekit.databaseutils.entity.SpeedingStatistics
import com.drivequant.drivekit.databaseutils.entity.TireWear
import com.drivequant.drivekit.databaseutils.entity.Trip
import com.drivequant.drivekit.databaseutils.entity.TripAdvice
import com.drivequant.drivekit.databaseutils.entity.TripStatistics
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAccuracyLevel
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedEcoDriving
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedEnergyEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedFuelEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedSafety
import com.drivequant.drivekit.flutter.tripanalysis.PigeonBrakeWear
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCall
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCancelTrip
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCrashStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCreateTripSharingLinkResponse
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCreateTripSharingLinkStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCurrentTripInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackSeverity
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDeclaredTransportationMode
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDriverDistraction
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEcoDriving
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEcoDrivingContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEnergyEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEvaluationData
import com.drivequant.drivekit.flutter.tripanalysis.PigeonFuelEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonFuelEstimationContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonGetTripSharingLinkResponse
import com.drivequant.drivekit.flutter.tripanalysis.PigeonGetTripSharingLinkStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonLastTripLocation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonLogbook
import com.drivequant.drivekit.flutter.tripanalysis.PigeonManeuverData
import com.drivequant.drivekit.flutter.tripanalysis.PigeonPollutants
import com.drivequant.drivekit.flutter.tripanalysis.PigeonRevokeTripSharingLinkStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafety
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafetyContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafetyEvent
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSpeedLimitContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSpeedingStatistics
import com.drivequant.drivekit.flutter.tripanalysis.PigeonStartMode
import com.drivequant.drivekit.flutter.tripanalysis.PigeonState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSynchronizationType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTireWear
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTrip
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripAdviceData
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripAdviceEvaluation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripCancelationReason
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripPoint
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripRecordingCanceledState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripRecordingConfirmedState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripRecordingFinishedState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripRecordingStartedState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseError
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseInfoItem
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseStatusType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripSharingLink
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripStatistics
import com.drivequant.drivekit.flutter.tripanalysis.PigeonVehicle
import com.drivequant.drivekit.tripanalysis.entity.TripPoint
import com.drivequant.drivekit.tripanalysis.entity.TripResponseError
import com.drivequant.drivekit.tripanalysis.entity.TripResponseInfo
import com.drivequant.drivekit.tripanalysis.entity.TripVehicle
import com.drivequant.drivekit.tripanalysis.model.crashdetection.DKCrashInfo
import com.drivequant.drivekit.tripanalysis.model.currenttripinfo.DKTripInfo
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripCancelationReason
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingCanceledState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingConfirmedState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingFinishedState
import com.drivequant.drivekit.tripanalysis.model.triplistener.DKTripRecordingStartedState
import com.drivequant.drivekit.tripanalysis.service.crashdetection.CrashStatus
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackSeverity
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackType
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode
import com.drivequant.drivekit.tripanalysis.service.recorder.State
import com.drivequant.drivekit.tripanalysis.service.tripsharing.model.CreateTripSharingLinkStatus
import com.drivequant.drivekit.tripanalysis.service.tripsharing.model.DKTripSharingLink
import com.drivequant.drivekit.tripanalysis.service.tripsharing.model.GetTripSharingLinkStatus
import com.drivequant.drivekit.tripanalysis.service.tripsharing.model.RevokeTripSharingLinkStatus
import com.drivequant.drivekit.tripanalysis.utils.TripResult
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.*

object PigeonMapper {
    private const val DATE_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    fun PigeonSynchronizationType.fromPigeonSynchronizationType(): SynchronizationType = when (this) {
        PigeonSynchronizationType.DEFAULT_SYNC -> SynchronizationType.DEFAULT
        PigeonSynchronizationType.CACHE -> SynchronizationType.CACHE
    }

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
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())

        return PigeonDKCrashInfo(
            crashId = crashInfo.crashId,
            date = backendDateFormat.format(crashInfo.date),
            status = this.toPigeonCrashStatus(crashInfo.status),
            probability = crashInfo.probability.toLong(),
            velocity = crashInfo.velocity,
            longitude = crashInfo.longitude,
            latitude = crashInfo.latitude,
            userLocationUrl = crashInfo.userLocationUrl
        )
    }

    private fun toPigeonCrashStatus(crashStatus: CrashStatus): PigeonCrashStatus = when (crashStatus) {
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

    fun toPigeonTripPoint(tripPoint: TripPoint): PigeonTripPoint = PigeonTripPoint(
        accuracy = tripPoint.accuracy,
        distance = tripPoint.distance,
        duration = tripPoint.duration,
        elevation = tripPoint.elevation,
        heading = tripPoint.heading,
        latitude = tripPoint.latitude,
        longitude = tripPoint.longitude,
        speed = tripPoint.speed
    )

    private fun toPigeonEcoDriving(ecoDriving: EcoDriving): PigeonEcoDriving = PigeonEcoDriving(
        score = ecoDriving.score,
        scoreAccel = ecoDriving.scoreAccel,
        scoreMain = ecoDriving.scoreMain,
        scoreDecel = ecoDriving.scoreDecel,
        stdDevAccel = ecoDriving.stdDevAccel,
        stdDevMain = ecoDriving.stdDevMain,
        stdDevDecel = ecoDriving.stdDevDecel,
        energyClass = ecoDriving.energyClass.toLong()
    )

    private fun toPigeonTripStatistics(tripStatistics: TripStatistics): PigeonTripStatistics = PigeonTripStatistics(
        drivingDuration = tripStatistics.drivingDuration,
        idlingDuration = tripStatistics.idlingDuration,
        drivingPercentage = tripStatistics.drivingPercentage,
        idlingPercentage = tripStatistics.idlingPercentage,
        distance = tripStatistics.distance,
        speedMean = tripStatistics.speedMean,
        subdispNb = tripStatistics.subdispNb.toLong(),
        meteo = tripStatistics.meteo.toLong(),
        day = tripStatistics.day,
        weekDay = tripStatistics.weekday,
        tripDuration = tripStatistics.duration
    )

    private fun toPigeonFuelEstimation(fuelEstimation: FuelEstimation): PigeonFuelEstimation = PigeonFuelEstimation(
        co2Mass = fuelEstimation.co2Mass,
        co2Emission = fuelEstimation.co2Emission,
        fuelVolume = fuelEstimation.fuelVolume,
        fuelConsumption = fuelEstimation.fuelConsumption,
        idleFuelVolume = fuelEstimation.idleFuelVolume,
        idleFuelPercentage = fuelEstimation.idleFuelPercentage,
        idleFuelConsumption = fuelEstimation.idleFuelConsumption,
        idleCo2Emission = fuelEstimation.idleCo2Emission,
        idleCo2Mass = fuelEstimation.idleCo2Mass,
        engineTempStatus = fuelEstimation.engineTempStatus,
        coldFuelVolume = fuelEstimation.coldFuelVolume
    )

    private fun toPigeonSafety(safety: Safety): PigeonSafety = PigeonSafety(
        nbAdh = safety.nbAdh.toLong(),
        nbAccel = safety.nbAccel.toLong(),
        nbDecel = safety.nbDecel.toLong(),
        nbAdhCrit = safety.nbAdhCrit.toLong(),
        nbAccelCrit = safety.nbAccelCrit.toLong(),
        nbDecelCrit = safety.nbDecelCrit.toLong(),
        safetyScore = safety.safetyScore
    )

    private fun toPigeonEcoDrivingContext(ecoDrivingContext: EcoDrivingContext): PigeonEcoDrivingContext = PigeonEcoDrivingContext(
        contextId = ecoDrivingContext.contextId.toLong(),
        distance = ecoDrivingContext.distance,
        duration = ecoDrivingContext.duration,
        efficiencyScore = ecoDrivingContext.efficiencyScore,
        scoreAccel = ecoDrivingContext.scoreAccel,
        scoreMain = ecoDrivingContext.scoreMain,
        scoreDecel = ecoDrivingContext.scoreDecel
    )

    private fun toPigeonFuelEstimationContext(fuelEstimationContext: FuelEstimationDrivingContext): PigeonFuelEstimationContext = PigeonFuelEstimationContext(
        contextId = fuelEstimationContext.contextId.toLong(),
        distance = fuelEstimationContext.distance,
        duration = fuelEstimationContext.duration,
        co2Mass = fuelEstimationContext.co2Mass,
        co2Emission = fuelEstimationContext.co2Emission,
        fuelVolume = fuelEstimationContext.fuelVolume,
        fuelConsumption = fuelEstimationContext.fuelConsumption
    )

    private fun toPigeonSafetyContext(safetyContext: SafetyContext): PigeonSafetyContext = PigeonSafetyContext(
        contextId = safetyContext.contextId.toLong(),
        distance = safetyContext.distance,
        duration = safetyContext.duration,
        nbAdh = safetyContext.nbAdh.toLong(),
        nbAccel = safetyContext.nbAccel.toLong(),
        nbDecel = safetyContext.nbDecel.toLong(),
        nbAdhCrit = safetyContext.nbAdhCrit.toLong(),
        nbAccelCrit = safetyContext.nbAccelCrit.toLong(),
        nbDecelCrit = safetyContext.nbDecelCrit.toLong(),
        safetyScore = safetyContext.safetyScore
    )

    private fun toPigeonPollutants(pollutants: Pollutants): PigeonPollutants = PigeonPollutants(
        co = pollutants.co,
        hc = pollutants.hc,
        nox = pollutants.nox,
        soot = pollutants.soot
    )

    private fun toPigeonTireWear(tireWear: TireWear): PigeonTireWear = PigeonTireWear(
        frontTireAutonomy = tireWear.frontTireAutonomy.toLong(),
        frontTireDistance = tireWear.frontTireDistance.toLong(),
        frontTireTotalWear = tireWear.frontTireTotalWear.toLong(),
        frontTireWear = tireWear.frontTireWear.toLong(),
        frontTireWearRate = tireWear.frontTireWearRate.toLong(),
        rearTireAutonomy = tireWear.rearTireAutonomy.toLong(),
        rearTireDistance = tireWear.rearTireDistance.toLong(),
        rearTireTotalWear = tireWear.rearTireTotalWear.toLong(),
        rearTireWear = tireWear.rearTireWear.toLong(),
        rearTireWearRate = tireWear.rearTireWearRate.toLong()
    )

    private fun toPigeonBrakeWear(brakeWear: BrakeWear): PigeonBrakeWear = PigeonBrakeWear(
        frontBrakeAutonomy = brakeWear.frontBrakeAutonomy.toLong(),
        frontBrakeDistance = brakeWear.frontBrakeDistance.toLong(),
        frontBrakePadWear = brakeWear.frontBrakePadWear.toLong(),
        frontBrakeTotalWear = brakeWear.frontBrakeTotalWear.toLong(),
        frontBrakeWearRate = brakeWear.frontBrakeWearRate.toLong(),
        rearBrakeAutonomy = brakeWear.rearBrakeAutonomy.toLong(),
        rearBrakeDistance = brakeWear.rearBrakeDistance.toLong(),
        rearBrakePadWear = brakeWear.rearBrakePadWear.toLong(),
        rearBrakeTotalWear = brakeWear.rearBrakeTotalWear.toLong(),
        rearBrakeWearRate = brakeWear.rearBrakeWearRate.toLong()
    )

    private fun toPigeonDriverDistraction(driverDistraction: DriverDistraction): PigeonDriverDistraction = PigeonDriverDistraction(
        nbUnlock = driverDistraction.nbUnlock.toLong(),
        durationUnlock = driverDistraction.durationUnlock,
        durationPercentUnlock = driverDistraction.durationPercentUnlock,
        distanceUnlock = driverDistraction.distanceUnlock,
        distancePercentUnlock = driverDistraction.distancePercentUnlock,
        score = driverDistraction.score,
        scoreUnlock = driverDistraction.scoreUnlock,
        scoreCall = driverDistraction.scoreCall
    )

    private fun toPigeonCall(call: Call): PigeonCall = PigeonCall(
        id = call.uniqueId,
        start = call.start,
        end = call.end,
        duration = call.duration.toLong(),
        durationPercent = call.durationPercent.toLong(),
        distance = call.distance.toLong(),
        distancePercent = call.distancePercent.toLong(),
        type = call.type.toString(),
        audioSystem = call.audioSystem.toString(),
        audioInput = call.audioInput,
        audioOutput = call.audioOutput,
        audioName = call.audioName,
        bluetoothClass = call.bluetoothClass.toLong(),
        isForbidden = call.isForbidden
    )

    private fun toPigeonLogbook(logbook: Logbook): PigeonLogbook {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
        val updateDate = logbook.updateDate?.let {
            backendDateFormat.format(it)
        }

        return PigeonLogbook(
            status = logbook.status.toLong(),
            updateDate = updateDate
        )
    }

    private fun toPigeonSafetyEvent(safetyEvent: SafetyEvent): PigeonSafetyEvent = PigeonSafetyEvent(
        time = safetyEvent.time,
        longitude = safetyEvent.longitude,
        latitude = safetyEvent.latitude,
        velocity = safetyEvent.velocity,
        heading = safetyEvent.heading,
        elevation = safetyEvent.elevation,
        distance = safetyEvent.distance,
        type = safetyEvent.type.toLong(),
        level = safetyEvent.level.toLong(),
        value = safetyEvent.value
    )

    private fun toPigeonSpeedingStatistics(speedingStatistics: SpeedingStatistics): PigeonSpeedingStatistics = PigeonSpeedingStatistics(
        distance = speedingStatistics.distance.toLong(),
        duration = speedingStatistics.duration.toLong(),
        speedingDistance = speedingStatistics.speedingDistance.toLong(),
        speedingDuration = speedingStatistics.speedingDuration.toLong(),
        score = speedingStatistics.score
    )

    private fun toPigeonSpeedLimitContext(speedLimitContext: SpeedLimitContext): PigeonSpeedLimitContext = PigeonSpeedLimitContext(
        speedLimit = speedLimitContext.speedLimit.toLong(),
        distance = speedLimitContext.distance.toLong(),
        duration = speedLimitContext.duration.toLong(),
        speedingDistance = speedLimitContext.speedingDistance.toLong(),
        speedingDuration = speedLimitContext.speedingDuration.toLong(),
        score = speedLimitContext.score
    )

    private fun toPigeonEnergyEstimation(energyEstimation: EnergyEstimation): PigeonEnergyEstimation = PigeonEnergyEstimation(
        energy = energyEstimation.energy,
        energyConsumption = energyEstimation.energyConsumption,
        energyOpti = energyEstimation.energyOpti,
        energyOptiConsumption = energyEstimation.energyOptiConsumption
    )

    private fun toPigeonAdvancedEnergyEstimation(advancedEnergyEstimation: AdvancedEnergyEstimation): PigeonAdvancedEnergyEstimation = PigeonAdvancedEnergyEstimation(
        energy = advancedEnergyEstimation.energy,
        energyConsumption = advancedEnergyEstimation.energyConsumption,
        energyOpti = advancedEnergyEstimation.energyOpti,
        energyOptiConsumption = advancedEnergyEstimation.energyOptiConsumption,
        duration = advancedEnergyEstimation.duration,
        distance = advancedEnergyEstimation.distance,
        contextId = advancedEnergyEstimation.contextId.toLong()
    )

    private fun toPigeonTripAdviceData(tripAdvice: TripAdvice): PigeonTripAdviceData = PigeonTripAdviceData(
        id = tripAdvice.id,
        title = tripAdvice.title,
        messageId = tripAdvice.messageId,
        message = tripAdvice.message,
        theme = tripAdvice.theme,
        adviceEvaluation = PigeonTripAdviceEvaluation(
            evaluation = tripAdvice.evaluation.toLong(),
            comment = tripAdvice.comment,
            feedback = tripAdvice.feedback.toLong()
        )
    )

    private fun toPigeonManeuverData(maneuverData: ManeuverData): PigeonManeuverData? {
        if ((maneuverData.nbStraightReverseDrivings == null) ||
            (maneuverData.nbCurveReverseDrivings == null) ||
            (maneuverData.nbTurns == null) ||
            (maneuverData.nbHillStarts == null) ||
            (maneuverData.nbRoundAbouts == null) ||
            (maneuverData.nbEmergencyStops == null) ||
            (maneuverData.nbAngledParkings == null) ||
            (maneuverData.nbParallelParkings == null) ||
            (maneuverData.nbBayParkings == null)
        ) {
            return null
        }
        return PigeonManeuverData(
            nbStraightReverseDrivings = maneuverData.nbStraightReverseDrivings!!.toLong(),
            nbCurveReverseDrivings = maneuverData.nbCurveReverseDrivings!!.toLong(),
            nbTurns = maneuverData.nbTurns!!.toLong(),
            nbHillStarts = maneuverData.nbHillStarts!!.toLong(),
            nbRoundAbouts = maneuverData.nbRoundAbouts!!.toLong(),
            nbEmergencyStops = maneuverData.nbEmergencyStops!!.toLong(),
            nbAngledParkings = maneuverData.nbAngledParkings!!.toLong(),
            nbParallelParkings = maneuverData.nbParallelParkings!!.toLong(),
            nbBayParkings = maneuverData.nbBayParkings!!.toLong()
        )
    }

    private fun toPigeonEvaluationData(evaluationData: EvaluationData): PigeonEvaluationData? {
        evaluationData.evaluation?.let {
            return PigeonEvaluationData(
                comment = evaluationData.comment,
                evaluation = it.toLong()
            )
        }
        return null
    }

    private fun toPigeonDeclaredTransportationMode(declaredTransportationMode: DeclaredTransportationMode): PigeonDeclaredTransportationMode? {
        declaredTransportationMode.transportationMode?.let {
            return PigeonDeclaredTransportationMode(
                transportationMode = it.value.toLong(),
                comment = declaredTransportationMode.comment,
                passenger = declaredTransportationMode.passenger
            )
        }
        return null
    }

    private fun toPigeonTrip(trip: Trip): PigeonTrip {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())

        val tripStatistics: PigeonTripStatistics? = trip.tripStatistics?.let {
            this.toPigeonTripStatistics(it)
        }
        val ecoDriving: PigeonEcoDriving? = trip.ecoDriving?.let {
            this.toPigeonEcoDriving(it)
        }
        val fuelEstimation: PigeonFuelEstimation? = trip.fuelEstimation?.let {
            this.toPigeonFuelEstimation(it)
        }
        val safety: PigeonSafety? = trip.safety?.let {
            this.toPigeonSafety(it)
        }
        val advancedEcoDriving = PigeonAdvancedEcoDriving(
            trip.ecoDrivingContexts.map { toPigeonEcoDrivingContext(it) }
        )
        val advancedFuelEstimation = PigeonAdvancedFuelEstimation(
            trip.fuelEstimationDrivingContexts.map {
                toPigeonFuelEstimationContext(it)
            }
        )
        val advancedSafety = PigeonAdvancedSafety(
            trip.safetyContexts.map {
                toPigeonSafetyContext(it)
            }
        )
        val pollutants: PigeonPollutants? = trip.pollutants?.let {
            this.toPigeonPollutants(it)
        }
        val tireWear: PigeonTireWear? = trip.tireWear?.let {
            this.toPigeonTireWear(it)
        }
        val brakeWear: PigeonBrakeWear? = trip.brakeWear?.let {
            this.toPigeonBrakeWear(it)
        }
        val driverDistraction: PigeonDriverDistraction? = trip.driverDistraction?.let {
            this.toPigeonDriverDistraction(it)
        }
        val logbook: PigeonLogbook? = trip.logbook?.let {
            this.toPigeonLogbook(it)
        }
        val safetyEvents: List<PigeonSafetyEvent?>? = trip.safetyEvents?.let { it ->
            it.map {
                this.toPigeonSafetyEvent(it)
            }
        }
        val speedingStatistics: PigeonSpeedingStatistics? = trip.speedingStatistics?.let {
            this.toPigeonSpeedingStatistics(it)
        }
        val energyEstimation: PigeonEnergyEstimation? = trip.energyEstimation?.let {
            this.toPigeonEnergyEstimation(it)
        }
        val advancedEnergyEstimation: List<PigeonAdvancedEnergyEstimation?>? = trip.advancedEnergyEstimations?.let { estimations ->
            estimations.map {
                this.toPigeonAdvancedEnergyEstimation(it)
            }
        }
        val tripAdvicesData: List<PigeonTripAdviceData> = trip.tripAdvices.map {
            this.toPigeonTripAdviceData(it)
        }
        val maneuverData: PigeonManeuverData? = trip.maneuverData?.let {
            this.toPigeonManeuverData(it)
        }
        val evaluationData: PigeonEvaluationData? = trip.evaluationData?.let {
            this.toPigeonEvaluationData(it)
        }
        val declaredTransportationMode: PigeonDeclaredTransportationMode? = trip.declaredTransportationMode?.let {
            this.toPigeonDeclaredTransportationMode(it)
        }
        return PigeonTrip(
            itinId = trip.itinId,
            startDate = trip.startDate?.let {
                backendDateFormat.format(it)
            },
            endDate = backendDateFormat.format(trip.endDate),
            departureCity = trip.departureCity,
            arrivalCity = trip.arrivalCity,
            departureAddress = trip.departureAddress,
            arrivalAddress = trip.arrivalAddress,
            vehicleId = trip.vehicleId,
            tripStatistics = tripStatistics,
            ecoDriving = ecoDriving,
            fuelEstimation = fuelEstimation,
            safety = safety,
            advancedEcoDriving = advancedEcoDriving,
            advancedFuelEstimation = advancedFuelEstimation,
            advancedSafety = advancedSafety,
            pollutants = pollutants,
            tireWear = tireWear,
            brakeWear = brakeWear,
            driverDistraction = driverDistraction,
            logbook = logbook,
            safetyEvents = safetyEvents,
            speedingStatistics = speedingStatistics,
            energyEstimation = energyEstimation,
            transportationMode = trip.transportationMode.value.toLong(),
            unscored = trip.unscored,
            advancedEnergyEstimation = advancedEnergyEstimation,
            calls = trip.calls?.map {
                this.toPigeonCall(it)
            },
            speedLimitContexts = trip.speedLimitContexts?.map {
                this.toPigeonSpeedLimitContext(it)
            },
            tripAdvicesData = tripAdvicesData,
            maneuverData = maneuverData,
            evaluationData = evaluationData,
            declaredTransportationMode = declaredTransportationMode,
            metadata = trip.metaData as Map<String?, String?>?
        )
    }
    fun toPigeonTripResponseStatus(result: TripResult): PigeonTripResponseStatus {
        when (result) {
            is TripResult.TripError -> return PigeonTripResponseStatus(
                status = PigeonTripResponseStatusType.TRIP_ERROR,
                hasSafetyAndEcoDrivingScore = false,
                error = toPigeonTripResponseError(result.tripResponseError),
                info = emptyList()
            )
            is TripResult.TripValid -> return PigeonTripResponseStatus(
                status = PigeonTripResponseStatusType.TRIP_VALID,
                itinId = result.itinId,
                hasSafetyAndEcoDrivingScore = result.hasSafetyAndEcoDrivingScore,
                error = null,
                info = result.info.map {
                    PigeonTripResponseInfoItem(toPigeonTripResponseInfo(it))
                },
                trip = result.getTrip()?.let { toPigeonTrip(it) }
            )
        }
    }
    private fun toPigeonTripResponseInfo(tripResponseInfo: TripResponseInfo): PigeonTripResponseInfo = when (tripResponseInfo) {
        TripResponseInfo.INVALID_VEHICLE_CHARACTERISTICS -> PigeonTripResponseInfo.INVALID_VEHICLE_CHARACTERISTICS
        TripResponseInfo.ENGINE_SPEED_NOT_AVAILABLE -> PigeonTripResponseInfo.ENGINE_SPEED_NOT_AVAILABLE
        TripResponseInfo.ENGINE_SPEED_IS_NULL -> PigeonTripResponseInfo.ENGINE_SPEED_IS_NULL
        TripResponseInfo.NO_VEHICLE_CHARACTERISTICS -> PigeonTripResponseInfo.NO_VEHICLE_CHARACTERISTICS
        TripResponseInfo.DATA_LOSS -> PigeonTripResponseInfo.DATA_LOSS
        TripResponseInfo.DISTANCE_TOO_SHORT -> PigeonTripResponseInfo.DISTANCE_TOO_SHORT
        TripResponseInfo.INVALID_VEHICLE_ID -> PigeonTripResponseInfo.INVALID_VEHICLE_ID
    }

    private fun toPigeonTripResponseError(tripResponseError: TripResponseError): PigeonTripResponseError = when (tripResponseError) {
        TripResponseError.DATA_ERROR -> PigeonTripResponseError.DATA_ERROR
        TripResponseError.NO_ACCOUNT_SET -> PigeonTripResponseError.NO_ACCOUNT_SET
        TripResponseError.NO_ROUTE_OBJECT_FOUND -> PigeonTripResponseError.NO_ROUTE_OBJECT_FOUND
        TripResponseError.INVALID_ROUTE_DEFINITION -> PigeonTripResponseError.INVALID_ROUTE_DEFINITION
        TripResponseError.NO_VELOCITY_DATA -> PigeonTripResponseError.NO_VELOCITY_DATA
        TripResponseError.INVALID_SAMPLING_PERIOD -> PigeonTripResponseError.INVALID_SAMPLING_PERIOD
        TripResponseError.INVALID_CUSTOMER_ID -> PigeonTripResponseError.INVALID_CUSTOMER_ID
        TripResponseError.NO_DATE_FOUND -> PigeonTripResponseError.NO_DATE_FOUND
        TripResponseError.MAX_DAILY_REQUEST_NUMBER_REACHED -> PigeonTripResponseError.MAX_DAILY_REQUEST_NUMBER_REACHED
        TripResponseError.INVALID_ROUTE_VECTORS -> PigeonTripResponseError.INVALID_ROUTE_VECTORS
        TripResponseError.MISSING_BEACON -> PigeonTripResponseError.MISSING_BEACON
        TripResponseError.INVALID_BEACON -> PigeonTripResponseError.INVALID_BEACON
        TripResponseError.DUPLICATE_TRIP -> PigeonTripResponseError.DUPLICATE_TRIP
        TripResponseError.INSUFFICIENT_GPS_DATA -> PigeonTripResponseError.INSUFFICIENT_GPS_DATA
        TripResponseError.USER_DISABLED -> PigeonTripResponseError.USER_DISABLED
        TripResponseError.INVALID_USER -> PigeonTripResponseError.INVALID_USER
        TripResponseError.INVALID_GPS_DATA -> PigeonTripResponseError.INVALID_GPS_DATA
        TripResponseError.INVALID_TRIP -> PigeonTripResponseError.INVALID_TRIP
        TripResponseError.ACCOUNT_LIMIT_REACHED -> PigeonTripResponseError.ACCOUNT_LIMIT_REACHED
        TripResponseError.UNKNOWN_ERROR -> PigeonTripResponseError.UNKNOWN_ERROR
    }

    fun toPigeonCurrentTripInfo(currentTripInfo: DKTripInfo?): PigeonCurrentTripInfo? {
        return currentTripInfo?.let {
            val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
            return PigeonCurrentTripInfo(
                localTripId = currentTripInfo.localTripId,
                date = backendDateFormat.format(currentTripInfo.date),
                startMode = toPigeonStartMode(currentTripInfo.startMode)
            )
        }
    }

    fun toPigeonLastTripLocation(lastTripLocation: DKTripLocation?): PigeonLastTripLocation? {
        return lastTripLocation?.let {
            val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
            return PigeonLastTripLocation(
                date = backendDateFormat.format(lastTripLocation.date),
                latitude = lastTripLocation.latitude,
                longitude = lastTripLocation.longitude,
                accuracyMeter = lastTripLocation.accuracyMeter,
                accuracyLevel = toPigeonAccuracyLevel(lastTripLocation.getAccuracyLevel())
            )
        }
    }

    private fun toPigeonAccuracyLevel(accuracyLevel: DKCoordinateAccuracy): PigeonAccuracyLevel = when (accuracyLevel) {
        DKCoordinateAccuracy.GOOD -> PigeonAccuracyLevel.GOOD
        DKCoordinateAccuracy.FAIR -> PigeonAccuracyLevel.FAIR
        DKCoordinateAccuracy.POOR -> PigeonAccuracyLevel.POOR
    }

    fun toPigeonTripRecordingStartedState(state: DKTripRecordingStartedState): PigeonTripRecordingStartedState {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
        return PigeonTripRecordingStartedState(
            localTripId = state.localTripId,
            recordingStartDate = backendDateFormat.format(state.recordingStartDate),
            startMode = toPigeonStartMode(state.startMode)
        )
    }

    fun toPigeonTripRecordingConfirmedState(state: DKTripRecordingConfirmedState): PigeonTripRecordingConfirmedState {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
        return PigeonTripRecordingConfirmedState(
            localTripId = state.localTripId,
            recordingStartDate = backendDateFormat.format(state.recordingStartDate),
            startMode = toPigeonStartMode(state.startMode),
            recordingConfirmationDate = backendDateFormat.format(state.recordingConfirmationDate)
        )
    }

    fun toPigeonTripRecordingCanceledState(state: DKTripRecordingCanceledState): PigeonTripRecordingCanceledState {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
        return PigeonTripRecordingCanceledState(
            localTripId = state.localTripId,
            recordingStartDate = backendDateFormat.format(state.recordingStartDate),
            startMode = toPigeonStartMode(state.startMode),
            recordingConfirmationDate = state.recordingConfirmationDate?.let { backendDateFormat.format(it) },
            cancelationReason = toPigeonCancelationReason(state.cancelationReason)
        )
    }

    fun toPigeonTripRecordingFinishedState(state: DKTripRecordingFinishedState): PigeonTripRecordingFinishedState {
        val backendDateFormat: DateFormat = SimpleDateFormat(DATE_PATTERN, Locale.getDefault())
        return PigeonTripRecordingFinishedState(
            localTripId = state.localTripId,
            recordingStartDate = backendDateFormat.format(state.recordingStartDate),
            startMode = toPigeonStartMode(state.startMode),
            recordingConfirmationDate = backendDateFormat.format(state.recordingConfirmationDate),
            recordingEndDate = backendDateFormat.format(state.recordingEndDate)
        )
    }

    private fun toPigeonCancelationReason(reason: DKTripCancelationReason): PigeonTripCancelationReason = when (reason) {
        DKTripCancelationReason.USER -> PigeonTripCancelationReason.USER
        DKTripCancelationReason.HIGH_SPEED -> PigeonTripCancelationReason.HIGH_SPEED
        DKTripCancelationReason.NO_SPEED -> PigeonTripCancelationReason.NO_SPEED
        DKTripCancelationReason.NO_BEACON -> PigeonTripCancelationReason.NO_BEACON
        DKTripCancelationReason.NO_BLUETOOTH_DEVICE -> PigeonTripCancelationReason.NO_BLUETOOTH_DEVICE
        DKTripCancelationReason.MISSING_CONFIGURATION -> PigeonTripCancelationReason.MISSING_CONFIGURATION
        DKTripCancelationReason.NO_LOCATION_DATA -> PigeonTripCancelationReason.NO_LOCATION_DATA
        DKTripCancelationReason.RESET -> PigeonTripCancelationReason.RESET
        DKTripCancelationReason.BEACON_NO_SPEED -> PigeonTripCancelationReason.BEACON_NO_SPEED
        DKTripCancelationReason.BLUETOOTH_DEVICE_NO_SPEED -> PigeonTripCancelationReason.BLUETOOTH_DEVICE_NO_SPEED
        DKTripCancelationReason.APP_KILLED -> PigeonTripCancelationReason.APP_KILLED
    }

    fun toPigeonCreateTripSharingLink(status: CreateTripSharingLinkStatus, data: DKTripSharingLink?): PigeonCreateTripSharingLinkResponse = PigeonCreateTripSharingLinkResponse(
        status = status.toPigeonCreateTripSharingLinkStatus(),
        data = data?.toPigeonTripSharingLink()
    )

    private fun CreateTripSharingLinkStatus.toPigeonCreateTripSharingLinkStatus() = when (this) {
        CreateTripSharingLinkStatus.SUCCESS -> PigeonCreateTripSharingLinkStatus.SUCCESS
        CreateTripSharingLinkStatus.ERROR -> PigeonCreateTripSharingLinkStatus.ERROR
        CreateTripSharingLinkStatus.USER_NOT_CONNECTED -> PigeonCreateTripSharingLinkStatus.USER_NOT_CONNECTED
        CreateTripSharingLinkStatus.INVALID_DURATION -> PigeonCreateTripSharingLinkStatus.INVALID_DURATION
        CreateTripSharingLinkStatus.UNAUTHENTICATED -> PigeonCreateTripSharingLinkStatus.UNAUTHENTICATED
        CreateTripSharingLinkStatus.FORBIDDEN -> PigeonCreateTripSharingLinkStatus.FORBIDDEN
        CreateTripSharingLinkStatus.ACTIVE_LINK_ALREADY_EXISTS -> PigeonCreateTripSharingLinkStatus.ACTIVE_LINK_ALREADY_EXISTS
    }

    fun toPigeonGetTripSharingLink(status: GetTripSharingLinkStatus, data: DKTripSharingLink?): PigeonGetTripSharingLinkResponse = PigeonGetTripSharingLinkResponse(
        status = status.toPigeonGetTripSharingLinkStatus(),
        data = data?.toPigeonTripSharingLink()
    )

    private fun GetTripSharingLinkStatus.toPigeonGetTripSharingLinkStatus() = when (this) {
        GetTripSharingLinkStatus.SUCCESS -> PigeonGetTripSharingLinkStatus.SUCCESS
        GetTripSharingLinkStatus.FAILED_TO_GET_CACHE_ONLY -> PigeonGetTripSharingLinkStatus.FAILED_TO_GET_CACHE_ONLY
        GetTripSharingLinkStatus.USER_NOT_CONNECTED -> PigeonGetTripSharingLinkStatus.USER_NOT_CONNECTED
        GetTripSharingLinkStatus.UNAUTHENTICATED -> PigeonGetTripSharingLinkStatus.UNAUTHENTICATED
        GetTripSharingLinkStatus.FORBIDDEN -> PigeonGetTripSharingLinkStatus.FORBIDDEN
        GetTripSharingLinkStatus.NO_ACTIVE_LINK -> PigeonGetTripSharingLinkStatus.NO_ACTIVE_LINK
    }

    private fun DKTripSharingLink?.toPigeonTripSharingLink(): PigeonTripSharingLink? = if (this == null) {
        null
    } else {
        PigeonTripSharingLink(
            code = this.code,
            url = this.url,
            startDate = this.startDate.toDriveKitBackendFormat(),
            endDate = this.endDate.toDriveKitBackendFormat()
        )
    }

    fun toPigeonRevokeTripSharingLink(status: RevokeTripSharingLinkStatus): PigeonRevokeTripSharingLinkStatus = when (status) {
        RevokeTripSharingLinkStatus.SUCCESS -> PigeonRevokeTripSharingLinkStatus.SUCCESS
        RevokeTripSharingLinkStatus.ERROR -> PigeonRevokeTripSharingLinkStatus.ERROR
        RevokeTripSharingLinkStatus.USER_NOT_CONNECTED -> PigeonRevokeTripSharingLinkStatus.USER_NOT_CONNECTED
        RevokeTripSharingLinkStatus.UNAUTHENTICATED -> PigeonRevokeTripSharingLinkStatus.UNAUTHENTICATED
        RevokeTripSharingLinkStatus.FORBIDDEN -> PigeonRevokeTripSharingLinkStatus.FORBIDDEN
        RevokeTripSharingLinkStatus.NO_ACTIVE_LINK -> PigeonRevokeTripSharingLinkStatus.NO_ACTIVE_LINK
    }
}
