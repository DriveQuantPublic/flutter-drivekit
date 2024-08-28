// coverage:ignore-file
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// An implementation of [DriveKitDriverDataPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDriveKitDriverData extends DriveKitDriverDataPlatform {
  @override
  Future<String> getPlatformName() {
    throw UnimplementedError('getPlatformName() has not been implemented.');
  }

  @override
  Future<GetTripsResponse?> getTripsOrderByDateAsc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  }) {
    throw UnimplementedError(
      'getTripsOrderByDateAsc() has not been implemented.',
    );
  }

  @override
  Future<GetTripsResponse?> getTripsOrderByDateDesc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  }) {
    throw UnimplementedError(
      'getTripsOrderByDateDesc() has not been implemented.',
    );
  }

  @override
  Future<GetTripResponse?> getTrip(String itinId) {
    throw UnimplementedError(
      'getTrip() has not been implemented.',
    );
  }

  @override
  Future<GetRouteResponse?> getRoute(String itinId) {
    throw UnimplementedError(
      'getRoute() has not been implemented.',
    );
  }

  @override
  Future<bool> deleteTrip(String itinId) {
    throw UnimplementedError('deleteTrip() has not been implemented.');
  }
}
