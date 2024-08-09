// coverage:ignore-file
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// An implementation of [DrivekitDriverDataPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultDrivekitDriverData extends DrivekitDriverDataPlatform {
  @override
  Future<String> getPlatformName() {
    throw UnimplementedError('getPlatformName() has not been implemented.');
  }

  @override
  Future<bool> deleteTrip(String itinId) {
    throw UnimplementedError('deleteTrip() has not been implemented.');
  }

  @override
  Future<GetTripsResponse> getTripsOrderByDateAsc() {
    throw UnimplementedError(
      'getTripsOrderByDateAsc() has not been implemented.',
    );
  }
}
