import Flutter
import UIKit
import DriveKitTripSimulatorModule

extension FlutterError: Error {}

public class DrivekitTripSimulatorPlugin: NSObject, FlutterPlugin, IOSTripSimulatorApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripSimulatorApi & NSObjectProtocol = DrivekitTripSimulatorPlugin.init()

        IOSTripSimulatorApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    public func getPlatformName() throws -> String {
        return "iOS"
    }

    func start(presetTrip: PigeonPresetTrip) throws {
        switch presetTrip {
            case .shortTrip:
                DriveKitTripSimulator.shared.start(.shortTrip)
            case .mixedTrip:
                DriveKitTripSimulator.shared.start(.mixedTrip)
            case .cityTrip:
                DriveKitTripSimulator.shared.start(.cityTrip)
            case .suburbanTrip:
                DriveKitTripSimulator.shared.start(.suburbanTrip)
            case .highwayTrip:
                DriveKitTripSimulator.shared.start(.highwayTrip)
            case .trainTrip:
                DriveKitTripSimulator.shared.start(.trainTrip)
            case .boatTrip:
                DriveKitTripSimulator.shared.start(.boatTrip)
            case .busTrip:
                DriveKitTripSimulator.shared.start(.busTrip)
            case .tripWithCrashConfirmed10KmH:
                DriveKitTripSimulator.shared.startCrashTrip(.confirmed10KmH)
            case .tripWithCrashConfirmed20KmH:
                DriveKitTripSimulator.shared.startCrashTrip(.confirmed20KmH)
            case .tripWithCrashConfirmed30KmH:
                DriveKitTripSimulator.shared.startCrashTrip(.confirmed30KmH)
            case .tripWithCrashUnconfirmed0KmH:
                DriveKitTripSimulator.shared.startCrashTrip(.unconfirmed0KmH)
            case .tripWithCrashConfirmed30KmHStillDriving:
                DriveKitTripSimulator.shared.startCrashTrip(.confirmed30KmHStillDriving)
        }
    }
    
    func stop() throws {
        DriveKitTripSimulator.shared.stop()
    }

}
