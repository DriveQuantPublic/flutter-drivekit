import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// the response returned when gettings trips
class GetTripsResponse {
  /// Creates a GetTripsResponse instance
  GetTripsResponse({required this.status, required this.trips});

  /// trip synchronization status
  final TripSyncStatus status;

  /// fetched trips
  final List<Trip> trips;
}

/// the response returned when gettings one trip
class GetTripResponse {
  /// Creates a GetTripResponse instance
  GetTripResponse({required this.status, required this.trip});

  /// trip synchronization status
  final TripSyncStatus status;

  /// fetched trip
  final Trip? trip;
}

/// Trip synchronization status enum
enum TripSyncStatus {
  /// Synchronization has been successfully performed
  success,

  /// SynchronizationType has been set to cache.
  cacheDataOnly,

  /// Synchronization has failed,
  /// only trips previously synchronized are returned
  failedToSyncTripsCacheOnly,

  /// Safety Events synchronization failed
  failedToSyncSafetyEvents,

  /// A synchronization is in progress, only trips previously
  /// synchronized are returned until the synchronization is finished
  syncAlreadyInProgress
}

/// CrashInfo class
class CrashInfo {
  /// Creates a CrashInfo instance
  const CrashInfo({
    required this.crashId,
    required this.date,
    required this.probability,
    required this.latitude,
    required this.longitude,
    required this.velocity,
    required this.crashStatus,
  });

  /// The crash ID
  final String crashId;

  /// The date
  final String date;

  /// The probability
  final int probability;

  /// The latitude
  final double latitude;

  /// The longitude
  final double longitude;

  /// The velocity
  final double velocity;

  /// The crash status
  final CrashStatus crashStatus;
}

/// CrashStatus enum
enum CrashStatus {
  /// The crash is unconfirmed
  unconfirmed,

  /// The crash is confirmed
  confirmed,
}

/// Trip Synchronization Type
enum SynchronizationType {
  /// synchronize by calling the DriveQuant servers
  defaultSync,

  /// retrieve already synchronized items in the local database
  cache
}

/// Trip Transportation mode
enum TransportationMode {
  /// Unknown
  unknown,

  /// Car Trip
  car,

  /// Motorcycle Trip
  moto,

  /// Heavy-duty vehicle Trip
  truck,

  /// Bus Trip
  bus,

  /// Rail trip
  train,

  /// Boat trip
  boat,

  /// Bike trip
  bike,

  /// Plane Trip
  flight,

  /// Ski Trip
  skiing,

  /// On foot Trip
  onFoot,

  /// Idle
  idle,

  /// Other
  other
}

/// Route Class
class Route {
  /// Creates a Route instance
  Route({
    required this.callIndex,
    required this.callTime,
    required this.itinId,
    required this.latitude,
    required this.longitude,
    required this.screenLockedIndex,
    required this.screenLockedTime,
    required this.speedingIndex,
    required this.speedingTime,
  });

  /// call indexes array
  final List<int?>? callIndex;

  /// call time array
  final List<int?>? callTime;

  /// trip identifier
  final String? itinId;

  /// latitude array
  final List<double?>? latitude;

  /// longitude array
  final List<double?>? longitude;

  /// screen locked indexes array
  final List<int?>? screenLockedIndex;

  /// screen locked time array
  final List<int?>? screenLockedTime;

  /// speeding indexes array
  final List<int?>? speedingIndex;

  /// speeding time array
  final List<int?>? speedingTime;
}

/// the response returned when gettings a Route
class GetRouteResponse {
  /// Creates a GetRouteResponse instance
  GetRouteResponse({required this.status, required this.route});

  /// route synchronization status
  final RouteSyncStatus status;

  /// fetched route
  final Route? route;
}

/// Route synchronization status enum
enum RouteSyncStatus {
  /// Synchronization has been successfully performed
  success,

  /// Synchronization failed
  failedToRetrieveRoute,

  /// Wrong trip identifier
  wrongItinId,
}
