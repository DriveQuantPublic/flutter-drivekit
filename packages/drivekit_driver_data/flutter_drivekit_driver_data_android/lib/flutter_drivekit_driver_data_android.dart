import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_driver_data_android/src/adapter.dart';
import 'package:flutter_drivekit_driver_data_android/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_android/src/model_adapter.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// The Android implementation of [DrivekitDriverDataPlatform].
class DrivekitDriverDataAndroid extends DrivekitDriverDataPlatform {
  /// Creates a new instance of [DrivekitDriverDataAndroid].
  /// The optional [androidDriverDataApi] parameter is used for
  /// dependency injection in tests.
  DrivekitDriverDataAndroid({
    AndroidDriverDataApi? androidDriverDataApi,
  }) : androidDriverDataApi = androidDriverDataApi ?? AndroidDriverDataApi();

  /// Registers this class as the default instance of
  /// [DrivekitDriverDataPlatform]
  static void registerWith() {
    DrivekitDriverDataPlatform.instance = DrivekitDriverDataAndroid();
  }

  /// The instance of [AndroidDriverDataApi], a class that provides
  /// access to the native methods via a method channel generated by pigeon.
  @visibleForTesting
  final AndroidDriverDataApi androidDriverDataApi;

  @override
  Future<String> getPlatformName() => androidDriverDataApi.getPlatformName();

  @override
  Future<GetTripsResponse?> getTripsOrderByDateAsc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  }) async {
    final trips = await androidDriverDataApi.getTripsOrderByDateAsc(
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
    final trips = await androidDriverDataApi.getTripsOrderByDateDesc(
      synchronizationType: synchronizationType.toPigeonImplementation(),
      transportationModes: transportationModes
          .map((TransportationMode e) => e.toPigeonImplementation())
          .toList(),
    );
    return trips.toModelImplementation();
  }

  @override
  Future<GetTripResponse?> getTrip(String itinId) async {
    final trip = await androidDriverDataApi.getTrip(itinId);
    return trip.toModelImplementation();
  }

  @override
  Future<GetRouteResponse?> getRoute(String itinId) async {
    final route = await androidDriverDataApi.getRoute(itinId);
    return route.toModelImplementation();
  }

  @override
  Future<bool> deleteTrip(String itinId) =>
      androidDriverDataApi.deleteTrip(itinId);
}
