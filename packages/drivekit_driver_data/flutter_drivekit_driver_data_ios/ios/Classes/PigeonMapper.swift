import DriveKitDriverDataModule
import DriveKitDBTripAccessModule
import DriveKitCoreModule

extension PigeonGetTripsResponse {
    init(from status: TripSyncStatus, trips: [DKTrip]) {
        self.init(status: PigeonTripSyncStatus(from: status), trips: trips.map { PigeonTrip(from: $0)})
    }
}

extension PigeonGetTripResponse {
    init(from status: TripSyncStatus, trip: DKTrip?) {
        var pigeonTrip: PigeonTrip?
        if let trip {
            pigeonTrip = PigeonTrip(from: trip)
        }
        self.init(status: PigeonTripSyncStatus(from: status), trip: pigeonTrip)
    }
}

extension PigeonTripSyncStatus {
    init(from status: TripSyncStatus) {
        switch status {
            case .noError:
                self = PigeonTripSyncStatus.success
            case .cacheDataOnly:
                self = PigeonTripSyncStatus.cacheDataOnly
            case .failedToSyncTripsCacheOnly:
                self = PigeonTripSyncStatus.failedToSyncTripsCacheOnly
            case .syncAlreadyInProgress:
                self = PigeonTripSyncStatus.syncAlreadyInProgress
            case .failedToSyncSafetyEvents:
                self = PigeonTripSyncStatus.failedToSyncSafetyEvents
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonTrip {
    init (from trip: DKTrip) {
        self.itinId = trip.itinId
        if let startDate = trip.startDate {
            self.startDate = DateUtils.convertDateToString(date: startDate)
        }
        if let endDate = trip.endDate {
            self.endDate = DateUtils.convertDateToString(date: endDate)
        }
        self.departureAddress = trip.departureAddress,
        self.departureCity = trip.departureCity,
        self.departurePostalCode = trip.departurePostalCode,
        self.departureState = trip.departureState,
        self.departureCountry = trip.departureCountry,
        self.arrivalAddress = trip.arrivalAddress,
        self.arrivalCity = trip.arrivalCity,
        self.arrivalPostalCode = trip.arrivalPostalCode,
        self.arrivalState = trip.arrivalState,
        self.arrivalCountry = trip.arrivalCountry,
        self.vehicleId = trip.vehicleId
        if let tripStatistics = trip.tripStatistics {
            self.tripStatistics = PigeonTripStatistics(from: tripStatistics)
        }
        if let ecoDriving = trip.ecoDriving {
            self.ecoDriving = PigeonEcoDriving(from: ecoDriving)
        }
        if let fuelEstimation = trip.fuelEstimation {
            self.fuelEstimation = PigeonFuelEstimation(from: fuelEstimation)
        }
        if let safety = trip.safety {
            self.safety = PigeonSafety(from: safety)
        }
        if let advancedEcoDrivingContexts = trip.ecoDrivingContexts {
            self.advancedEcoDriving = PigeonAdvancedEcoDriving(from: advancedEcoDrivingContexts)
        }
        if let advancedFuelEstimationContexts = trip.fuelEstimationContexts {
            self.advancedFuelEstimation = PigeonAdvancedFuelEstimation(from: advancedFuelEstimationContexts)
        }
        if let advancedSafetyContexts = trip.safetyContexts {
            self.advancedSafety = PigeonAdvancedSafety(from: advancedSafetyContexts)
        }
        if let pollutants = trip.pollutants {
            self.pollutants = PigeonPollutants(from: pollutants)
        }
        if let tireWear = trip.tireWear {
            self.tireWear = PigeonTireWear(from: tireWear)
        }
        if let brakeWear = trip.brakeWear {
            self.brakeWear = PigeonBrakeWear(from: brakeWear)
        }
        if let driverDistraction = trip.driverDistraction {
            self.driverDistraction = PigeonDriverDistraction(from: driverDistraction)
        }
        if let logbook = trip.logbook {
            self.logbook = PigeonLogbook(from: logbook)
        }
        if let occupantInfo = trip.occupantInfo {
            self.occupantInfo = PigeonOccupantInfo(from: occupantInfo)
        }
        if let safetyEvents = trip.safetyEvents {
            self.safetyEvents = safetyEvents.map({
                PigeonSafetyEvent(from: $0)
            })
        }
        if let speedingStatistics = trip.speedingStatistics {
            self.speedingStatistics = PigeonSpeedingStatistics(from: speedingStatistics)
        }
        if let energyEstimation = trip.energyEstimation {
            self.energyEstimation = PigeonEnergyEstimation(from: energyEstimation)
        }
        if let advancedEnergyEstimation = trip.advancedEnergyEstimation {
            self.advancedEnergyEstimation = advancedEnergyEstimation.map({
                PigeonAdvancedEnergyEstimation(from: $0)
            })
        }
        if let tripAdvicesData = trip.tripAdvices {
            self.tripAdvicesData = tripAdvicesData.map { PigeonTripAdviceData(from: $0) }
        }
        if let maneuverData = trip.maneuver {
            self.maneuverData = PigeonManeuverData(from: maneuverData)
        }
        if let evaluationData = trip.evaluation {
            self.evaluationData = PigeonEvaluationData(from: evaluationData)
        }
        if let declaredTransportationMode = trip.declaredTransportationMode {
            self.declaredTransportationMode = PigeonDeclaredTransportationMode(from: declaredTransportationMode)
        }
        self.metadata = trip.metadata
        self.transportationMode = Int64(trip.transportationMode.rawValue)
        self.unscored = trip.unscored
        if let calls = trip.calls {
            self.calls = calls.compactMap { PigeonCall(from: $0) }
        }
        if let speedLimitContexts = trip.speedLimitContexts {
            self.speedLimitContexts = speedLimitContexts.map { PigeonSpeedLimitContext(from: $0) }
        }
    }
}

extension PigeonTripStatistics {
    init (from tripStatistics: DKTripStatistics) {
        self.tripDuration = Double(tripStatistics.duration)
        self.drivingDuration = tripStatistics.drivingDuration
        self.idlingDuration = tripStatistics.idlingDuration
        self.drivingPercentage = tripStatistics.drivingPercentage
        self.idlingPercentage = tripStatistics.idlingPercentage
        self.distance = tripStatistics.distance
        self.speedMean = tripStatistics.speedMean
        self.subdispNb = Int64(tripStatistics.subdispNb)
        self.meteo = Int64(tripStatistics.weather.rawValue)
        self.day = tripStatistics.day
        self.weekDay = tripStatistics.weekDay
    }
}

extension PigeonEcoDriving {
    init (from ecoDriving: DKEcoDriving) {
        self.init(
            score: ecoDriving.score,
            scoreAccel: ecoDriving.scoreAccel,
            scoreMain: ecoDriving.scoreMain,
            scoreDecel: ecoDriving.scoreDecel,
            stdDevAccel: ecoDriving.stdDevAccel,
            stdDevMain: ecoDriving.stdDevMain,
            stdDevDecel: ecoDriving.stdDevDecel,
            energyClass: Int64(ecoDriving.energyClass)
        )
    }
}

extension PigeonFuelEstimation {
    init (from fuelEstimation: DKFuelEstimation) {
        self.init(
            co2Mass: fuelEstimation.co2Mass,
            co2Emission: fuelEstimation.co2Emission,
            fuelVolume: fuelEstimation.fuelVolume,
            fuelConsumption: fuelEstimation.fuelConsumption,
            idleFuelVolume: fuelEstimation.idleFuelVolume,
            idleFuelPercentage: fuelEstimation.idleFuelPercentage,
            idleFuelConsumption: fuelEstimation.idleFuelConsumption,
            idleCo2Emission: fuelEstimation.idleCo2Emission,
            idleCo2Mass: fuelEstimation.idleCo2Mass,
            engineTempStatus: fuelEstimation.engineTempStatus,
            coldFuelVolume: fuelEstimation.coldFuelVolume
        )
    }
}

extension PigeonSafety {
    init(from safety: DKSafety) {
        self.init(
            nbAdh: Int64(safety.nbAdh),
            nbAccel: Int64(safety.nbAccel),
            nbDecel: Int64(safety.nbDecel),
            nbAdhCrit: Int64(safety.nbAdhCrit),
            nbAccelCrit: Int64(safety.nbAccelCrit),
            nbDecelCrit: Int64(safety.nbDecelCrit),
            safetyScore: safety.safetyScore
        )
    }
}

extension PigeonAdvancedEcoDriving {
    init(from ecoDrivingContexts: [DKEcoDrivingContext]) {
        var contextArray: [PigeonEcoDrivingContext?] = []
            for context in ecoDrivingContexts {
                contextArray.append(
                    PigeonEcoDrivingContext(
                        contextId: Int64(context.contextId),
                        distance: context.distance,
                        duration: context.duration,
                        efficiencyScore: context.efficiencyScore,
                        scoreAccel: context.scoreAccel,
                        scoreMain: context.scoreMain,
                        scoreDecel: context.scoreDecel
                    ))
        }
        self.init(ecoDrivingContext: contextArray)
    }
}

extension PigeonAdvancedFuelEstimation {
    init(from fuelEstimationContexts: [DKFuelEstimationContext]) {
        var contextArray: [PigeonFuelEstimationContext?] = []
        for context in fuelEstimationContexts {
            contextArray.append(
                PigeonFuelEstimationContext(
                    contextId: Int64(context.contextId),
                    distance: context.distance,
                    duration: context.duration,
                    co2Mass: context.co2Mass,
                    co2Emission: context.co2Emission,
                    fuelVolume: context.fuelVolume,
                    fuelConsumption: context.fuelConsumption
                )
            )
        }
        self.init(fuelEstimationContext: contextArray)
    }
}

extension PigeonAdvancedSafety {
    init(from safetyContexts: [DKSafetyContext]) {
        var contextArray: [PigeonSafetyContext?] = []
            for context in safetyContexts {
                contextArray.append(
                    PigeonSafetyContext(
                        contextId: Int64(context.contextId),
                        distance: context.distance,
                        duration: context.duration,
                        nbAdh: Int64(context.nbAdh),
                        nbAccel: Int64(context.nbAccel),
                        nbDecel: Int64(context.nbDecel),
                        nbAdhCrit: Int64(context.nbAdhCrit),
                        nbAccelCrit: Int64(context.nbAccelCrit),
                        nbDecelCrit: Int64(context.nbDecelCrit),
                        safetyScore: context.safetyScore
                    )
                )
            }
        self.init(safetyContext: contextArray)
    }
}

extension PigeonPollutants {
    init(from polluants: DKPollutants) {
        self.init(
            co: polluants.co,
            hc: polluants.hc,
            nox: polluants.nox,
            soot: polluants.soot
        )
    }
}

extension PigeonTireWear {
    init(from tireWear: DKTireWear) {
        self.init(
            frontTireAutonomy: Int64(tireWear.frontTireAutonomy),
            frontTireDistance: Int64(tireWear.frontTireDistance),
            frontTireTotalWear: Int64(tireWear.frontTireTotalWear),
            frontTireWear: Int64(tireWear.frontTireWear),
            frontTireWearRate: Int64(tireWear.frontTireWearRate),
            rearTireAutonomy: Int64(tireWear.rearTireAutonomy),
            rearTireDistance: Int64(tireWear.rearTireDistance),
            rearTireTotalWear: Int64(tireWear.rearTireTotalWear),
            rearTireWear: Int64(tireWear.rearTireWear),
            rearTireWearRate: Int64(tireWear.rearTireWearRate)
        )
    }
}

extension PigeonBrakeWear {
    init(from brakeWear: DKBrakeWear) {
        self.init(
            frontBrakeAutonomy: Int64(brakeWear.frontBrakeAutonomy),
            frontBrakeDistance: Int64(brakeWear.frontBrakeDistance),
            frontBrakePadWear: Int64(brakeWear.frontBrakePadWear),
            frontBrakeTotalWear: Int64(brakeWear.frontBrakeTotalWear),
            frontBrakeWearRate: Int64(brakeWear.frontBrakeWearRate),
            rearBrakeAutonomy: Int64(brakeWear.rearBrakeAutonomy),
            rearBrakeDistance: Int64(brakeWear.rearBrakeDistance),
            rearBrakePadWear: Int64(brakeWear.rearBrakePadWear),
            rearBrakeTotalWear: Int64(brakeWear.rearBrakeTotalWear),
            rearBrakeWearRate: Int64(brakeWear.rearBrakeWearRate)
        )
    }
}

extension PigeonDriverDistraction {
    init(from driverDistraction: DKDriverDistraction) {
        self.init(
            nbUnlock: Int64(driverDistraction.nbUnlock),
            durationUnlock: driverDistraction.durationUnlock,
            durationPercentUnlock: driverDistraction.durationPercentUnlock,
            distanceUnlock: driverDistraction.distanceUnlock,
            distancePercentUnlock: driverDistraction.distancePercentUnlock,
            score: driverDistraction.score,
            scoreUnlock: driverDistraction.scoreUnlock,
            scoreCall: driverDistraction.scoreCall
        )
    }
}

extension PigeonCall {
    init(from call: DKCall) {
        self.init(
            id: Int64(call.id),
            start: call.start,
            end: call.end,
            duration: Int64(call.duration),
            durationPercent: Int64(call.durationPercent),
            distance: Int64(call.distance),
            distancePercent: Int64(call.distancePercent),
            type: call.typeValue ?? "",
            audioSystem: call.audioSystemValue ?? "",
            audioInput: call.audioInput, audioOutput: call.audioOutput, audioName: call.audioName, bluetoothClass: Int64(call.bluetoothClass),
            isForbidden: call.isForbidden
        )
    }
}
extension PigeonLogbook {
    init(from logbook: DKLogbook) {
        self.init(
            status: Int64(logbook.status),
            updateDate: (logbook.updateDate != nil) ? DateUtils.convertDateToString(date: logbook.updateDate!) : nil
        )
    }
}

extension PigeonOccupantInfo {
    init(from occupantInfo: DKOccupantInfo) {
        var role: PigeonOccupantRole
        switch occupantInfo.role {
        case .unavailable:
            role = PigeonOccupantRole.unavailable
        case .driver:
            role = PigeonOccupantRole.driver
        case .passenger:
            role = PigeonOccupantRole.passenger
        case .notApplicable:
            role = PigeonOccupantRole.notApplicable
        @unknown default:
            fatalError()
        }
        self.init(
            role: role,
            passengerProbability: Int64(occupantInfo.passengerProbability)
        )
    }
}

extension PigeonSafetyEvent {
    init(from safetyEvent: DKSafetyEvents) {
        self.init(
            time: safetyEvent.time,
            longitude: safetyEvent.longitude,
            latitude: safetyEvent.latitude,
            velocity: safetyEvent.velocity,
            heading: safetyEvent.heading,
            elevation: safetyEvent.elevation,
            distance: safetyEvent.distance,
            type: Int64(safetyEvent.type),
            level: Int64(safetyEvent.level),
            value: safetyEvent.value
        )
    }
}

extension PigeonSpeedingStatistics {
    init(from speedingStatistics: DKSpeedingStatistics) {
        self.init(
            distance: Int64(speedingStatistics.distance),
            duration: Int64(speedingStatistics.duration),
            speedingDistance: Int64(speedingStatistics.speedingDistance),
            speedingDuration: Int64(speedingStatistics.speedingDuration),
            score: speedingStatistics.score
        )
    }
}

extension PigeonSpeedLimitContext {
    init(from speedLimitContext: DKSpeedLimitContext) {
        self.init(
            speedLimit: Int64(speedLimitContext.speedLimit),
            distance: Int64(speedLimitContext.distance),
            duration: Int64(speedLimitContext.duration),
            speedingDistance: Int64(speedLimitContext.speedingDistance),
            speedingDuration: Int64(speedLimitContext.speedingDuration),
            score: speedLimitContext.score
        )
    }
}

extension PigeonEnergyEstimation {
    init(from energyEstimation: DKEnergyEstimation) {
        self.init(
            energy: energyEstimation.energy,
            energyConsumption: energyEstimation.energyConsumption,
            energyOpti: energyEstimation.energyOpti,
            energyOptiConsumption: energyEstimation.energyOptiConsumption
        )
    }
}

extension PigeonAdvancedEnergyEstimation {
    init(from advancedEnergyEstimation: DKAdvancedEnergyEstimation) {
        self.init(
            energy: advancedEnergyEstimation.energy,
            energyConsumption: advancedEnergyEstimation.energyConsumption,
            energyOpti: advancedEnergyEstimation.energyOpti,
            energyOptiConsumption: advancedEnergyEstimation.energyOptiConsumption,
            duration: advancedEnergyEstimation.duration,
            distance: advancedEnergyEstimation.distance,
            contextId: Int64(advancedEnergyEstimation.contextId)
        )
    }
}

extension PigeonTripAdviceData {
    init(from tripAdvice: DKTripAdvice) {
        self.init(
            id: tripAdvice.id,
            title: tripAdvice.title,
            message: tripAdvice.message,
            messageId: tripAdvice.messageId,
            theme: tripAdvice.theme,
            adviceEvaluation: PigeonTripAdviceEvaluation(
                evaluation: Int64(tripAdvice.evaluation),
                feedback: Int64(tripAdvice.feedback),
                comment: tripAdvice.comment
            )
        )
    }
}

extension PigeonManeuverData {
    init(from maneuver: DKManeuver) {
        self.init(
            nbStraightReverseDrivings: Int64(maneuver.nbStraightReverseDrivings),
            nbCurveReverseDrivings: Int64(maneuver.nbCurveReverseDrivings),
            nbTurns: Int64(maneuver.nbTurns),
            nbHillStarts: Int64(maneuver.nbHillStarts),
            nbRoundAbouts: Int64(maneuver.nbRoundAbouts),
            nbEmergencyStops: Int64(maneuver.nbEmergencyStops),
            nbAngledParkings: Int64(maneuver.nbAngledParkings),
            nbParallelParkings: Int64(maneuver.nbParallelParkings),
            nbBayParkings: Int64(maneuver.nbBayParkings)
        )
    }
}

extension PigeonEvaluationData {
    init(from evaluation: DKEvaluation) {
        self.init(
            comment: evaluation.comment,
            evaluation: Int64(evaluation.evaluation)
        )
    }
}

extension PigeonDeclaredTransportationMode {
    init(from declaredTransportationMode: DKDeclaredTransportationMode) {
        self.init(
            transportationMode: Int64(declaredTransportationMode.transportationMode.rawValue),
            comment: declaredTransportationMode.comment,
            passenger: declaredTransportationMode.passenger
        )
    }
}

extension TransportationMode {
    init(from pigeonTransportationMode: PigeonTransportationMode) {
        switch pigeonTransportationMode {
        case .unknown:
            self = .unknown
        case .car:
            self = .car
        case .moto:
            self = .moto
        case .truck:
            self = .truck
        case .bus:
            self = .bus
        case .train:
            self = .train
        case .boat:
            self = .boat
        case .bike:
            self = .bike
        case .flight:
            self = .flight
        case .skiing:
            self = .skiing
        case .onFoot:
            self = .onFoot
        case .idle:
            self = .idle
        case .other:
            self = .other
        }
    }
}

extension SynchronizationType {
    init(from pigeonSynchronizationType: PigeonSynchronizationType) {
        switch pigeonSynchronizationType {
        case .defaultSync:
            self = .defaultSync
        case .cache:
            self = .cache
        }
    }
}

extension PigeonGetRouteResponse {
    init(from route: DKRoute?) {
        if let route = route {
            self.init(
                status: .success,
                route: PigeonRoute(from: route)
            )
        } else {
            self.init(status: .failedToRetrieveRoute)
        }
    }
}

extension PigeonRoute {
    init(from route: DKRoute) {
        self.init(
            callIndex: route.callIndex?.map { Int64($0) },
            callTime: route.callTime?.map { Int64($0) },
            itinId: route.itinId,
            latitude: route.latitude,
            longitude: route.longitude,
            screenLockedIndex: route.screenLockedIndex?.map { Int64($0) },
            screenLockedTime: route.screenLockedTime?.map { Int64($0) },
            speedingIndex: route.speedingIndex?.map { Int64($0) },
            speedingTime: route.speedingTime?.map { Int64($0) }
        )
    }
}

extension PigeonUpdateDriverPassengerModeStatus {
    init(from status: DKUpdateDriverPassengerModeStatus) {
        switch status {
        case .success:
            self = .success
        case .userNotConnected:
            self = .userNotConnected
        case .invalidTransportationMode:
            self = .invalidTransportationMode
        case .commentTooLong:
            self = .commentTooLong
        case .failedToUpdateMode:
            self = .failedToUpdateMode
        case .invalidItineraryId:
            self = .invalidItineraryId
        @unknown default:
            fatalError()
        }
    }
}
