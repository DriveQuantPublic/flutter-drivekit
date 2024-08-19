import DriveKitDriverDataModule
import DriveKitDBTripAccessModule
import DriveKitCoreModule

extension PigeonGetTripsResponse{
    init(from status: TripSyncStatus, trips: [Trip]) {
        self.init(status: PigeonTripSyncStatus(from: status), trips: trips.map{ PigeonTrip(from: $0)})
    }
}


extension PigeonTripSyncStatus {
    init(from status: TripSyncStatus) {
        switch status {
            case .noError:
                self = PigeonTripSyncStatus.noError
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
    init (from trip: Trip) {
        if let itinId = trip.itinId {
            self.itinId = itinId
        }
        if let startDate = trip.endDate {
            self.startDate = DateUtils.convertDateToString(date: startDate)
        }
        if let endDate = trip.endDate {
            self.endDate = DateUtils.convertDateToString(date: endDate)
        }
        self.departureCity = trip.departureCity
        self.arrivalCity = trip.arrivalCity
        self.departureAddress = trip.departureAddress
        self.arrivalAddress = trip.arrivalAddress
        self.vehicleId = trip.vehicleId
        if let itineraryStatistics = trip.tripStatistics {
            self.itineraryStatistics = PigeonItineraryStatistics(from: itineraryStatistics, transportationMode: Int64(trip.transportationMode))
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
        if let advancedEcoDrivingContexts = trip.ecoDrivingContexts?.allObjects as? [EcoDrivingContext] {
            self.advancedEcoDriving = PigeonAdvancedEcoDriving(from: advancedEcoDrivingContexts)
        }
        if let advancedFuelEstimationContexts = trip.fuelEstimationContexts?.allObjects as? [FuelEstimationContext] {
            self.advancedFuelEstimation = PigeonAdvancedFuelEstimation(from: advancedFuelEstimationContexts)
        }
        if let advancedSafetyContexts = trip.safetyContexts?.allObjects as? [SafetyContext] {
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
        self.itineraryData = PigeonItineraryData(
            startDate: (trip.startDate != nil) ? DateUtils.convertDateToString(date: trip.startDate!) : nil,
            endDate: (trip.endDate != nil) ? DateUtils.convertDateToString(date: trip.endDate!) : nil,
            departureCity: trip.departureCity,
            arrivalCity: trip.arrivalCity,
            departureAddress: trip.departureAddress,
            arrivalAddress: trip.arrivalAddress
        )
        if let logbook = trip.logbook {
            self.logbook = PigeonLogbook(from: logbook)
        }
        if let safetyEvents = trip.safetyEvents?.allObjects as? [SafetyEvents] {
            self.safetyEvents = safetyEvents.map({
                PigeonSafetyEvent(from: $0)
            })
        }
        if let speedingStatistics = trip.speedingStatistics,
           let speedLimitContexts = trip.speedLimitContexts?.allObjects as? [DBSpeedLimitContext] {
            self.speedingStatistics = PigeonSpeedingStatistics(from: speedingStatistics, speedLimitContexts: speedLimitContexts)
        }
        if let energyEstimation = trip.energyEstimation {
            self.energyEstimation = PigeonEnergyEstimation(from: energyEstimation)
        }
        if let advancedEnergyEstimation = trip.advancedEnergyEstimation?.allObjects as? [DBAdvancedEnergyEstimation] {
            self.advancedEnergyEstimation = advancedEnergyEstimation.map({
                PigeonAdvancedEnergyEstimation(from: $0)
            })
        }
        self.metaData = trip.metadata
        self.transportationMode = Int64(trip.transportationMode)
        self.unscored = trip.unscored
        self.comments = []
    }
}

extension PigeonItineraryStatistics {
    init (from itineraryStatistics: TripStatistics, transportationMode: Int64) {
        self.tripDuration = Double(itineraryStatistics.duration)
        self.drivingDuration = itineraryStatistics.drivingDuration
        self.idlingDuration = itineraryStatistics.idlingDuration
        self.drivingPercentage = itineraryStatistics.drivingPercentage
        self.idlingPercentage = itineraryStatistics.idlingPercentage
        self.distance = itineraryStatistics.distance
        self.speedMean = itineraryStatistics.speedMean
        self.subdispNb = Int64(itineraryStatistics.subdispNb)
        self.meteo = Int64(itineraryStatistics.meteo)
        self.day = itineraryStatistics.day
        self.weekDay = itineraryStatistics.weekDay
        self.transportationMode = transportationMode
    }
}

extension PigeonEcoDriving {
    init (from ecoDriving: EcoDriving) {
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
    init (from fuelEstimation: FuelEstimation) {
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
    init(from safety: Safety) {
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
    init(from ecoDrivingContexts: [EcoDrivingContext]) {
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
    init(from fuelEstimationContexts: [FuelEstimationContext]) {
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
    init(from safetyContexts: [SafetyContext]) {
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
    init(from polluants: Pollutants) {
        self.init(
            co: polluants.co,
            hc: polluants.hc,
            nox: polluants.nox,
            soot: polluants.soot
        )
    }
}

extension PigeonTireWear {
    init(from tireWear: TireWear) {
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
    init(from brakeWear: BrakeWear) {
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
    init(from driverDistraction: DriverDistraction) {
        self.init(
            nbUnlock: Int64(driverDistraction.nbUnlock),
            durationUnlock: driverDistraction.durationUnlock,
            durationPercentUnlock: driverDistraction.durationPercentUnlock,
            distanceUnlock: driverDistraction.distanceUnlock,
            distancePercentUnlock: driverDistraction.distancePercentUnlock,
            score: driverDistraction.score
        )
    }
}

extension PigeonLogbook {
    init(from logbook: Logbook) {
        self.init(
            status: Int64(logbook.status),
            updateDate: (logbook.updateDate != nil) ? DateUtils.convertDateToString(date: logbook.updateDate!) : nil
        )
    }
}

extension PigeonSafetyEvent {
    init(from safetyEvent: SafetyEvents) {
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
    init(from speedingStatistics: DBSpeedingStatistics, speedLimitContexts: [DBSpeedLimitContext]) {
        self.init(
            distance: Int64(speedingStatistics.distance),
            duration: Int64(speedingStatistics.duration),
            speedingDistance: Int64(speedingStatistics.speedingDistance),
            speedingDuration: Int64(speedingStatistics.speedingDuration),
            score: speedingStatistics.score,
            speedLimitContexts: speedLimitContexts.map{ PigeonSpeedLimitContext(from: $0) }
        )
    }
}

extension PigeonSpeedLimitContext {
    init(from speedLimitContext: DBSpeedLimitContext) {
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
    init(from energyEstimation: DBEnergyEstimation) {
        self.init(
            energy: energyEstimation.energy,
            energyConsumption: energyEstimation.energyConsumption,
            energyOpti: energyEstimation.energyOpti,
            energyOptiConsumption: energyEstimation.energyOptiConsumption
        )
    }
}

extension PigeonAdvancedEnergyEstimation {
    init(from advancedEnergyEstimation: DBAdvancedEnergyEstimation) {
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
