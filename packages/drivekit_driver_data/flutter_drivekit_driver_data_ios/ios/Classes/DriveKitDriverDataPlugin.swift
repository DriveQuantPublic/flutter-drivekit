import Flutter
import UIKit
import DriveKitCoreModule
import DriveKitDriverDataModule
import DriveKitDBTripAccessModule

extension FlutterError: Error {}

public class DriveKitDriverDataPlugin: NSObject, FlutterPlugin, IOSDriverDataApi {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: IOSDriverDataApi & NSObjectProtocol = DriveKitDriverDataPlugin.init()

        IOSDriverDataApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func getTripsOrderByDateAsc(synchronizationType: PigeonSynchronizationType, transportationModes: [PigeonTransportationMode], completion: @escaping (Result<PigeonGetTripsResponse, any Error>) -> Void) {
        DriveKitDriverData.shared.getTripsOrderByDateAsc(
            withTransportationModes: transportationModes.map({ TransportationMode(from: $0) }),
            type: SynchronizationType(from: synchronizationType)
        ) { status, trips in
            completion(Result.success(PigeonGetTripsResponse(from: status, trips: trips)))
        }
    }

    func getTripsOrderByDateDesc(synchronizationType: PigeonSynchronizationType, transportationModes: [PigeonTransportationMode], completion: @escaping (Result<PigeonGetTripsResponse, any Error>) -> Void) {
        DriveKitDriverData.shared.getTripsOrderByDateDesc(
            withTransportationModes: transportationModes.map({ TransportationMode(from: $0) }),
            type: SynchronizationType(from: synchronizationType)
        ) { status, trips in
            completion(Result.success(PigeonGetTripsResponse(from: status, trips: trips)))
        }
    }

    func getTrip(itinId: String, completion: @escaping (Result<PigeonGetTripResponse, any Error>) -> Void) {
        DriveKitDriverData.shared.getTrip(
            itinId: itinId
        ) { status, trip  in
            completion(Result.success(PigeonGetTripResponse(from: status, trip: trip)))
        }
    }

    func getRoute(itinId: String, completion: @escaping (Result<PigeonGetRouteResponse, any Error>) -> Void) {
        DriveKitDriverData.shared.getRoute(itinId: itinId) { route in
            let pigeonRouteResponse = PigeonGetRouteResponse(
                from: route)
            completion(Result.success(pigeonRouteResponse))
        }
    }

    func deleteTrip(itinId: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        DriveKitDriverData.shared.deleteTrip(itinId: itinId) { status in
            completion(Result.success(status))
        }
    }
    
    func updateDriverPassengerMode(itinId: String, mode: PigeonDriverPassengerMode, comment: String, completion: @escaping (Result<PigeonUpdateDriverPassengerModeStatus, any Error>) -> Void) {
        DriveKitDriverData.shared.updateDriverPassengerMode(itinId: itinId, mode: DKDriverPassengerMode.passenger, comment: comment) {
            status in
            completion(Result.success(PigeonUpdateDriverPassengerModeStatus(from: status)))
        }
    }
}
