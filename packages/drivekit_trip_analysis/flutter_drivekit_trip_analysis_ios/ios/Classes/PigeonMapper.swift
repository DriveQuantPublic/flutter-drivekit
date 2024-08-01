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
