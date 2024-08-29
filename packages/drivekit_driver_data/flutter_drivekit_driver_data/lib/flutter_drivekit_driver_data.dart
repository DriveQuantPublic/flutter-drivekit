import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

export 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart'
    show
        Route,
        RouteSyncStatus,
        SynchronizationType,
        TransportationMode,
        Trip,
        TripSyncStatus;

DriveKitDriverDataPlatform get _platform => DriveKitDriverDataPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit DriverData SDK.
class DriveKitDriverData {
  const DriveKitDriverData._();

  /// unique instance of the DriveKitDriverData
  static DriveKitDriverData get instance => _instance;
  static const DriveKitDriverData _instance = DriveKitDriverData._();

  /// Get trips ordered by date ascending
  Future<GetTripsResponse?> getTripsOrderByDateAsc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const [
      TransportationMode.unknown,
      TransportationMode.car,
      TransportationMode.moto,
      TransportationMode.truck,
    ],
  }) =>
      _platform.getTripsOrderByDateAsc(
        synchronizationType: synchronizationType,
        transportationModes: transportationModes,
      );

  /// Get trips ordered by date descending
  Future<GetTripsResponse?> getTripsOrderByDateDesc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const [
      TransportationMode.unknown,
      TransportationMode.car,
      TransportationMode.moto,
      TransportationMode.truck,
    ],
  }) =>
      _platform.getTripsOrderByDateDesc(
        synchronizationType: synchronizationType,
        transportationModes: transportationModes,
      );

  /// Get trip by identider
  Future<GetTripResponse?> getTrip(String itinId) => _platform.getTrip(itinId);

  /// Get route
  Future<GetRouteResponse?> getRoute(String itinId) =>
      _platform.getRoute(itinId);

  /// Delete a trip
  Future<bool> deleteTrip(String itinId) => _platform.deleteTrip(itinId);
}
