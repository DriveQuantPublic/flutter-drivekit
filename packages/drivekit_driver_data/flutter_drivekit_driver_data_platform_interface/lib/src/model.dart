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
  noError,

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

/// Route class
class Route {
  /// Creates a Route instance
  const Route({
    required this.gpsDate,
    required this.gpsVelocity,
    required this.longitude,
    required this.latitude,
    required this.gpsElevation,
    required this.gpsAccuracy,
    required this.gpsHeading,
    required this.screenLocked,
    required this.activityValue,
    required this.roll,
    required this.pitch,
    required this.yaw,
    required this.gyroscopeNormVar,
  });

  /// The list of GPS dates
  final List<double> gpsDate;

  /// The list of GPS velocities
  final List<double> gpsVelocity;

  /// The list of longitudes
  final List<double> longitude;

  /// The list of latitudes
  final List<double> latitude;

  /// The list of GPS elevations
  final List<double> gpsElevation;

  /// The list of GPS accuracies
  final List<double> gpsAccuracy;

  /// The list of GPS headings
  final List<double> gpsHeading;

  /// The list of screen locked statuses
  final List<double> screenLocked;

  /// The list of activity values
  final List<double> activityValue;

  /// The list of roll values
  final List<int> roll;

  /// The list of pitch values
  final List<int> pitch;

  /// The list of yaw values
  final List<int> yaw;

  /// The list of gyroscope norm variances
  final List<int> gyroscopeNormVar;
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
