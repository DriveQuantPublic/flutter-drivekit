import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';

/// Vehicle class
class Vehicle {
  /// Creates a Vehicle instance
  const Vehicle({
    this.carTypeIndex = 1,
    this.carEngineIndex = 1,
    this.carPower = 150,
    this.carMass = 1400,
    this.carGearboxIndex = 2,
    this.carConsumption = 4.5,
    this.carAutoGearboxNumber = 0,
    this.engineDisplacement = 1200,
    this.carPassengers = 1,
    this.dqIndex,
    this.sra,
    this.frontTireSize,
    this.rearTireSize,
    this.length = 4.5,
    this.width = 1.8,
    this.height = 1.45,
    this.engineCylinderNb = 4,
    this.driveWheels = 0,
  });

  /// The car type index
  /// default value is 1
  final int carTypeIndex;

  /// The car engine index
  /// default value is 1
  final int carEngineIndex;

  /// The car power
  /// default value is 150
  final int carPower;

  /// The car mass
  /// default value is 1400
  final int carMass;

  /// The car gearbox index
  /// default value is 2
  final int carGearboxIndex;

  /// The car consumption
  /// default value is 4.5
  final double carConsumption;

  /// The car auto gearbox number
  /// default value is 0
  final int carAutoGearboxNumber;

  /// The engine displacement
  /// default value is 1200
  final int engineDisplacement;

  /// The car passengers
  /// default value is 1
  final int carPassengers;

  /// The dq index
  /// default value is null
  final String? dqIndex;

  /// The sra
  /// default value is null
  final String? sra;

  /// The front tire size
  /// default value is null
  final String? frontTireSize;

  /// The rear tire size
  /// default value is null
  final String? rearTireSize;

  /// The length
  /// default value is 4.5
  final double length;

  /// The width
  /// default value is 1.8
  final double width;

  /// The height
  /// default value is 1.45
  final double height;

  /// The engine cylinder number
  /// default value is 4
  final int engineCylinderNb;

  /// The drive wheels
  /// default value is 0
  final int driveWheels;
}

/// Provides useful information and event about trips analyzed by DriveKit.
/// Can be registered on the DriveKit SDK using the addTripListener method.
class TripListener {
  /// Creates a TripListener instance
  const TripListener({
    this.tripStarted,
    this.tripPoint,
    this.tripSavedForRepost,
    this.tripFinished,
    this.tripCancelled,
    this.potentialTripStart,
    this.beaconDetected,
    this.significantLocationChangeDetected,
    this.sdkStateChanged,
    this.crashDetected,
    this.crashFeedbackSent,
  });

  /// Called each time a trip is started.
  /// [StartMode] indicates which event starts the trip.
  final void Function(StartMode startMode)? tripStarted;

  /// Called when a trip is started and confirmed,
  /// for each GPS point recorded by the SDK.
  final void Function(TripPoint tripPoint)? tripPoint;

  /// Called if at the end of the trip, the trip can be sent to DriveQuant's
  /// server for the analysis.
  ///
  /// The trip is saved locally on the SDK and will be sent later.
  final void Function()? tripSavedForRepost;

  /// Called when a trip has been recorded by the SDK and sent to
  /// DriveQuant's server to be analyzed.
  final void Function(TripResponseStatus response)? tripFinished;

  /// Called when a trip is cancelled.
  /// [CancelTrip] indicates which event cancels the trip.
  final void Function(CancelTrip cancelTrip)? tripCancelled;

  /// Called each time a potential trip is started.
  /// [StartMode] indicates which event starts the potential trip.
  final void Function(StartMode startMode)? potentialTripStart;

  /// Called when a beacon sets in the SDK is detected.
  final void Function()? beaconDetected;

  /// iOS only.
  ///
  /// Called when a user significant location change is detected.
  final void Function(Location location)? significantLocationChangeDetected;

  /// Called every time the state of the SDK changed
  /// with the new state as parameter.
  final void Function(State state)? sdkStateChanged;

  /// Called when a crash event is detected.
  /// Triggered if Crash Detection is enabled.
  final void Function(DKCrashInfo crashInfo)? crashDetected;

  /// Called when crash feedback is enabled and a confirmed crash is detected.
  /// Triggered if Crash Detection is enabled.
  final void Function(
    DKCrashInfo crashInfo,
    DKCrashFeedbackType feedbackType,
    DKCrashFeedbackSeverity severity,
  )? crashFeedbackSent;
}

/// Indicates how the trip is started.
enum StartMode {
  /// Automatic start when the SDK detects a change in user position
  gps,

  /// Automatic start due to the presence of a beacon
  beacon,

  /// Trip started manually by calling the method startTrip()
  manual,

  /// Automatic start when the SDK detects that you exit
  /// the zone where your vehicle may be parked
  geozone,

  /// Automatic start by detecting a connection to a vehicle's Bluetooth system
  bluetooth,

  /// Automatic start by detecting a connection to a unknown vehicle's
  /// Bluetooth system
  unknownBluetooth,

  /// Automatic start by detecting a bicycle activity
  bicycleActivity,

  /// Automatic start when the SDK detects that your smartphone has been
  /// connected to an Android Auto or Automotive OS system
  connectedCar;
}

/// CancelTrip indicates how the trip was cancelled.
enum CancelTrip {
  /// Trip cancelled by calling the method cancelTrip
  user,

  /// Trip cancelled because speed was too high (train, airplane)
  highspeed,

  /// Trip cancelled because speed was too slow to be in a vehicle
  noSpeed,

  /// Trip cancelled because the beacon was not detected while it was [required](https://docs.drivequant.com/trip-analysis/ios/beacon-usage#beacon-required)
  noBeacon,

  /// Trip cancelled because DriveKit was not configured
  missingConfiguration,

  /// Trip cancelled because no GPS data was recorded
  noGpsData,

  /// Trip cancelled because SDK configuration has been [reset](https://docs.drivequant.com/get-started-drivekit/ios/advanced-configurations#reset-the-module)
  reset,

  /// Trip cancelled because the beacon is near the smartphone but
  /// there is no movement (zero or low speed)
  beaconNoSpeed,

  /// Trip cancelled because the Bluetooth device is missing
  noBluetoothDevice,

  /// Trip cancelled because the Bluetooth device is connected to the
  /// smartphone but there was no movement (zero or low speed)
  bluetoothDeviceNoSpeed;
}

/// Contains data for each location registered by the SDK.
class TripPoint {
  /// Creates a TripPoint instance
  const TripPoint({
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.accuracy,
    required this.elevation,
    required this.distance,
    required this.heading,
    required this.duration,
  });

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  /// Speed in km/h
  final double speed;

  /// Accuracy of the GPS data in meter
  final double accuracy;

  /// Elevation in meter
  final double elevation;

  /// Distance since the beginning of the trip in meter
  final double distance;

  /// Heading
  final double heading;

  /// Duration since the beginning of the trip in second
  final double duration;
}

/// Indicates the state of the DriveKit SDK.
enum State {
  /// No trip is running.
  inactive,

  /// The auto start mode detects a movement of the user and checks
  /// if it's a trip in vehicle.
  starting,

  /// The trip has been confirmed by the speed of the movement.
  running,

  /// The SDK is in this state when a potential trip end is detected. If the
  /// trip continues, the SDK goes back in RUNNING state.
  /// The duration of the stopping state can be configured.
  stopping,

  /// The trip is finished and is being sent to DriveQuant's server.
  /// When the SDK has the response from the server,
  /// the state becomes INACTIVE waiting for the next trip.
  sending;
}

/// Contains the information about a crash.
class DKCrashInfo {
  /// Creates a DKCrashInfo instance
  const DKCrashInfo({
    required this.probability,
    required this.latitude,
    required this.longitude,
    required this.velocity,
    this.crashId,
    this.date,
    this.status,
  });

  /// The crash ID
  final String? crashId;

  /// The date of the crash
  final String? date;

  /// The status of the crash
  final CrashStatus? status;

  /// The probability of the crash
  final int probability;

  /// The latitude of the crash
  final double latitude;

  /// The longitude of the crash
  final double longitude;

  /// The velocity of the crash in km/h
  final double velocity;
}

/// Indicates the status of a crash feedback.
enum DKCrashFeedbackType {
  /// The crash didn't happen
  noCrash,

  /// The crash is confirmed
  crashConfirmed,

  /// The crash is not confirmed
  noFeedback;
}

/// Indicates the severity of a crash feedback.
enum DKCrashFeedbackSeverity {
  /// no severity
  none,

  /// The crash is minor
  minor,

  /// The crash is critical
  critical;
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

/// Location class
class Location {
  /// Creates a Location instance
  Location({required this.longitude, required this.latitude});

  /// The location longitude
  final double longitude;

  /// The location latitude
  final double latitude;
}

/// TripResponseStatus class
class TripResponseStatus {
  /// creates a TripResponseStatus instance
  TripResponseStatus({
    required this.status,
    required this.itinId,
    required this.hasSafetyAndEcoDrivingScore,
    required this.info,
    required this.error,
    required this.trip,
  });

  /// Trip status: valid or not
  final TripResponseStatusType status;

  /// The id of the trip if it is valid, otherwise null.
  final String? itinId;

  /// If false, it means that the trip is valid but too short to be analyzed.
  final bool hasSafetyAndEcoDrivingScore;

  /// List of information codes returned when Trip is valid.
  /// These are not errors
  final List<TripResponseInfo> info;

  /// The error that occurred when Trip is not valid.
  final TripResponseError? error;

  /// The trip related to the response status. Null in case of non valid trip.
  final Trip? trip;
}

/// TripResponseStatusType enum
enum TripResponseStatusType {
  /// The Trip is valid
  tripValid,

  /// The trip is not valid
  tripError,
}

/// TripResponseInfo enum
enum TripResponseInfo {
  /// The engine speed is not available. The trip analysis is performed
  /// with an estimated value of the engine speed.
  engineSpeedNotAvailable,

  /// The engine speed is always at 0 rpm while the vehicle is moving.
  /// The trip analysis is performed but with an estimated value of the
  /// engine speed.
  engineSpeedIsNull,

  /// The vehicle characteristics are not set or some values are missing.
  /// The trip analysis is performed with generic vehicle model parameters.
  noVehicleCharacteristics,

  /// More than 25% of data loss is detected during the trip.
  dataLoss,

  /// The trip was analysed but the distance is not sufficient to provide
  /// an accurate energy analysis.
  distanceTooShort,

  /// The vehicle characteristics are not in the range of available values.
  /// See vehicle characteristics for range limits.
  invalidVehicleCharacteristics,

  /// No vehicle found for the vehicleId provided to the API request.
  invalidVehicleId,
}

/// TripResponseError enum
enum TripResponseError {
  /// The account block is not set in the trip data.
  noAccountSet,

  /// The route block is not available in the trip data.
  noRouteObjectFound,

  /// Error when parsing the route block
  invalidRouteDefinition,

  /// The vehicle or GPS velocity is not available
  noVelocityData,

  /// The input variables have an invalid acquisition period.
  invalidSamplingPeriod,

  /// Unknown account value. Unauthorized access.
  invalidCustomerId,

  /// The field vehicleDate or gpsDate is not available.
  noDateFound,

  /// The trip could not be analyzed because you exceeded your daily
  /// request quota.
  maxDailyRequestNumberReached,

  /// The service failed to process your data. There is a need to diagnose
  /// your data to determine the origin of this problem.
  dataError,

  /// The route vectors are not of the same size, the service cannot
  /// perform the analysis
  invalidRouteVectors,

  /// The beacon has not been detected and it is required to validate
  /// the trip analysis.
  missingBeacon,

  /// A beacon was detected during the trip but it does not have the
  /// correct identifiers
  invalidBeacon,

  /// The duplicate trip feature is enabled and the trip has already
  /// been analysed
  duplicateTrip,

  /// The number of GPS points is too low
  insufficientGpsData,

  /// The driver is disabled, the service cannot perform the analysis
  userDisabled,

  /// The user identifier is not valid.
  invalidUser,

  /// The dates are inconstistent, the service cannot perform the analysis
  invalidGpsData,

  /// The trip has already been analysed and considered as invalid
  invalidTrip,

  /// The maximum number of user account reached for the customer
  accountLimitReached,

  /// The error is not yet handled by the DriveKit SDK.
  unknownError,
}

/// CurrentTripInfo class
class CurrentTripInfo {
  /// Creates a CurrentTripInfo instance
  CurrentTripInfo({
    required this.localTripId,
    required this.date,
    required this.startMode,
  });

  /// The localTripId
  final String localTripId;

  /// The trip recording start date
  final String date;

  /// The StartMode that triggers the trip recording
  final StartMode startMode;
}

/// LastTripLocation class
class LastTripLocation {
  /// Creates a LastTripLocation instance
  LastTripLocation({
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.accuracyMeter,
    required this.accuracyLevel,
  });

  /// The arrival date
  final String date;

  /// The latitude of the end of the trip.
  final double latitude;

  /// The longitude of the end of the trip.
  final double longitude;

  /// GPS data accuracy value in meters.
  final double accuracyMeter;

  /// GPS data accuracy level.
  final AccuracyLevel accuracyLevel;
}

/// A GPS accuracy indicator with a 3-level scale.
enum AccuracyLevel {
  /// The GPS accuracy is strictly below 10 meters.
  good,

  /// The GPS accuracy is between 10 and 30 meters.
  fair,

  /// The GPS accuracy is strictly above 30 meters.
  poor,
}
