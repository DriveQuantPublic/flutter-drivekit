import Flutter
import UIKit
import DriveKitTripSimulatorModule

extension FlutterError: Error {}

public class DriveJitTripSimulatorPlugin: NSObject, FlutterPlugin, IOSTripSimulatorApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSTripSimulatorApi & NSObjectProtocol = DriveKitTripSimulatorPlugin.init()

        IOSTripSimulatorApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func start(presetTrip: PigeonPresetTrip) throws {
        let (tripToSimulate, crashTripToSimulate) = PigeonMapper.getPresetTrip(from: presetTrip)
        if let tripToSimulate {
            DriveKitTripSimulator.shared.start(tripToSimulate)
        } else if let crashTripToSimulate {
            DriveKitTripSimulator.shared.startCrashTrip(crashTripToSimulate)
        }
    }

    func stop() throws {
        DriveKitTripSimulator.shared.stop()
    }

}
