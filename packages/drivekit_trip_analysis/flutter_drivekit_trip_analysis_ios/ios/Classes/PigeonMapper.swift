import DriveKitCoreModule
import CoreLocation
import DriveKitTripAnalysisModule

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

extension PigeonPostGeneric {
    init(from post: PostGeneric) {
        if let route = post.route {
            self.route = PigeonRoute(from: route)
        }
        if let itineraryData = post.itineraryData {
            self.itineraryData = PigeonItineraryData(from: itineraryData)
        }
        if let metaData = post.metaData {
            self.metaData = metaData
        }
        if let vehicle = post.vehicle {
            self.vehicle = PigeonVehicle(from: vehicle)
        }
    }
}

extension PigeonRoute {
    init(from route: Route) {
        self.init(
            gpsDate: route.gpsDate,
            gpsVelocity: route.gpsVelocity,
            longitude: route.longitude,
            latitude: route.latitude,
            gpsElevation: route.gpsElevation,
            gpsAccuracy: route.gpsAccuracy,
            gpsHeading: route.gpsHeading,
            screenLocked: route.screenLocked,
            activityValue: route.activityValue,
            roll: route.roll.map({ Int64($0) }),
            pitch: route.pitch.map({ Int64($0) }),
            yaw: route.yaw.map({ Int64($0) }),
            gyroscopeNormVar: route.gyroscopeNormVar.map({ Int64($0) })
        )
    }
}

extension PigeonItineraryData {
    init(from itineraryData: ItineraryData) {
        self.init(
            startDate: itineraryData.startDate,
            endDate: itineraryData.endDate,
            departureCity: itineraryData.departureCity,
            arrivalCity: itineraryData.arrivalCity,
            departureAddress: itineraryData.departureAddress,
            arrivalAddress: itineraryData.arrivalAddress
        )
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

extension PigeonPostGenericResponse {
    init (from postGenericResponse: PostGenericResponse) {
        self.status = postGenericResponse.status
        if let itinId = postGenericResponse.itinId {
            self.itinId = itinId
        }
        if let comments = postGenericResponse.comments {
            self.comments = comments.map({
                PigeonComment(errorCode: Int64($0.errorCode), comment: $0.comment)
            })
        } else {
            self.comments = []
        }
        if let userId = postGenericResponse.userId {
            self.userId = userId
        }
        if let itineraryStatistics = postGenericResponse.itineraryStatistics {
            self.itineraryStatistics = PigeonItineraryStatistics(from: itineraryStatistics)
        }
        if let ecoDriving = postGenericResponse.ecoDriving {
            self.ecoDriving = PigeonEcoDriving(from: ecoDriving)
        }
        if let fuelEstimation = postGenericResponse.fuelEstimation {
            self.fuelEstimation = PigeonFuelEstimation(from: fuelEstimation)
        }
        if let safety = postGenericResponse.safety {
            self.safety = PigeonSafety(from: safety)
        }
        if let advancedEcoDriving = postGenericResponse.advancedEcoDriving {
            self.advancedEcoDriving = PigeonAdvancedEcoDriving(from: advancedEcoDriving)
        }
        if let advancedFuelEstimation = postGenericResponse.advancedFuelEstimation {
            self.advancedFuelEstimation = PigeonAdvancedFuelEstimation(from: advancedFuelEstimation)
        }
        if let advancedSafety = postGenericResponse.advancedSafety {
            self.advancedSafety = PigeonAdvancedSafety(from: advancedSafety)
        }
        if let pollutants = postGenericResponse.pollutants {
            self.pollutants = PigeonPollutants(from: pollutants)
        }
        if let tireWear = postGenericResponse.tireWear {
            self.tireWear = PigeonTireWear(from: tireWear)
        }
        if let brakeWear = postGenericResponse.brakeWear {
            self.brakeWear = PigeonBrakeWear(from: brakeWear)
        }
        if let driverDistraction = postGenericResponse.driverDistraction {
            self.driverDistraction = PigeonDriverDistraction(from: driverDistraction)
        }
        if let itineraryData = postGenericResponse.itineraryData {
            self.itineraryData = PigeonItineraryData(from: itineraryData)
        }
        self.endDate = postGenericResponse.endDate
        if let logbook = postGenericResponse.logbook {
            self.logbook = PigeonLogbook(from: logbook)
        }
        if let safetyEvents = postGenericResponse.safetyEvents {
            self.safetyEvents = safetyEvents.map({
                PigeonSafetyEvent(from: $0)
            })
        }
        if let callEvents = postGenericResponse.callEvents {
            self.callEvents = callEvents.map({
                PigeonCallEvent(from: $0)
            })
        }
        if let speedingEvents = postGenericResponse.speedingEvents {
            self.speedingEvents = speedingEvents.map({
                PigeonSpeedingEvent(from: $0)
            })
        }
        if let speedingStatistics = postGenericResponse.speedingStatistics {
            self.speedingStatistics = PigeonSpeedingStatistics(from: speedingStatistics)
        }
        if let energyEstimation = postGenericResponse.energyEstimation {
            self.energyEstimation = PigeonEnergyEstimation(from: energyEstimation)
        }
        if let advancedEnergyEstimation = postGenericResponse.advancedEnergyEstimation {
            self.advancedEnergyEstimation = advancedEnergyEstimation.map({
                PigeonAdvancedEnergyEstimation(from: $0)
            })
        }
    }
}

extension PigeonItineraryStatistics {
    init (from itineraryStatistics: ItineraryStatistics) {
        self.tripDuration = itineraryStatistics.tripDuration
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
        self.transportationMode = Int64(itineraryStatistics.transportationMode)
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
            updateDate: logbook.updateDate
        )
    }
}

extension PigeonSafetyEvent {
    init(from safetyEvent: SafetyEvent) {
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

extension PigeonCallEvent {
    init(from callEvent: CallEvent) {
        self.init(
            time: callEvent.time,
            latitude: callEvent.latitude,
            longitude: callEvent.longitude,
            velocity: callEvent.velocity,
            heading: callEvent.heading,
            elevation: callEvent.elevation,
            distance: callEvent.distance,
            type: Int64(callEvent.type),
            duration: Int64(callEvent.duration),
            audioSystem: callEvent.audioSystem,
            callType: callEvent.callType,
            index: Int64(callEvent.index),
            forbidden: callEvent.forbidden
        )
    }
}

extension PigeonSpeedingEvent {
    init(from speedingEvent: SpeedingEvent) {
        self.init(
            time: speedingEvent.time,
            longitude: speedingEvent.longitude,
            latitude: speedingEvent.latitude,
            type: speedingEvent.type,
            index: Int64(speedingEvent.index)
        )
    }
}

extension PigeonSpeedingStatistics {
    init(from speedingStatistics: SpeedingStatistics) {
        self.init(
            distance: Int64(speedingStatistics.distance),
            duration: Int64(speedingStatistics.duration),
            speedingDistance: Int64(speedingStatistics.speedingDistance),
            speedingDuration: Int64(speedingStatistics.speedingDuration),
            score: speedingStatistics.score,
            speedLimitContexts: speedingStatistics.speedLimitContexts.map({
                PigeonSpeedLimitContext(from: $0)
            })
        )
    }
}

extension PigeonSpeedLimitContext {
    init(from speedLimitContext: SpeedLimitContext) {
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

extension PigeonPostGenericResponse {
    func getStatus() -> PigeonTripResponseStatus {
        if self.isValid() {
            let info: [PigeonTripResponseInfoItem] = self.comments.compactMap {pigeonComment in
                if let pigeonComment,
                   let tripResponseInfo = TripResponseInfo(rawValue: Int(pigeonComment.errorCode)) {
                    return PigeonTripResponseInfoItem(
                        info: PigeonTripResponseInfo(from: tripResponseInfo)
                    )
                } else {
                    return nil
                }
            }
            return PigeonTripResponseStatus(
                status: .tripValid,
                hasSafetyAndEcoDrivingScore: self.hasSafetyAndEcoDrivingScore(),
                info: info
            )
        } else {
            let error: PigeonTripResponseError? = self.comments.compactMap {pigeonComment in
                if let pigeonComment,
                   let tripResponseError = TripResponseError(rawValue: Int(pigeonComment.errorCode)) {
                    return PigeonTripResponseError(from: tripResponseError)
                } else {
                    return nil
                }
            }.first
            return PigeonTripResponseStatus(
                status: .tripError,
                hasSafetyAndEcoDrivingScore: false,
                info: [],
                error: error
            )
        }
    }
    
    private func isValid() -> Bool {
        if let itineraryStatistics = self.itineraryStatistics, itineraryStatistics.distance > 0, self.itinId != nil, self.comments.contains(where: { $0?.errorCode == 0 }) == true {
            return true
        }
        return false
    }
    
    private func hasSafetyAndEcoDrivingScore() -> Bool {
        var isScored = false
        if let ecoDriving = self.ecoDriving, let safety = self.safety {
            isScored = ecoDriving.score <= 10 && safety.safetyScore <= 10
        }
        return isScored
    }
}
