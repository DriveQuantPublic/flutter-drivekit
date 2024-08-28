import 'package:flutter_drivekit_driver_data_platform_interface/src/default_drivekit_driver_data.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_core_platform_interface/src/model.dart';
export 'package:flutter_drivekit_driver_data_platform_interface/src/model.dart';

/// The interface that implementations of drivekit_driver_data must
/// implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DriveKitDriverData`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [DriveKitDriverDataPlatform]
/// methods.
abstract class DriveKitDriverDataPlatform extends PlatformInterface {
  /// Constructs a DriveKitDriverDataPlatform.
  DriveKitDriverDataPlatform() : super(token: _token);

  static final Object _token = Object();

  static DriveKitDriverDataPlatform _instance = DefaultDriveKitDriverData();

  /// The default instance of [DriveKitDriverDataPlatform] to use.
  ///
  /// Defaults to [DefaultDriveKitDriverData].
  static DriveKitDriverDataPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DriveKitDriverDataPlatform] when they register
  /// themselves.
  static set instance(DriveKitDriverDataPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String> getPlatformName();

  /// Get trips ordered by date Ascending
  Future<GetTripsResponse?> getTripsOrderByDateAsc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  });

  /// Get trips ordered by date Descending
  Future<GetTripsResponse?> getTripsOrderByDateDesc({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const <TransportationMode>[],
  });

  /// Get trip by identider
  Future<GetTripResponse?> getTrip(String itinId);

  /// Get route by trip identifier
  Future<GetRouteResponse?> getRoute(String itinId);

  /// Delete a trip
  Future<bool> deleteTrip(String itinId);
}
