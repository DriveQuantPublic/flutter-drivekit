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
            self.route = PigeonRoute.init(from: route)
        }
        if let itineraryData = post.itineraryData {
            self.itineraryData = PigeonItineraryData.init(from: itineraryData)
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
        // TODO complete implementation for
        // itineraryData, endDate, logbook,
        // safetyEvents, callEvents, speedingEvents, speedingStatistics, energyEstimation, advancedEnergyEstimation
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
