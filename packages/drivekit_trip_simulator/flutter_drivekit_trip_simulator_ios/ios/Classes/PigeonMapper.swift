import DriveKitTripSimulatorModule

class PigeonMapper {
    static func getPresetTrip(from pigeonPresetTrip: PigeonPresetTrip) -> (PresetTrip?, PresetCrashConfiguration?) {
        switch pigeonPresetTrip {
            case .shortTrip:
                return (.shortTrip, nil)
            case .mixedTrip:
                return (.mixedTrip, nil)
            case .cityTrip:
                return(.cityTrip, nil)
            case .suburbanTrip:
                return(.suburbanTrip, nil)
            case .highwayTrip:
                return(.highwayTrip, nil)
            case .trainTrip:
                return(.trainTrip, nil)
            case .boatTrip:
                return(.boatTrip, nil)
            case .busTrip:
                return(.busTrip, nil)
            case .tripWithCrashConfirmed10KmH:
                return (nil, .confirmed10KmH)
            case .tripWithCrashConfirmed20KmH:
                return (nil, .confirmed20KmH)
            case .tripWithCrashConfirmed30KmH:
                return (nil, .confirmed30KmH)
            case .tripWithCrashUnconfirmed0KmH:
                return (nil, .unconfirmed0KmH)
            case .tripWithCrashConfirmed30KmHStillDriving:
                return (nil, .confirmed30KmHStillDriving)
        }
    }
}
