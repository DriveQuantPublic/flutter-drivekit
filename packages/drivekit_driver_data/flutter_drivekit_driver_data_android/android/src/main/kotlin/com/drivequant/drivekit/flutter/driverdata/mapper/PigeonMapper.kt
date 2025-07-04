package com.drivequant.drivekit.flutter.driverdata.mapper

import com.drivequant.drivekit.core.SynchronizationType
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
import com.drivequant.drivekit.databaseutils.entity.Route
import com.drivequant.drivekit.databaseutils.entity.Safety
import com.drivequant.drivekit.databaseutils.entity.SafetyContext
import com.drivequant.drivekit.databaseutils.entity.SafetyEvent
import com.drivequant.drivekit.databaseutils.entity.SpeedLimitContext
import com.drivequant.drivekit.databaseutils.entity.SpeedingStatistics
import com.drivequant.drivekit.databaseutils.entity.TireWear
import com.drivequant.drivekit.databaseutils.entity.TransportationMode
import com.drivequant.drivekit.databaseutils.entity.Trip
import com.drivequant.drivekit.databaseutils.entity.TripAdvice
import com.drivequant.drivekit.databaseutils.entity.TripStatistics
import com.drivequant.drivekit.driverdata.trip.RouteStatus
import com.drivequant.drivekit.driverdata.trip.TripsSyncStatus
import com.drivequant.drivekit.driverdata.trip.UpdateDriverPassengerModeStatus
import com.drivequant.drivekit.driverdata.trip.driverpassengermode.DriverPassengerMode
import com.drivequant.drivekit.flutter.driverdata.PigeonAdvancedEcoDriving
import com.drivequant.drivekit.flutter.driverdata.PigeonAdvancedEnergyEstimation
import com.drivequant.drivekit.flutter.driverdata.PigeonAdvancedFuelEstimation
import com.drivequant.drivekit.flutter.driverdata.PigeonAdvancedSafety
import com.drivequant.drivekit.flutter.driverdata.PigeonBrakeWear
import com.drivequant.drivekit.flutter.driverdata.PigeonCall
import com.drivequant.drivekit.flutter.driverdata.PigeonDeclaredTransportationMode
import com.drivequant.drivekit.flutter.driverdata.PigeonDriverDistraction
import com.drivequant.drivekit.flutter.driverdata.PigeonDriverPassengerMode
import com.drivequant.drivekit.flutter.driverdata.PigeonEcoDriving
import com.drivequant.drivekit.flutter.driverdata.PigeonEcoDrivingContext
import com.drivequant.drivekit.flutter.driverdata.PigeonEnergyEstimation
import com.drivequant.drivekit.flutter.driverdata.PigeonEvaluationData
import com.drivequant.drivekit.flutter.driverdata.PigeonFuelEstimation
import com.drivequant.drivekit.flutter.driverdata.PigeonFuelEstimationContext
import com.drivequant.drivekit.flutter.driverdata.PigeonLogbook
import com.drivequant.drivekit.flutter.driverdata.PigeonManeuverData
import com.drivequant.drivekit.flutter.driverdata.PigeonPollutants
import com.drivequant.drivekit.flutter.driverdata.PigeonRoute
import com.drivequant.drivekit.flutter.driverdata.PigeonRouteSyncStatus
import com.drivequant.drivekit.flutter.driverdata.PigeonSafety
import com.drivequant.drivekit.flutter.driverdata.PigeonSafetyContext
import com.drivequant.drivekit.flutter.driverdata.PigeonSafetyEvent
import com.drivequant.drivekit.flutter.driverdata.PigeonSpeedLimitContext
import com.drivequant.drivekit.flutter.driverdata.PigeonSpeedingStatistics
import com.drivequant.drivekit.flutter.driverdata.PigeonSynchronizationType
import com.drivequant.drivekit.flutter.driverdata.PigeonTireWear
import com.drivequant.drivekit.flutter.driverdata.PigeonTransportationMode
import com.drivequant.drivekit.flutter.driverdata.PigeonTrip
import com.drivequant.drivekit.flutter.driverdata.PigeonTripAdviceData
import com.drivequant.drivekit.flutter.driverdata.PigeonTripAdviceEvaluation
import com.drivequant.drivekit.flutter.driverdata.PigeonTripStatistics
import com.drivequant.drivekit.flutter.driverdata.PigeonTripSyncStatus
import com.drivequant.drivekit.flutter.driverdata.PigeonUpdateDriverPassengerModeStatus
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.*

object PigeonMapper {
    private const val DATE_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    fun toPigeonTrip(trip: Trip): PigeonTrip {
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

    fun toPigeonTripsSyncStatus(tripSyncStatus: TripsSyncStatus): PigeonTripSyncStatus = when (tripSyncStatus) {
        TripsSyncStatus.NO_ERROR -> PigeonTripSyncStatus.SUCCESS
        TripsSyncStatus.CACHE_DATA_ONLY -> PigeonTripSyncStatus.CACHE_DATA_ONLY
        TripsSyncStatus.FAILED_TO_SYNC_TRIPS_CACHE_ONLY -> PigeonTripSyncStatus.FAILED_TO_SYNC_TRIPS_CACHE_ONLY
        TripsSyncStatus.FAILED_TO_SYNC_SAFETY_EVENTS -> PigeonTripSyncStatus.FAILED_TO_SYNC_SAFETY_EVENTS
        TripsSyncStatus.SYNC_ALREADY_IN_PROGRESS -> PigeonTripSyncStatus.SYNC_ALREADY_IN_PROGRESS
    }

    fun fromPigeonSynchronizationType(synchronizationType: PigeonSynchronizationType): SynchronizationType = when (synchronizationType) {
        PigeonSynchronizationType.DEFAULT_SYNC -> SynchronizationType.DEFAULT
        PigeonSynchronizationType.CACHE -> SynchronizationType.CACHE
    }

    fun fromPigeonTransportationMode(transportationMode: PigeonTransportationMode): TransportationMode = when (transportationMode) {
        PigeonTransportationMode.UNKNOWN -> TransportationMode.UNKNOWN
        PigeonTransportationMode.CAR -> TransportationMode.CAR
        PigeonTransportationMode.MOTO -> TransportationMode.MOTO
        PigeonTransportationMode.TRUCK -> TransportationMode.TRUCK
        PigeonTransportationMode.BUS -> TransportationMode.BUS
        PigeonTransportationMode.TRAIN -> TransportationMode.TRAIN
        PigeonTransportationMode.BOAT -> TransportationMode.BOAT
        PigeonTransportationMode.BIKE -> TransportationMode.BIKE
        PigeonTransportationMode.FLIGHT -> TransportationMode.FLIGHT
        PigeonTransportationMode.SKIING -> TransportationMode.SKIING
        PigeonTransportationMode.ON_FOOT -> TransportationMode.ON_FOOT
        PigeonTransportationMode.IDLE -> TransportationMode.IDLE
        PigeonTransportationMode.OTHER -> TransportationMode.OTHER
    }

    fun toPigeonRoute(route: Route): PigeonRoute = PigeonRoute(
        itinId = route.itinId,
        callTime = route.callTime?.map { it.toLong() },
        callIndex = route.callIndex?.map { it.toLong() },
        screenLockedTime = route.screenLockedTime?.map { it.toLong() },
        screenLockedIndex = route.screenLockedIndex?.map { it.toLong() },
        speedingTime = route.speedingTime?.map { it.toLong() },
        speedingIndex = route.speedingIndex?.map { it.toLong() },
        longitude = route.longitude,
        latitude = route.latitude
    )

    fun toRouteStatus(routeStatus: RouteStatus): PigeonRouteSyncStatus = when (routeStatus) {
        RouteStatus.NO_ERROR -> PigeonRouteSyncStatus.SUCCESS
        RouteStatus.FAILED_TO_RETRIEVE_ROUTE -> PigeonRouteSyncStatus.FAILED_TO_RETRIEVE_ROUTE
        RouteStatus.WRONG_ITINID -> PigeonRouteSyncStatus.WRONG_ITIN_ID
    }

    fun fromPigeonDriverPassengerMode(mode: PigeonDriverPassengerMode): DriverPassengerMode = when (mode) {
        PigeonDriverPassengerMode.DRIVER -> DriverPassengerMode.DRIVER
        PigeonDriverPassengerMode.PASSENGER -> DriverPassengerMode.PASSENGER
    }

    fun toPigeonUpdateDriverPassengerModeStatus(status: UpdateDriverPassengerModeStatus): PigeonUpdateDriverPassengerModeStatus = when (status) {
        UpdateDriverPassengerModeStatus.SUCCESS -> PigeonUpdateDriverPassengerModeStatus.SUCCESS
        UpdateDriverPassengerModeStatus.USER_NOT_CONNECTED -> PigeonUpdateDriverPassengerModeStatus.USER_NOT_CONNECTED
        UpdateDriverPassengerModeStatus.INVALID_TRANSPORTATION_MODE -> PigeonUpdateDriverPassengerModeStatus.INVALID_TRANSPORTATION_MODE
        UpdateDriverPassengerModeStatus.INVALID_ITINERARY_ID -> PigeonUpdateDriverPassengerModeStatus.INVALID_TRANSPORTATION_MODE
        UpdateDriverPassengerModeStatus.COMMENT_TOO_LONG -> PigeonUpdateDriverPassengerModeStatus.COMMENT_TOO_LONG
        UpdateDriverPassengerModeStatus.FAILED_TO_UPDATE_MODE -> PigeonUpdateDriverPassengerModeStatus.FAILED_TO_UPDATE_MODE
    }
}
