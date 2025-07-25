import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_driver_data_ios/src/adapter.dart';
import 'package:flutter_drivekit_driver_data_ios/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_ios/src/model_adapter.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// The iOS implementation of [DriveKitDriverDataPlatform].
class DriveKitDriverDataIOS extends DriveKitDriverDataPlatform {
  /// Creates a new instance of [DriveKitDriverDataIOS].
  /// The optional [iosDriverDataApi] parameter is used for
  /// dependency injection in tests.
  DriveKitDriverDataIOS({IOSDriverDataApi? iosDriverDataApi})
      : iosDriverDataApi = iosDriverDataApi ?? IOSDriverDataApi();

  /// Registers this class as the default instance of
  /// [DriveKitDriverDataPlatform]
  static void registerWith() {
    DriveKitDriverDataPlatform.instance = DriveKitDriverDataIOS();
  }

  /// The instance of [IOSDriverDataApi], a class that provides access to the
  /// native methods via a method channel generated by pigeon.
  @visibleForTesting
  final IOSDriverDataApi iosDriverDataApi;

  @override
  Future<GetTripsResponse?> getTripsOrderByDateAsc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  }) async {
    final trips = await iosDriverDataApi.getTripsOrderByDateAsc(
      synchronizationType: synchronizationType.toPigeonImplementation(),
      transportationModes: transportationModes
          .map((TransportationMode e) => e.toPigeonImplementation())
          .toList(),
    );
    return trips.toModelImplementation();
  }

  @override
  Future<GetTripsResponse?> getTripsOrderByDateDesc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  }) async {
    final trips = await iosDriverDataApi.getTripsOrderByDateDesc(
      synchronizationType: synchronizationType.toPigeonImplementation(),
      transportationModes: transportationModes
          .map((TransportationMode e) => e.toPigeonImplementation())
          .toList(),
    );
    return trips.toModelImplementation();
  }

  @override
  Future<GetTripResponse?> getTrip(String itinId) async {
    final trip = await iosDriverDataApi.getTrip(itinId);
    return trip.toModelImplementation();
  }

  @override
  Future<GetRouteResponse?> getRoute(String itinId) async {
    final route = await iosDriverDataApi.getRoute(itinId);
    return route.toModelImplementation();
  }

  @override
  Future<bool> deleteTrip(String itinId) => iosDriverDataApi.deleteTrip(itinId);

  @override
  Future<UpdateDriverPassengerModeStatus> updateDriverPassengerMode(
    String itinId,
    DriverPassengerMode mode,
    String comment,
  ) async {
    final status = await iosDriverDataApi.updateDriverPassengerMode(
      itinId,
      mode.toPigeonImplementation(),
      comment,
    );
    return status.toModelImplementation();
  }
}
