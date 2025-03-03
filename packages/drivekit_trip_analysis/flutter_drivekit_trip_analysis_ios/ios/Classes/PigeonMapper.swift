import DriveKitCoreModule
import CoreLocation
import DriveKitTripAnalysisModule
import DriveKitDBTripAccessModule

class PigeonMapper {
    static func initTripVehicle(from pigeonVehicle: PigeonVehicle) -> TripVehicle {
        let tripVehicle = TripVehicle()
        tripVehicle.carTypeIndex = Int(pigeonVehicle.carTypeIndex)
        tripVehicle.carEngineIndex = Int(pigeonVehicle.carEngineIndex)
        tripVehicle.carPower = Double(pigeonVehicle.carPower)
        tripVehicle.carMass = Double(pigeonVehicle.carMass)
        tripVehicle.carGearboxIndex = Int(pigeonVehicle.carGearboxIndex)
        tripVehicle.carConsumption = pigeonVehicle.carConsumption
        tripVehicle.carAutoGearboxNumber = Int(pigeonVehicle.carAutoGearboxNumber)
        tripVehicle.engineDisplacement = Double(pigeonVehicle.engineDisplacement)
        tripVehicle.carPassengers = Int(pigeonVehicle.carPassengers)
        tripVehicle.dqIndex = pigeonVehicle.dqIndex
        tripVehicle.sra = pigeonVehicle.sra
        tripVehicle.frontTireSize = pigeonVehicle.frontTireSize
        tripVehicle.rearTireSize = pigeonVehicle.rearTireSize
        tripVehicle.length = pigeonVehicle.length
        tripVehicle.width = pigeonVehicle.width
        tripVehicle.height = pigeonVehicle.height
        tripVehicle.engineCylinderNb = Int(pigeonVehicle.engineCylinderNb)
        tripVehicle.driveWheels = Int(pigeonVehicle.driveWheels)
        return tripVehicle
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

extension PigeonStartMode {
    init(from startMode: StartMode) {
        switch startMode {
        case .gps:
            self = .gps
        case .beacon:
            self = .beacon
        case .manual:
            self = .manual
        case .geozone:
            self = .geozone
        case .bluetooth:
            self = .bluetooth
        case .bluetooth_unknown:
            self = .unknownBluetooth

        @unknown default:
            fatalError()
        }
    }
}

extension PigeonCancelTrip {
    init(from cancelTrip: CancelTrip) {
        switch cancelTrip {
        case .user:
            self = .user
        case .highspeed:
            self = .highspeed
        case .noSpeed:
            self = .noSpeed
        case .noBeacon:
            self = .noBeacon
        case .missingConfiguration:
            self = .missingConfiguration
        case .noGPSData:
            self = .noGpsData
        case .reset:
            self = .reset
        case .beaconNoSpeed:
            self = .beaconNoSpeed
        case .bluetoothDeviceNoSpeed:
            self = .bluetoothDeviceNoSpeed
        case .noBluetoothDevice:
            self = .noBluetoothDevice
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonState {
    init(from state: State) {
        switch state {
            case .inactive:
                self = .inactive
            case .starting:
                self = .starting
            case .running:
                self = .running
            case .stopping:
                self = .stopping
            case .sending:
                self = .sending
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonVehicle {
    init (from vehicle: TripVehicle) {
        self.init(
            carTypeIndex: Int64(vehicle.carTypeIndex),
            carEngineIndex: Int64(vehicle.carEngineIndex),
            carPower: Int64(vehicle.carPower),
            carMass: Int64(vehicle.carMass),
            carGearboxIndex: Int64(vehicle.carGearboxIndex),
            carConsumption: vehicle.carConsumption,
            carAutoGearboxNumber: Int64(vehicle.carAutoGearboxNumber),
            engineDisplacement: Int64(vehicle.engineDisplacement),
            carPassengers: Int64(vehicle.carPassengers),
            length: vehicle.length,
            width: vehicle.width,
            height: vehicle.height,
            engineCylinderNb: Int64(vehicle.engineCylinderNb),
            driveWheels: Int64(vehicle.driveWheels)
        )
    }
}

extension PigeonTripResponseStatus {
    init (from tripResponseStatus: TripResponseStatus) {
        if let error = tripResponseStatus.error {
            self.error = PigeonTripResponseError(from: error)
        } else {
            self.error = nil
        }
        self.info = tripResponseStatus.info.compactMap { PigeonTripResponseInfoItem(info: PigeonTripResponseInfo(from: $0)) }
        self.itinId = tripResponseStatus.itinId
        self.hasSafetyAndEcoDrivingScore = tripResponseStatus.hasSafetyAndEcoDrivingScore
        self.status = PigeonTripResponseStatusType(from: tripResponseStatus.status)
        if let trip = tripResponseStatus.getTrip() {
            self.trip = PigeonTrip(from: trip)
        }
    }
}

extension PigeonEcoDriving {
    init (from ecoDriving: DriveKitDBTripAccessModule.DKEcoDriving) {
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
    init (from fuelEstimation: DriveKitDBTripAccessModule.DKFuelEstimation) {
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
    init(from safety: DriveKitDBTripAccessModule.DKSafety) {
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
    init(from advancedEcoDriving: AdvancedEcoDriving) {
        var contextArray: [PigeonEcoDrivingContext?] = []
        if let ecoDrivingContext = advancedEcoDriving.ecoDrivingContext {
            for context in ecoDrivingContext {
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
        }
        self.init(ecoDrivingContext: contextArray)
    }
}

extension PigeonAdvancedFuelEstimation {
    init(from advancedFuelEstimation: AdvancedFuelEstimation) {
        var contextArray: [PigeonFuelEstimationContext?] = []
        if let fuelEstimationContext = advancedFuelEstimation.fuelEstimationContext {
            for context in fuelEstimationContext {
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
        }

        self.init(fuelEstimationContext: contextArray)
    }
}

extension PigeonAdvancedSafety {
    init(from advancedSafety: AdvancedSafety) {
        var contextArray: [PigeonSafetyContext?] = []
        if let safetyContext = advancedSafety.safetyContext {
            for context in safetyContext {
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
        }
        self.init(safetyContext: contextArray)
    }
}

extension PigeonPollutants {
    init(from polluants: DriveKitDBTripAccessModule.DKPollutants) {
        self.init(
            co: polluants.co,
            hc: polluants.hc,
            nox: polluants.nox,
            soot: polluants.soot
        )
    }
}

extension PigeonTireWear {
    init(from tireWear: DriveKitDBTripAccessModule.DKTireWear) {
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
    init(from brakeWear: DriveKitDBTripAccessModule.DKBrakeWear) {
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
    init(from energyEstimation: DriveKitDBTripAccessModule.DKEnergyEstimation) {
        self.init(
            energy: energyEstimation.energy,
            energyConsumption: energyEstimation.energyConsumption,
            energyOpti: energyEstimation.energyOpti,
            energyOptiConsumption: energyEstimation.energyOptiConsumption
        )
    }
}

extension PigeonAdvancedEnergyEstimation {
    init(from advancedEnergyEstimation: DriveKitDBTripAccessModule.DKAdvancedEnergyEstimation) {
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

extension PigeonDKCrashInfo {
    init(from crashInfo: DKCrashInfo) {
        self.init(
            crashId: crashInfo.crashId,
            date: DateUtils.convertDateToString(date: crashInfo.date),
            status: PigeonCrashStatus(from: crashInfo.crashStatus),
            probability: Int64(crashInfo.probability),
            latitude: crashInfo.latitude,
            longitude: crashInfo.longitude,
            velocity: crashInfo.velocity)
    }
}

extension PigeonCrashStatus {
    init(from status: DKCrashStatus) {
        switch status {
            case .unconfirmed:
                self = .unconfirmed
            case .confirmed:
                self = .confirmed
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonLocation {
    init(from location: CLLocation) {
        self.init(
            longitude: location.coordinate.longitude,
            latitude: location.coordinate.latitude
        )
    }
}

extension PigeonDKCrashFeedbackType {
    init(from type: DKCrashFeedbackType) {
        switch type {
            case .noCrash:
                self = .noCrash
            case .confirmed:
                self = .crashConfirmed
            case .noFeedback:
                self = .noFeedback
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonDKCrashFeedbackSeverity {
    init(from severity: DKCrashFeedbackSeverity) {
        switch severity {
            case .none:
                self = .none
            case .minor:
                self = .minor
            case .critical:
                self = .critical
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonTripPoint {
    init(from tripPoint: TripPoint) {
        self.init(
            latitude: tripPoint.latitude,
            longitude: tripPoint.longitude,
            speed: tripPoint.speed,
            accuracy: tripPoint.accuracy,
            elevation: tripPoint.elevation,
            distance: tripPoint.distance,
            heading: tripPoint.heading,
            duration: tripPoint.duration
        )
    }
}

extension PigeonTripResponseInfo {
    init(from tripResponseInfo: TripResponseInfo) {
        switch tripResponseInfo {
            case .engineSpeedNotAvailable:
                self = .engineSpeedNotAvailable
            case .engineSpeedIsNull:
                self = .engineSpeedIsNull
            case .noVehicleCharacteristics:
                self = .noVehicleCharacteristics
            case .dataLoss:
                self = .dataLoss
            case .distanceTooShort:
                self = .distanceTooShort
            case .invalidVehicleCharacteristics:
                self = .invalidVehicleCharacteristics
            case .invalidVehicleId:
                self = .invalidVehicleId
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonTripResponseError {
    init(from tripResponseError: TripResponseError) {
        switch tripResponseError {
            case .noAccountSet:
                self = .noAccountSet
            case .noRouteObjectFound:
                self = .noRouteObjectFound
            case .invalidRouteDefinition:
                self = .invalidRouteDefinition
            case .noVelocityData:
                self = .noVelocityData
            case .invalidSamplingPeriod:
                self = .invalidSamplingPeriod
            case .invalidCustomerId:
                self = .invalidCustomerId
            case .noDateFound:
                self = .noDateFound
            case .maxDailyRequestNumberReached:
                self = .maxDailyRequestNumberReached
            case .dataError:
                self = .dataError
            case .invalidRouteVectors:
                self = .invalidRouteVectors
            case .missingBeacon:
                self = .missingBeacon
            case .invalidBeacon:
                self = .invalidBeacon
            case .duplicateTrip:
                self = .duplicateTrip
            case .insufficientGpsData:
                self = .insufficientGpsData
            case .userDisabled:
                self = .userDisabled
            case .invalidUser:
                self = .invalidUser
            case .invalidGpsData:
                self = .invalidGpsData
            case .invalidTrip:
                self = .invalidTrip
            case .accountLimitReached:
                self = .accountLimitReached
            @unknown default:
                fatalError()
        }
    }
}

extension PigeonTripResponseStatusType {
    init(from tripResponseStatusType: TripResponseStatusType) {
        switch tripResponseStatusType {
            case .tripValid:
                self = .tripValid
            case .tripError:
                self = .tripError
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
        self.departureCity = trip.departureCity
        self.arrivalCity = trip.arrivalCity
        self.departureAddress = trip.departureAddress
        self.arrivalAddress = trip.arrivalAddress
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

extension PigeonAdvancedEcoDriving {
    init(from ecoDrivingContexts: [DriveKitDBTripAccessModule.DKEcoDrivingContext]) {
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
    init(from fuelEstimationContexts: [DriveKitDBTripAccessModule.DKFuelEstimationContext]) {
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
    init(from safetyContexts: [DriveKitDBTripAccessModule.DKSafetyContext]) {
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

extension PigeonDriverDistraction {
    init(from driverDistraction: DriveKitDBTripAccessModule.DKDriverDistraction) {
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
    init(from call: DriveKitDBTripAccessModule.DKCall) {
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
            audioInput: call.audioInput,
            audioOutput: call.audioOutput,
            audioName: call.audioName,
            bluetoothClass: Int64(call.bluetoothClass),
            isForbidden: call.isForbidden
        )
    }
}
extension PigeonLogbook {
    init(from logbook: DriveKitDBTripAccessModule.DKLogbook) {
        self.init(
            status: Int64(logbook.status),
            updateDate: (logbook.updateDate != nil) ? DateUtils.convertDateToString(date: logbook.updateDate!) : nil
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

extension PigeonCurrentTripInfo {
    init(from currentTripInfo: DKTripInfo) {
        self.init(
            localTripId: currentTripInfo.localTripId,
            date: DateUtils.convertDateToString(date: currentTripInfo.date),
            startMode: PigeonStartMode.init(from: currentTripInfo.startMode)
        )
    }
}

extension PigeonLastTripLocation {
    init(from lastTripLocation: DKTripLocation) {
        self.init(
            date: DateUtils.convertDateToString(date: lastTripLocation.date),
            latitude: lastTripLocation.latitude,
            longitude: lastTripLocation.longitude,
            accuracyMeter: lastTripLocation.accuracyMeter,
            accuracyLevel: PigeonAccuracyLevel.init(from: lastTripLocation.getAccuracyLevel())
        )
    }
}

extension PigeonAccuracyLevel {
    init(from accuracyLevel: DKCoordinateAccuracy) {
        switch accuracyLevel {
        case .good:
            self = .good
        case .fair:
            self = .fair
        case .poor:
            self = .poor
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonTripRecordingStartedState {
    init(from state: DKTripRecordingStartedState) {
        self.init(
            localTripId: state.localTripId,
            recordingStartDate: DateUtils.convertDateToString(date: state.recordingStartDate),
            startMode: PigeonStartMode.init(from: state.startMode)
        )
    }
}

extension PigeonTripRecordingConfirmedState {
    init(from state: DKTripRecordingConfirmedState) {
        self.init(
            localTripId: state.localTripId,
            recordingStartDate: DateUtils.convertDateToString(date: state.recordingStartDate),
            recordingConfirmationDate: DateUtils.convertDateToString(date: state.recordingConfirmationDate),
            startMode: PigeonStartMode.init(from: state.startMode)
        )
    }
}

extension PigeonTripRecordingCanceledState {
    init(from state: DKTripRecordingCanceledState) {
        let recordingConfirmationDate: String?
        if let date = state.recordingConfirmationDate {
            recordingConfirmationDate = DateUtils.convertDateToString(date: date)
        } else {
            recordingConfirmationDate = nil
        }
        self.init(
            localTripId: state.localTripId,
            recordingStartDate: DateUtils.convertDateToString(date: state.recordingStartDate),
            recordingConfirmationDate: recordingConfirmationDate,
            startMode: PigeonStartMode.init(from: state.startMode),
            cancelationReason: PigeonTripCancelationReason.init(from: state.cancelationReason)
        )
    }
}

extension PigeonTripCancelationReason {
    init(from cancelationReason: DKTripCancelationReason) {
        switch cancelationReason {
            case .user:
                self = .user
            case .highSpeed:
                self = .highSpeed
            case .noSpeed:
                self = .noSpeed
            case .noBeacon:
                self = .noBeacon
            case .noBluetoothDevice:
                self = .noBluetoothDevice
            case .missingConfiguration:
                self = .missingConfiguration
            case .noLocationData:
                self = .noLocationData
            case .reset:
                self = .reset
            case .beaconNoSpeed:
                self = .beaconNoSpeed
            case .bluetoothDeviceNoSpeed:
                self = .bluetoothDeviceNoSpeed
            case .appKilled:
                self = .appKilled
            @unknown default:
            fatalError()
        }
    }
}

extension PigeonTripRecordingFinishedState {
    init(from state: DKTripRecordingFinishedState) {
        self.init(
            localTripId: state.localTripId,
            recordingStartDate: DateUtils.convertDateToString(date: state.recordingStartDate),
            recordingConfirmationDate: DateUtils.convertDateToString(date: state.recordingConfirmationDate),
            startMode: PigeonStartMode.init(from: state.startMode),
            recordingEndDate: DateUtils.convertDateToString(date: state.recordingEndDate)
        )
    }
}

extension PigeonCreateTripSharingLinkStatus {
    init(from status: DKCreateTripSharingLinkStatus) {
        switch status {
        case .success:
            self = .success
        case .userNotConnected:
            self = .userNotConnected
        case .invalidDuration:
            self = .invalidDuration
        case .unauthenticated:
            self = .unauthenticated
        case .forbidden:
            self = .forbidden
        case .activeLinkAlreadyExists:
            self = .activeLinkAlreadyExists
        case .error:
            self = .error
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonGetTripSharingLinkStatus {
    init(from status: DKGetTripSharingLinkStatus) {
        switch status {
        case .success:
            self = .success
        case .userNotConnected:
            self = .userNotConnected
        case .unauthenticated:
            self = .unauthenticated
        case .forbidden:
            self = .forbidden
        case .failedToGetCacheOnly:
            self = .failedToGetCacheOnly
        case .noActiveLink:
            self = .noActiveLink
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonRevokeTripSharingLinkStatus {
    init(from status: DKRevokeTripSharingLinkStatus) {
        switch status {
        case .success:
            self = .success
        case .userNotConnected:
            self = .userNotConnected
        case .unauthenticated:
            self = .unauthenticated
        case .forbidden:
            self = .forbidden
        case .noActiveLink:
            self = .noActiveLink
        case .error:
            self = .error
        @unknown default:
            fatalError()
        }
    }
}

extension PigeonTripSharingLink {
    init(from data: DKTripSharingLink) {
        self.init(
            code: data.code,
            url: data.url,
            startDate: DateUtils.convertDateToString(date: data.startDate),
            endDate: DateUtils.convertDateToString(date: data.endDate)
        )
    }
}
