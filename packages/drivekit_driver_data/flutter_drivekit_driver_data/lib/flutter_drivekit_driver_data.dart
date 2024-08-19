import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

DrivekitDriverDataPlatform get _platform => DrivekitDriverDataPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit DriverData SDK.
class DriveKitDriverData {
  const DriveKitDriverData._();

  /// unique instance of the DrivekitDriverData
  static DriveKitDriverData get instance => _instance;
  static const DriveKitDriverData _instance = DriveKitDriverData._();

  /// Returns the name of the current platform.
  Future<String> getPlatformName() => _platform.getPlatformName();

  /// Delete a trip
  Future<bool> deleteTrip(String itinId) => _platform.deleteTrip(itinId);

  /// Get trips ordered by date
  Future<GetTripsResponse?> getTripsOrderByDateAsc() =>
      _platform.getTripsOrderByDateAsc();
}
