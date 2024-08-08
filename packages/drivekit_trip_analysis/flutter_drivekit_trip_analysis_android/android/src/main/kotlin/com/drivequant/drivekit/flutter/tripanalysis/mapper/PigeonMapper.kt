// PigeonMapper object with the mapping function
package com.drivequant.drivekit.flutter.tripanalysis.mapper

import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedEcoDriving
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedEnergyEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedFuelEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonAdvancedSafety
import com.drivequant.drivekit.flutter.tripanalysis.PigeonBrakeWear
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCall
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCallEvent
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCancelTrip
import com.drivequant.drivekit.flutter.tripanalysis.PigeonComment
import com.drivequant.drivekit.flutter.tripanalysis.PigeonCrashStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackSeverity
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashFeedbackType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDKCrashInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonDriverDistraction
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEcoDriving
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEcoDrivingContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonEnergyEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonFuelEstimation
import com.drivequant.drivekit.flutter.tripanalysis.PigeonFuelEstimationContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonItineraryData
import com.drivequant.drivekit.flutter.tripanalysis.PigeonItineraryStatistics
import com.drivequant.drivekit.flutter.tripanalysis.PigeonLogbook
import com.drivequant.drivekit.flutter.tripanalysis.PigeonPollutants
import com.drivequant.drivekit.flutter.tripanalysis.PigeonPostGeneric
import com.drivequant.drivekit.flutter.tripanalysis.PigeonPostGenericResponse
import com.drivequant.drivekit.flutter.tripanalysis.PigeonRoute
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafety
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafetyContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSafetyEvent
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSpeedLimitContext
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSpeedingEvent
import com.drivequant.drivekit.flutter.tripanalysis.PigeonSpeedingStatistics
import com.drivequant.drivekit.flutter.tripanalysis.PigeonStartMode
import com.drivequant.drivekit.flutter.tripanalysis.PigeonState
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTireWear
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripPoint
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseError
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseInfo
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseInfoItem
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseStatus
import com.drivequant.drivekit.flutter.tripanalysis.PigeonTripResponseStatusType
import com.drivequant.drivekit.flutter.tripanalysis.PigeonVehicle
import com.drivequant.drivekit.tripanalysis.entity.AdvancedEcoDriving
import com.drivequant.drivekit.tripanalysis.entity.AdvancedEnergyEstimation
import com.drivequant.drivekit.tripanalysis.entity.AdvancedFuelEstimation
import com.drivequant.drivekit.tripanalysis.entity.AdvancedSafety
import com.drivequant.drivekit.tripanalysis.entity.BrakeWear
import com.drivequant.drivekit.tripanalysis.entity.Call
import com.drivequant.drivekit.tripanalysis.entity.CallEvent
import com.drivequant.drivekit.tripanalysis.entity.Comment
import com.drivequant.drivekit.tripanalysis.entity.DriverDistraction
import com.drivequant.drivekit.tripanalysis.entity.EcoDriving
import com.drivequant.drivekit.tripanalysis.entity.EcoDrivingContext
import com.drivequant.drivekit.tripanalysis.entity.EnergyEstimation
import com.drivequant.drivekit.tripanalysis.entity.FuelEstimation
import com.drivequant.drivekit.tripanalysis.entity.FuelEstimationContext
import com.drivequant.drivekit.tripanalysis.entity.ItineraryData
import com.drivequant.drivekit.tripanalysis.entity.ItineraryStatistics
import com.drivequant.drivekit.tripanalysis.entity.Logbook
import com.drivequant.drivekit.tripanalysis.entity.Pollutants
import com.drivequant.drivekit.tripanalysis.entity.PostGeneric
import com.drivequant.drivekit.tripanalysis.entity.PostGenericResponse
import com.drivequant.drivekit.tripanalysis.entity.Route
import com.drivequant.drivekit.tripanalysis.entity.Safety
import com.drivequant.drivekit.tripanalysis.entity.SafetyContext
import com.drivequant.drivekit.tripanalysis.entity.SafetyEvent
import com.drivequant.drivekit.tripanalysis.entity.SpeedLimitContext
import com.drivequant.drivekit.tripanalysis.entity.SpeedingEvents
import com.drivequant.drivekit.tripanalysis.entity.SpeedingStatistics
import com.drivequant.drivekit.tripanalysis.entity.TireWear
import com.drivequant.drivekit.tripanalysis.entity.TripPoint
import com.drivequant.drivekit.tripanalysis.entity.TripResponseError
import com.drivequant.drivekit.tripanalysis.entity.TripResponseInfo
import com.drivequant.drivekit.tripanalysis.entity.TripVehicle
import com.drivequant.drivekit.tripanalysis.model.crashdetection.DKCrashInfo
import com.drivequant.drivekit.tripanalysis.service.crashdetection.CrashStatus
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackSeverity
import com.drivequant.drivekit.tripanalysis.service.crashdetection.feedback.CrashFeedbackType
import com.drivequant.drivekit.tripanalysis.service.recorder.CancelTrip
import com.drivequant.drivekit.tripanalysis.service.recorder.StartMode
import com.drivequant.drivekit.tripanalysis.service.recorder.State
import com.drivequant.drivekit.tripanalysis.utils.TripResponseStatus
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

    fun toPigeonPostGeneric(postGeneric: PostGeneric): PigeonPostGeneric {
        val route: PigeonRoute = postGeneric.route.let {
            this.toPigeonRoute(it)
        }
        val itineraryData: PigeonItineraryData = postGeneric.itineraryData.let {
            this.toPigeonItineraryData(it)
        }
        val vehicle: PigeonVehicle = postGeneric.vehicle.let {
            this.toPigeonTripVehicle(it)
        }
        val metaData: Map<String?, String?>? = postGeneric.metaData?.toMap()

        return PigeonPostGeneric(
            route = route,
            itineraryData = itineraryData,
            vehicle = vehicle,
            metaData = metaData
        )
    }

    private fun toPigeonRoute(route: Route): PigeonRoute = PigeonRoute(
        gpsDate = route.gpsDate,
        gpsVelocity = route.gpsVelocity,
        longitude = route.longitude,
        latitude = route.latitude,
        gpsElevation = route.gpsElevation,
        gpsAccuracy = route.gpsAccuracy,
        gpsHeading = route.gpsHeading,
        screenLocked = route.screenLocked,
        activityValue = route.activityValue,
        roll = route.roll.map { it.toLong() },
        pitch = route.pitch.map { it.toLong() },
        yaw = route.yaw.map { it.toLong() },
        gyroscopeNormVar = route.gyroscopeNormVar.map { it.toLong() }
    )

    private fun toPigeonItineraryData(itineraryData: ItineraryData): PigeonItineraryData {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())

        return PigeonItineraryData(
            startDate = itineraryData.startDate?.let {
                backendDateFormat.format(it)
            },
            endDate = backendDateFormat.format(itineraryData.endDate),
            departureCity = itineraryData.departureCity,
            arrivalCity = itineraryData.arrivalCity,
            departureAddress = itineraryData.departureAddress,
            arrivalAddress = itineraryData.arrivalAddress
        )
    }

    private fun toPigeonTripVehicle(tripVehicle: TripVehicle): PigeonVehicle = PigeonVehicle(
        carTypeIndex = tripVehicle.carTypeIndex.toLong(),
        carEngineIndex = tripVehicle.carEngineIndex.toLong(),
        carPower = tripVehicle.carPower.toLong(),
        carMass = tripVehicle.carMass.toLong(),
        carGearboxIndex = tripVehicle.carGearboxIndex.toLong(),
        carConsumption = tripVehicle.carConsumption,
        carAutoGearboxNumber = tripVehicle.carAutoGearboxNumber.toLong(),
        engineDisplacement = tripVehicle.engineDisplacement.toLong(),
        carPassengers = tripVehicle.carPassengers.toLong(),
        dqIndex = tripVehicle.dqIndex,
        sra = tripVehicle.sra,
        frontTireSize = tripVehicle.frontTireSize,
        rearTireSize = tripVehicle.rearTireSize,
        length = tripVehicle.length ?: -1.0,
        width = tripVehicle.width ?: -1.0,
        height = tripVehicle.height ?: -1.0,
        engineCylinderNb = tripVehicle.engineCylinderNb?.toLong() ?: -1,
        driveWheels = tripVehicle.driveWheels?.toLong() ?: -1
    )

    fun toPigeonPostGenericResponse(postGenericResponse: PostGenericResponse): PigeonPostGenericResponse {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())

        val itineraryStatistics: PigeonItineraryStatistics? = postGenericResponse.itineraryStatistics?.let {
            this.toPigeonItineraryStatistics(it)
        }
        val ecoDriving: PigeonEcoDriving? = postGenericResponse.ecoDriving?.let {
            this.toPigeonEcoDriving(it)
        }
        val fuelEstimation: PigeonFuelEstimation? = postGenericResponse.fuelEstimation?.let {
            this.toPigeonFuelEstimation(it)
        }
        val safety: PigeonSafety? = postGenericResponse.safety?.let {
            this.toPigeonSafety(it)
        }
        val advancedEcoDriving: PigeonAdvancedEcoDriving? = postGenericResponse.advancedEcoDriving?.let {
            this.toPigeonAdvancedEcoDriving(it)
        }
        val advancedFuelEstimation: PigeonAdvancedFuelEstimation? = postGenericResponse.advancedFuelEstimation?.let {
            this.toPigeonAdvancedFuelEstimation(it)
        }
        val advancedSafety: PigeonAdvancedSafety? = postGenericResponse.advancedSafety?.let {
            this.toPigeonAdvancedSafety(it)
        }
        val pollutants: PigeonPollutants? = postGenericResponse.pollutants?.let {
            this.toPigeonPollutants(it)
        }
        val tireWear: PigeonTireWear? = postGenericResponse.tireWear?.let {
            this.toPigeonTireWear(it)
        }
        val brakeWear: PigeonBrakeWear? = postGenericResponse.brakeWear?.let {
            this.toPigeonBrakeWear(it)
        }
        val driverDistraction: PigeonDriverDistraction? = postGenericResponse.driverDistraction?.let {
            this.toPigeonDriverDistraction(it)
        }
        val itineraryData: PigeonItineraryData? = postGenericResponse.itineraryData?.let {
            this.toPigeonItineraryData(it)
        }
        val logbook: PigeonLogbook? = postGenericResponse.logbook?.let {
            this.toPigeonLogbook(it)
        }
        val safetyEvents: List<PigeonSafetyEvent?>? = postGenericResponse.safetyEvents?.let {
            it.map { event ->
                this.toPigeonSafetyEvent(event)
            }
        }
        val callEvents: List<PigeonCallEvent?>? = postGenericResponse.callEvents?.let {
            it.map { event ->
                this.toPigeonCallEvent(event)
            }
        }
        val speedingEvents: List<PigeonSpeedingEvent?>? = postGenericResponse.speedingEvents?.let {
            it.map { event ->
                this.toPigeonSpeedingEvent(event)
            }
        }
        val speedingStatistics: PigeonSpeedingStatistics? = postGenericResponse.speedingStatistics?.let {
            this.toPigeonSpeedingStatistics(it)
        }
        val energyEstimation: PigeonEnergyEstimation? = postGenericResponse.energyEstimation?.let {
            this.toPigeonEnergyEstimation(it)
        }
        val advancedEnergyEstimation: List<PigeonAdvancedEnergyEstimation?>? = postGenericResponse.advancedEnergyEstimation?.let {
            it.map { estimation ->
                this.toPigeonAdvancedEnergyEstimation(estimation)
            }
        }

        return PigeonPostGenericResponse(
            status = postGenericResponse.status,
            itinId = postGenericResponse.itinId,
            comments = postGenericResponse.comments.map { this.toPigeonComment(it) },
            userId = postGenericResponse.userId,
            itineraryStatistics = itineraryStatistics,
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
            itineraryData = itineraryData,
            endDate = postGenericResponse.endDate?.let {
                backendDateFormat.format(it)
            },
            logbook = logbook,
            safetyEvents = safetyEvents,
            callEvents = callEvents,
            speedingEvents = speedingEvents,
            speedingStatistics = speedingStatistics,
            energyEstimation = energyEstimation,
            advancedEnergyEstimation = advancedEnergyEstimation
        )
    }

    private fun toPigeonComment(comment: Comment): PigeonComment = PigeonComment(
        errorCode = comment.errorCode.toLong(),
        comment = comment.comment
    )

    private fun toPigeonItineraryStatistics(itineraryStatistics: ItineraryStatistics): PigeonItineraryStatistics = PigeonItineraryStatistics(
        drivingDuration = itineraryStatistics.drivingDuration,
        idlingDuration = itineraryStatistics.idlingDuration,
        drivingPercentage = itineraryStatistics.drivingPercentage,
        idlingPercentage = itineraryStatistics.idlingPercentage,
        distance = itineraryStatistics.distance,
        speedMean = itineraryStatistics.speedMean,
        subdispNb = itineraryStatistics.subdispNb.toLong(),
        meteo = itineraryStatistics.meteo.toLong(),
        day = itineraryStatistics.day,
        weekDay = itineraryStatistics.weekDay,
        transportationMode = itineraryStatistics.transportationMode.toLong(),
        tripDuration = itineraryStatistics.tripDuration
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

    private fun toPigeonAdvancedEcoDriving(advancedEcoDriving: AdvancedEcoDriving): PigeonAdvancedEcoDriving = PigeonAdvancedEcoDriving(
        ecoDrivingContext = advancedEcoDriving.ecoDrivingContext.map {
            this.toPigeonEcoDrivingContext(it)
        }
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

    private fun toPigeonAdvancedFuelEstimation(advancedFuelEstimation: AdvancedFuelEstimation): PigeonAdvancedFuelEstimation = PigeonAdvancedFuelEstimation(
        fuelEstimationContext = advancedFuelEstimation.fuelEstimationContext.map {
            this.toPigeonFuelEstimationContext(it)
        }
    )

    private fun toPigeonFuelEstimationContext(fuelEstimationContext: FuelEstimationContext): PigeonFuelEstimationContext = PigeonFuelEstimationContext(
        contextId = fuelEstimationContext.contextId.toLong(),
        distance = fuelEstimationContext.distance,
        duration = fuelEstimationContext.duration,
        co2Mass = fuelEstimationContext.co2Mass,
        co2Emission = fuelEstimationContext.co2Emission,
        fuelVolume = fuelEstimationContext.fuelVolume,
        fuelConsumption = fuelEstimationContext.fuelConsumption
    )

    private fun toPigeonAdvancedSafety(advancedSafety: AdvancedSafety): PigeonAdvancedSafety = PigeonAdvancedSafety(
        safetyContext = advancedSafety.safetyContext.map {
            this.toPigeonSafetyContext(it)
        }
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
        durationPercentUnlock = driverDistraction.durationUnlockPercent,
        distanceUnlock = driverDistraction.distanceUnlock,
        distancePercentUnlock = driverDistraction.distancePercentUnlock,
        score = driverDistraction.score,
        scoreUnlock = driverDistraction.scoreUnlock,
        scoreCall = driverDistraction.scoreCall,
        calls = driverDistraction.calls?.map {
            this.toPigeonCall(it)
        }
    )

    private fun toPigeonCall(call: Call): PigeonCall = PigeonCall(
        id = call.id.toLong(),
        start = call.start,
        end = call.end,
        durationS = call.durationS.toLong(),
        duration = call.duration.toLong(),
        distanceM = call.distanceM.toLong(),
        distance = call.distance.toLong(),
        status = call.status,
        audioSystem = call.audioSystem,
        audioInput = call.audioInput,
        audioOutput = call.audioOutput,
        audioName = call.audioName,
        bluetoothClass = call.bluetoothClass.toLong(),
        forbidden = call.forbidden
    )

    private fun toPigeonLogbook(logbook: Logbook): PigeonLogbook {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())
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

    private fun toPigeonCallEvent(callEvent: CallEvent): PigeonCallEvent = PigeonCallEvent(
        time = callEvent.time,
        latitude = callEvent.latitude,
        longitude = callEvent.longitude,
        velocity = callEvent.velocity,
        heading = callEvent.heading,
        elevation = callEvent.elevation,
        distance = callEvent.distance,
        type = callEvent.type.toLong(),
        duration = callEvent.duration.toLong(),
        audioSystem = callEvent.audioSystem,
        callType = callEvent.callType,
        index = callEvent.index.toLong(),
        forbidden = callEvent.forbidden
    )

    private fun toPigeonSpeedingEvent(speedingEvents: SpeedingEvents): PigeonSpeedingEvent = PigeonSpeedingEvent(
        time = speedingEvents.time,
        latitude = speedingEvents.latitude,
        longitude = speedingEvents.longitude,
        type = speedingEvents.type,
        index = speedingEvents.index.toLong()
    )

    private fun toPigeonSpeedingStatistics(speedingStatistics: SpeedingStatistics): PigeonSpeedingStatistics = PigeonSpeedingStatistics(
        distance = speedingStatistics.distance.toLong(),
        duration = speedingStatistics.duration.toLong(),
        speedingDistance = speedingStatistics.speedingDistance.toLong(),
        speedingDuration = speedingStatistics.speedingDuration.toLong(),
        score = speedingStatistics.score,
        speedLimitContexts = speedingStatistics.speedLimitContexts.map {
            this.toPigeonSpeedLimitContext(it)
        }
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

    fun toPigeonTripResponseStatus(tripResponseStatus: TripResponseStatus): PigeonTripResponseStatus {
        when (tripResponseStatus) {
            is TripResponseStatus.TripError -> return PigeonTripResponseStatus(
                status = PigeonTripResponseStatusType.TRIP_ERROR,
                hasSafetyAndEcoDrivingScore = false,
                error = toPigeonTripResponseError(tripResponseStatus.tripResponseError),
                info = emptyList()
            )
            is TripResponseStatus.TripValid -> return PigeonTripResponseStatus(
                status = PigeonTripResponseStatusType.TRIP_VALID,
                hasSafetyAndEcoDrivingScore = tripResponseStatus.hasSafetyAndEcoDrivingScore,
                error = null,
                info = tripResponseStatus.info.map {
                    PigeonTripResponseInfoItem(toPigeonTripResponseInfo(it))
                }
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

    private fun toPigeonTripResponseError(tripResponseEror: TripResponseError): PigeonTripResponseError = when (tripResponseEror) {
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

    private fun fromPigeonItineraryData(pigeonItineraryData: PigeonItineraryData): ItineraryData {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())

        val itineraryData = ItineraryData(
            endDate = backendDateFormat.parse(pigeonItineraryData.endDate)
        )
        itineraryData.startDate = pigeonItineraryData.startDate?.let {
            backendDateFormat.parse(it)
        }
        itineraryData.departureCity = pigeonItineraryData.departureCity
        itineraryData.arrivalCity = pigeonItineraryData.arrivalCity
        itineraryData.departureAddress = pigeonItineraryData.departureAddress
        itineraryData.arrivalAddress = pigeonItineraryData.arrivalAddress
        return itineraryData
    }

    fun fromPigeonPostGenericResponse(postGenericResponse: PigeonPostGenericResponse): PostGenericResponse {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())

        val itineraryStatistics: ItineraryStatistics? = postGenericResponse.itineraryStatistics?.let {
            this.fromPigeonItineraryStatistics(it)
        }
        val ecoDriving: EcoDriving? = postGenericResponse.ecoDriving?.let {
            this.fromPigeonEcoDriving(it)
        }
        val fuelEstimation: FuelEstimation? = postGenericResponse.fuelEstimation?.let {
            this.fromPigeonFuelEstimation(it)
        }
        val safety: Safety? = postGenericResponse.safety?.let {
            this.fromPigeonSafety(it)
        }
        val advancedEcoDriving: AdvancedEcoDriving? = postGenericResponse.advancedEcoDriving?.let {
            this.fromPigeonAdvancedEcoDriving(it)
        }
        val advancedFuelEstimation: AdvancedFuelEstimation? = postGenericResponse.advancedFuelEstimation?.let {
            this.fromPigeonAdvancedFuelEstimation(it)
        }
        val advancedSafety: AdvancedSafety? = postGenericResponse.advancedSafety?.let {
            this.fromPigeonAdvancedSafety(it)
        }
        val pollutants: Pollutants? = postGenericResponse.pollutants?.let {
            this.fromPigeonPollutants(it)
        }
        val tireWear: TireWear? = postGenericResponse.tireWear?.let {
            this.fromPigeonTireWear(it)
        }
        val brakeWear: BrakeWear? = postGenericResponse.brakeWear?.let {
            this.fromPigeonBrakeWear(it)
        }
        val driverDistraction: DriverDistraction? = postGenericResponse.driverDistraction?.let {
            this.fromPigeonDriverDistraction(it)
        }
        val itineraryData: ItineraryData? = postGenericResponse.itineraryData?.let {
            this.fromPigeonItineraryData(it)
        }
        val logbook: Logbook? = postGenericResponse.logbook?.let {
            this.fromPigeonLogbook(it)
        }
        val safetyEvents: List<SafetyEvent>? = postGenericResponse.safetyEvents?.mapNotNull {
            it?.let {
                this.fromPigeonSafetyEvent(it)
            }
        }
        val callEvents: List<CallEvent>? = postGenericResponse.callEvents?.mapNotNull {
            it?.let { event ->
                this.fromPigeonCallEvent(event)
            }
        }
        val speedingEvents: List<SpeedingEvents>? = postGenericResponse.speedingEvents?.mapNotNull {
            it?.let { event ->
                this.fromPigeonSpeedingEvent(event)
            }
        }
        val speedingStatistics: SpeedingStatistics? = postGenericResponse.speedingStatistics?.let {
            this.fromPigeonSpeedingStatistics(it)
        }
        val energyEstimation: EnergyEstimation? = postGenericResponse.energyEstimation?.let {
            this.fromPigeonEnergyEstimation(it)
        }
        val advancedEnergyEstimation: List<AdvancedEnergyEstimation>? = postGenericResponse.advancedEnergyEstimation?.mapNotNull {
            it?.let { estimation ->
                this.fromPigeonAdvancedEnergyEstimation(estimation)
            }
        }

        return PostGenericResponse(
            status = postGenericResponse.status,
            itinId = postGenericResponse.itinId ?: "",
            comments = postGenericResponse.comments.mapNotNull
                {
                    it?.let {
                        this.fromPigeonComment(it)
                    }
                },
            userId = postGenericResponse.userId,
            itineraryStatistics = itineraryStatistics,
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
            itineraryData = itineraryData,
            endDate = postGenericResponse.endDate?.let {
                backendDateFormat.parse(it)
            },
            logbook = logbook,
            safetyEvents = safetyEvents,
            callEvents = callEvents,
            speedingEvents = speedingEvents,
            speedingStatistics = speedingStatistics,
            energyEstimation = energyEstimation,
            advancedEnergyEstimation = advancedEnergyEstimation,
            account = null,
            tripAdvicesData = null
        )
    }

    private fun fromPigeonComment(comment: PigeonComment): Comment = Comment(
        errorCode = comment.errorCode.toInt(),
        comment = comment.comment
    )

    private fun fromPigeonItineraryStatistics(itineraryStatistics: PigeonItineraryStatistics): ItineraryStatistics = ItineraryStatistics(
        drivingDuration = itineraryStatistics.drivingDuration,
        idlingDuration = itineraryStatistics.idlingDuration,
        drivingPercentage = itineraryStatistics.drivingPercentage,
        idlingPercentage = itineraryStatistics.idlingPercentage,
        distance = itineraryStatistics.distance,
        speedMean = itineraryStatistics.speedMean,
        subdispNb = itineraryStatistics.subdispNb.toInt(),
        meteo = itineraryStatistics.meteo.toInt(),
        day = itineraryStatistics.day,
        weekDay = itineraryStatistics.weekDay,
        transportationMode = itineraryStatistics.transportationMode.toInt(),
        tripDuration = itineraryStatistics.tripDuration
    )

    private fun fromPigeonEcoDriving(ecoDriving: PigeonEcoDriving): EcoDriving = EcoDriving(
        score = ecoDriving.score,
        scoreAccel = ecoDriving.scoreAccel,
        scoreMain = ecoDriving.scoreMain,
        scoreDecel = ecoDriving.scoreDecel,
        stdDevAccel = ecoDriving.stdDevAccel,
        stdDevMain = ecoDriving.stdDevMain,
        stdDevDecel = ecoDriving.stdDevDecel,
        energyClass = ecoDriving.energyClass.toInt()
    )

    private fun fromPigeonFuelEstimation(fuelEstimation: PigeonFuelEstimation): FuelEstimation = FuelEstimation(
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

    private fun fromPigeonSafety(safety: PigeonSafety): Safety = Safety(
        nbAdh = safety.nbAdh.toInt(),
        nbAccel = safety.nbAccel.toInt(),
        nbDecel = safety.nbDecel.toInt(),
        nbAdhCrit = safety.nbAdhCrit.toInt(),
        nbAccelCrit = safety.nbAccelCrit.toInt(),
        nbDecelCrit = safety.nbDecelCrit.toInt(),
        safetyScore = safety.safetyScore
    )

    private fun fromPigeonAdvancedEcoDriving(advancedEcoDriving: PigeonAdvancedEcoDriving): AdvancedEcoDriving = AdvancedEcoDriving(
        ecoDrivingContext = advancedEcoDriving.ecoDrivingContext.mapNotNull {
            it?.let {
                this.fromPigeonEcoDrivingContext(it)
            }
        }
    )

    private fun fromPigeonEcoDrivingContext(ecoDrivingContext: PigeonEcoDrivingContext): EcoDrivingContext = EcoDrivingContext(
        contextId = ecoDrivingContext.contextId.toInt(),
        distance = ecoDrivingContext.distance,
        duration = ecoDrivingContext.duration,
        efficiencyScore = ecoDrivingContext.efficiencyScore,
        scoreAccel = ecoDrivingContext.scoreAccel,
        scoreMain = ecoDrivingContext.scoreMain,
        scoreDecel = ecoDrivingContext.scoreDecel
    )

    private fun fromPigeonAdvancedFuelEstimation(advancedFuelEstimation: PigeonAdvancedFuelEstimation): AdvancedFuelEstimation = AdvancedFuelEstimation(
        fuelEstimationContext = advancedFuelEstimation.fuelEstimationContext.mapNotNull {
            it?.let {
                this.fromPigeonFuelEstimationContext(it)
            }
        }
    )

    private fun fromPigeonFuelEstimationContext(fuelEstimationContext: PigeonFuelEstimationContext): FuelEstimationContext = FuelEstimationContext(
        contextId = fuelEstimationContext.contextId.toInt(),
        distance = fuelEstimationContext.distance,
        duration = fuelEstimationContext.duration,
        co2Mass = fuelEstimationContext.co2Mass,
        co2Emission = fuelEstimationContext.co2Emission,
        fuelVolume = fuelEstimationContext.fuelVolume,
        fuelConsumption = fuelEstimationContext.fuelConsumption
    )

    private fun fromPigeonAdvancedSafety(advancedSafety: PigeonAdvancedSafety): AdvancedSafety = AdvancedSafety(
        safetyContext = advancedSafety.safetyContext.mapNotNull {
            it?.let {
                this.fromPigeonSafetyContext(it)
            }
        }
    )

    private fun fromPigeonSafetyContext(safetyContext: PigeonSafetyContext): SafetyContext = SafetyContext(
        contextId = safetyContext.contextId.toInt(),
        distance = safetyContext.distance,
        duration = safetyContext.duration,
        nbAdh = safetyContext.nbAdh.toInt(),
        nbAccel = safetyContext.nbAccel.toInt(),
        nbDecel = safetyContext.nbDecel.toInt(),
        nbAdhCrit = safetyContext.nbAdhCrit.toInt(),
        nbAccelCrit = safetyContext.nbAccelCrit.toInt(),
        nbDecelCrit = safetyContext.nbDecelCrit.toInt(),
        safetyScore = safetyContext.safetyScore
    )

    private fun fromPigeonPollutants(pollutants: PigeonPollutants): Pollutants = Pollutants(
        co = pollutants.co,
        hc = pollutants.hc,
        nox = pollutants.nox,
        soot = pollutants.soot
    )

    private fun fromPigeonTireWear(tireWear: PigeonTireWear): TireWear = TireWear(
        frontTireAutonomy = tireWear.frontTireAutonomy.toInt(),
        frontTireDistance = tireWear.frontTireDistance.toInt(),
        frontTireTotalWear = tireWear.frontTireTotalWear.toDouble(),
        frontTireWear = tireWear.frontTireWear.toInt(),
        frontTireWearRate = tireWear.frontTireWearRate.toDouble(),
        rearTireAutonomy = tireWear.rearTireAutonomy.toInt(),
        rearTireDistance = tireWear.rearTireDistance.toInt(),
        rearTireTotalWear = tireWear.rearTireTotalWear.toDouble(),
        rearTireWear = tireWear.rearTireWear.toInt(),
        rearTireWearRate = tireWear.rearTireWearRate.toDouble()
    )

    private fun fromPigeonBrakeWear(brakeWear: PigeonBrakeWear): BrakeWear = BrakeWear(
        frontBrakeAutonomy = brakeWear.frontBrakeAutonomy.toInt(),
        frontBrakeDistance = brakeWear.frontBrakeDistance.toInt(),
        frontBrakePadWear = brakeWear.frontBrakePadWear.toInt(),
        frontBrakeTotalWear = brakeWear.frontBrakeTotalWear.toDouble(),
        frontBrakeWearRate = brakeWear.frontBrakeWearRate.toDouble(),
        rearBrakeAutonomy = brakeWear.rearBrakeAutonomy.toInt(),
        rearBrakeDistance = brakeWear.rearBrakeDistance.toInt(),
        rearBrakePadWear = brakeWear.rearBrakePadWear.toInt(),
        rearBrakeTotalWear = brakeWear.rearBrakeTotalWear.toDouble(),
        rearBrakeWearRate = brakeWear.rearBrakeWearRate.toDouble()
    )

    private fun fromPigeonDriverDistraction(driverDistraction: PigeonDriverDistraction): DriverDistraction = DriverDistraction(
        nbUnlock = driverDistraction.nbUnlock.toInt(),
        durationUnlock = driverDistraction.durationUnlock,
        durationUnlockPercent = driverDistraction.durationPercentUnlock,
        distanceUnlock = driverDistraction.distanceUnlock,
        distancePercentUnlock = driverDistraction.distancePercentUnlock,
        score = driverDistraction.score,
        scoreUnlock = driverDistraction.scoreUnlock,
        scoreCall = driverDistraction.scoreCall,
        calls = driverDistraction.calls?.mapNotNull {
            it?.let {
                this.fromPigeonCall(it)
            }
        }
    )

    private fun fromPigeonCall(call: PigeonCall): Call = Call(
        id = call.id.toInt(),
        start = call.start,
        end = call.end,
        durationS = call.durationS.toInt(),
        duration = call.duration.toInt(),
        distanceM = call.distanceM.toInt(),
        distance = call.distance.toInt(),
        status = call.status,
        audioSystem = call.audioSystem,
        audioInput = call.audioInput,
        audioOutput = call.audioOutput,
        audioName = call.audioName,
        bluetoothClass = call.bluetoothClass.toInt(),
        forbidden = call.forbidden
    )

    private fun fromPigeonLogbook(logbook: PigeonLogbook): Logbook {
        val backendDateFormat: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ", Locale.getDefault())
        val updateDate = logbook.updateDate?.let {
            backendDateFormat.parse(it)
        }

        return Logbook(
            status = logbook.status.toInt(),
            updateDate = updateDate
        )
    }

    private fun fromPigeonSafetyEvent(safetyEvent: PigeonSafetyEvent): SafetyEvent = SafetyEvent(
        time = safetyEvent.time,
        longitude = safetyEvent.longitude,
        latitude = safetyEvent.latitude,
        velocity = safetyEvent.velocity,
        heading = safetyEvent.heading,
        elevation = safetyEvent.elevation,
        distance = safetyEvent.distance,
        type = safetyEvent.type.toInt(),
        level = safetyEvent.level.toInt(),
        value = safetyEvent.value
    )

    private fun fromPigeonCallEvent(callEvent: PigeonCallEvent): CallEvent = CallEvent(
        time = callEvent.time,
        latitude = callEvent.latitude,
        longitude = callEvent.longitude,
        velocity = callEvent.velocity,
        heading = callEvent.heading,
        elevation = callEvent.elevation,
        distance = callEvent.distance,
        type = callEvent.type.toInt(),
        duration = callEvent.duration.toDouble(),
        audioSystem = callEvent.audioSystem,
        callType = callEvent.callType,
        index = callEvent.index.toInt(),
        forbidden = callEvent.forbidden
    )

    private fun fromPigeonSpeedingEvent(speedingEvents: PigeonSpeedingEvent): SpeedingEvents = SpeedingEvents(
        time = speedingEvents.time,
        latitude = speedingEvents.latitude,
        longitude = speedingEvents.longitude,
        type = speedingEvents.type,
        index = speedingEvents.index.toInt()
    )

    private fun fromPigeonSpeedingStatistics(speedingStatistics: PigeonSpeedingStatistics): SpeedingStatistics = SpeedingStatistics(
        distance = speedingStatistics.distance.toInt(),
        duration = speedingStatistics.duration.toInt(),
        speedingDistance = speedingStatistics.speedingDistance.toInt(),
        speedingDuration = speedingStatistics.speedingDuration.toInt(),
        score = speedingStatistics.score,
        speedLimitContexts = speedingStatistics.speedLimitContexts.mapNotNull {
            it?.let {
                this.fromPigeonSpeedLimitContext(it)
            }
        }
    )

    private fun fromPigeonSpeedLimitContext(speedLimitContext: PigeonSpeedLimitContext): SpeedLimitContext = SpeedLimitContext(
        speedLimit = speedLimitContext.speedLimit.toInt(),
        distance = speedLimitContext.distance.toInt(),
        duration = speedLimitContext.duration.toInt(),
        speedingDistance = speedLimitContext.speedingDistance.toInt(),
        speedingDuration = speedLimitContext.speedingDuration.toInt(),
        score = speedLimitContext.score
    )

    private fun fromPigeonEnergyEstimation(energyEstimation: PigeonEnergyEstimation): EnergyEstimation = EnergyEstimation(
        energy = energyEstimation.energy,
        energyConsumption = energyEstimation.energyConsumption,
        energyOpti = energyEstimation.energyOpti,
        energyOptiConsumption = energyEstimation.energyOptiConsumption
    )

    private fun fromPigeonAdvancedEnergyEstimation(advancedEnergyEstimation: PigeonAdvancedEnergyEstimation): AdvancedEnergyEstimation = AdvancedEnergyEstimation(
        energy = advancedEnergyEstimation.energy,
        energyConsumption = advancedEnergyEstimation.energyConsumption,
        energyOpti = advancedEnergyEstimation.energyOpti,
        energyOptiConsumption = advancedEnergyEstimation.energyOptiConsumption,
        duration = advancedEnergyEstimation.duration,
        distance = advancedEnergyEstimation.distance,
        contextId = advancedEnergyEstimation.contextId.toInt()
    )
}
