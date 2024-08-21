/// the response returned when gettings trips
class GetTripsResponse {
  /// Creates a GetTripsResponse instance
  GetTripsResponse({required this.status, required this.trips});

  /// trip synchronization status
  final TripSyncStatus status;

  /// fetched trips
  final List<Trip> trips;
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

/// Trip class
class Trip {
  /// Creates a Trip instance
  Trip({
    required this.itinId,
    required this.startDate,
    required this.endDate,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureAddress,
    required this.arrivalAddress,
    required this.vehicleId,
    required this.comments,
    required this.tripStatistics,
    required this.ecoDriving,
    required this.fuelEstimation,
    required this.safety,
    required this.advancedEcoDriving,
    required this.advancedFuelEstimation,
    required this.advancedSafety,
    required this.pollutants,
    required this.tireWear,
    required this.brakeWear,
    required this.driverDistraction,
    required this.itineraryData,
    required this.logbook,
    required this.safetyEvents,
    required this.speedingStatistics,
    required this.energyEstimation,
    required this.advancedEnergyEstimation,
    required this.metaData,
    required this.transportationMode,
    required this.unscored,
    required this.calls,
    required this.speedLimitContexts,
  });

  /// The itinerary ID
  final String? itinId;

  /// The start date
  final String? startDate;

  /// The end date
  final String? endDate;

  /// The departure city
  final String? departureCity;

  /// The arrival city
  final String? arrivalCity;

  /// The departure address
  final String? departureAddress;

  /// The arrival address
  final String? arrivalAddress;

  /// The itinerary ID
  final String? vehicleId;

  /// The list of comments
  final List<Comment> comments;

  /// The itinerary statistics
  final TripStatistics? tripStatistics;

  /// The eco driving information
  final EcoDriving? ecoDriving;

  /// The fuel estimation information
  final FuelEstimation? fuelEstimation;

  /// The safety information
  final Safety? safety;

  /// The advanced eco driving information
  final AdvancedEcoDriving? advancedEcoDriving;

  /// The advanced fuel estimation information
  final AdvancedFuelEstimation? advancedFuelEstimation;

  /// The advanced safety information
  final AdvancedSafety? advancedSafety;

  /// The pollutants information
  final Pollutants? pollutants;

  /// The tire wear information
  final TireWear? tireWear;

  /// The brake wear information
  final BrakeWear? brakeWear;

  /// The driver distraction information
  final DriverDistraction? driverDistraction;

  /// The itinerary data
  final ItineraryData? itineraryData;

  /// The logbook information
  final Logbook? logbook;

  /// The list of safety events
  final List<SafetyEvent>? safetyEvents;

  /// The speeding statistics
  final SpeedingStatistics? speedingStatistics;

  /// The energy estimation information
  final EnergyEstimation? energyEstimation;

  /// The list of advanced energy estimations
  final List<AdvancedEnergyEstimation>? advancedEnergyEstimation;

  /// The metadata
  final Map<String, String>? metaData;

  /// The transportation mode
  final int transportationMode;

  /// The trip is scored or not
  final bool unscored;

  /// The list of calls
  final List<Call>? calls;

  /// The list of speed limit contexts
  final List<SpeedLimitContext>? speedLimitContexts;
}

/// TripAdviceData class
class TripAdviceData {
  /// Creates a TripAdviceData instance
  TripAdviceData({
    required this.id,
    required this.title,
    required this.message,
    required this.messageId,
    required this.theme,
    required this.adviceEvaluation,
  });

  /// The advice identifier
  final String? id;

  /// The advice title
  final String? title;

  /// The advice message
  final String? message;

  /// The advice message identifier
  final String? messageId;

  /// The advice theme
  final String? theme;

  /// The advice evaluation
  final TripAdviceEvaluation? adviceEvaluation;
}

/// TripAdviceEvaluation class
class TripAdviceEvaluation {
  /// Creates a TripAdviceEvaluation instance
  TripAdviceEvaluation({
    required this.evaluation,
    required this.feedback,
    required this.comment,
  });

  /// The advice evaluation
  final int evaluation;

  /// The advice evaluation feedback
  final int feedback;

  /// The advice evaluation comment
  final String? comment;
}

/// ManeuverData class
class ManeuverData {
  /// Creates a ManeuverData instance
  ManeuverData({
    required this.nbStraightReverseDrivings,
    required this.nbCurveReverseDrivings,
    required this.nbTurns,
    required this.nbHillStarts,
    required this.nbRoundAbouts,
    required this.nbEmergencyStops,
    required this.nbAngledParkings,
    required this.nbParallelParkings,
    required this.nbBayParkings,
  });

  /// The number of straight reverse drivings
  final int nbStraightReverseDrivings;

  /// The number of curve reverse drivings
  final int nbCurveReverseDrivings;

  /// The number of turns
  final int nbTurns;

  /// The number of hill starts
  final int nbHillStarts;

  /// The number of round abouts
  final int nbRoundAbouts;

  /// The number of emergency stops
  final int nbEmergencyStops;

  /// The number of angled parkings
  final int nbAngledParkings;

  /// The number of parallel parkings
  final int nbParallelParkings;

  /// The number of bay parkings
  final int nbBayParkings;
}

/// EvaluationData class
class EvaluationData {
  /// Creates a EvaluationData instance
  EvaluationData({required this.comment, required this.evaluation});

  /// The evaluation comment
  final String? comment;

  /// The evaluation
  final int evaluation;
}

/// DeclaredTransportationMode class
class DeclaredTransportationMode {
  /// Creates an DeclaredTransportationMode instance
  DeclaredTransportationMode({
    required this.transportationMode,
    required this.comment,
    required this.passenger,
  });

  /// The declared transportation mode
  final int transportationMode;

  /// The declared transportation mode comment
  final String? comment;

  /// The declared seat: passenger or driver
  final bool? passenger;
}

/// AdvancedEcoDriving class
class AdvancedEcoDriving {
  /// Creates an AdvancedEcoDriving instance
  const AdvancedEcoDriving({
    required this.ecoDrivingContext,
  });

  /// The list of eco driving contexts
  final List<EcoDrivingContext> ecoDrivingContext;
}

/// AdvancedFuelEstimation class
class AdvancedFuelEstimation {
  /// Creates an AdvancedFuelEstimation instance
  const AdvancedFuelEstimation({
    required this.fuelEstimationContext,
  });

  /// The list of fuel estimation contexts
  final List<FuelEstimationContext> fuelEstimationContext;
}

/// AdvancedSafety class
class AdvancedSafety {
  /// Creates an AdvancedSafety instance
  const AdvancedSafety({
    required this.safetyContext,
  });

  /// The list of safety contexts
  final List<SafetyContext> safetyContext;
}

/// BeaconData class
class BeaconData {
  /// Creates a BeaconData instance
  const BeaconData({
    required this.proximityUuid,
    required this.major,
    required this.minor,
  });

  /// The proximity UUID
  final String proximityUuid;

  /// The major value
  final int major;

  /// The minor value
  final int minor;
}

/// BluetoothData class
class BluetoothData {
  /// Creates a BluetoothData instance
  const BluetoothData({
    required this.name,
    required this.macAddress,
  });

  /// The name of the Bluetooth device
  final String name;

  /// The MAC address of the Bluetooth device
  final String macAddress;
}

/// BluetoothDevicesList class
class BluetoothDevicesList {
  /// Creates a BluetoothDevicesList instance
  const BluetoothDevicesList({
    required this.bluetoothDevices,
  });

  /// The list of Bluetooth devices
  final List<BluetoothData> bluetoothDevices;
}

/// BrakeWear class
class BrakeWear {
  /// Creates a BrakeWear instance
  const BrakeWear({
    required this.frontBrakeAutonomy,
    required this.frontBrakeDistance,
    required this.frontBrakePadWear,
    required this.frontBrakeTotalWear,
    required this.frontBrakeWearRate,
    required this.rearBrakeAutonomy,
    required this.rearBrakeDistance,
    required this.rearBrakePadWear,
    required this.rearBrakeTotalWear,
    required this.rearBrakeWearRate,
  });

  /// The front brake autonomy
  final int frontBrakeAutonomy;

  /// The front brake distance
  final int frontBrakeDistance;

  /// The front brake pad wear
  final int frontBrakePadWear;

  /// The front brake total wear
  final int frontBrakeTotalWear;

  /// The front brake wear rate
  final int frontBrakeWearRate;

  /// The rear brake autonomy
  final int rearBrakeAutonomy;

  /// The rear brake distance
  final int rearBrakeDistance;

  /// The rear brake pad wear
  final int rearBrakePadWear;

  /// The rear brake total wear
  final int rearBrakeTotalWear;

  /// The rear brake wear rate
  final int rearBrakeWearRate;
}

/// Call class
class Call {
  /// Creates a Call instance
  const Call({
    required this.id,
    required this.start,
    required this.end,
    required this.durationS,
    required this.duration,
    required this.distanceM,
    required this.distance,
    required this.status,
    required this.audioSystem,
    required this.bluetoothClass,
    required this.forbidden,
    this.audioInput,
    this.audioOutput,
    this.audioName,
  });

  /// The ID
  final int id;

  /// The start time
  final double start;

  /// The end time
  final double end;

  /// The duration in seconds
  final int durationS;

  /// The duration
  final int duration;

  /// The distance in meters
  final int distanceM;

  /// The distance
  final int distance;

  /// The status
  final String status;

  /// The audio system
  final String audioSystem;

  /// The audio input
  final String? audioInput;

  /// The audio output
  final String? audioOutput;

  /// The audio name
  final String? audioName;

  /// The Bluetooth class
  final int bluetoothClass;

  /// The forbidden status
  final bool forbidden;
}

/// CallEvent class
class CallEvent {
  /// Creates a CallEvent instance
  const CallEvent({
    required this.time,
    required this.latitude,
    required this.longitude,
    required this.velocity,
    required this.heading,
    required this.elevation,
    required this.distance,
    required this.type,
    required this.duration,
    required this.audioSystem,
    required this.callType,
    required this.index,
    required this.forbidden,
  });

  /// The time
  final double time;

  /// The latitude
  final double latitude;

  /// The longitude
  final double longitude;

  /// The velocity
  final double velocity;

  /// The heading
  final double heading;

  /// The elevation
  final double elevation;

  /// The distance
  final double distance;

  /// The type
  final int type;

  /// The duration
  final int duration;

  /// The audio system
  final String audioSystem;

  /// The call type
  final String callType;

  /// The index
  final int index;

  /// The forbidden status
  final bool forbidden;
}

/// Comment class
class Comment {
  /// Creates a Comment instance
  const Comment({
    required this.errorCode,
    required this.comment,
  });

  /// The error code
  final int errorCode;

  /// The comment
  final String comment;
}

/// AdvancedEnergyEstimation class
class AdvancedEnergyEstimation {
  /// Creates an AdvancedEnergyEstimation instance
  const AdvancedEnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
    required this.duration,
    required this.distance,
    required this.contextId,
  });

  /// The energy
  final double energy;

  /// The energy consumption
  final double energyConsumption;

  /// The optimized energy
  final double energyOpti;

  /// The optimized energy consumption
  final double energyOptiConsumption;

  /// The duration
  final double duration;

  /// The distance
  final double distance;

  /// The context ID
  final int contextId;
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

/// EnergyEstimation class
class EnergyEstimation {
  /// Creates an EnergyEstimation instance
  const EnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
  });

  /// The energy
  final double energy;

  /// The energy consumption
  final double energyConsumption;

  /// The optimized energy
  final double energyOpti;

  /// The optimized energy consumption
  final double energyOptiConsumption;
}

/// TripStatistics class
class TripStatistics {
  /// Creates an TripStatistics instance
  const TripStatistics({
    required this.tripDuration,
    required this.drivingDuration,
    required this.idlingDuration,
    required this.drivingPercentage,
    required this.idlingPercentage,
    required this.distance,
    required this.speedMean,
    required this.subdispNb,
    required this.meteo,
    required this.day,
    required this.weekDay,
  });

  /// The trip duration
  final double tripDuration;

  /// The driving duration
  final double drivingDuration;

  /// The idling duration
  final double idlingDuration;

  /// The driving percentage
  final double drivingPercentage;

  /// The idling percentage
  final double idlingPercentage;

  /// The distance
  final double distance;

  /// The mean speed
  final double speedMean;

  /// The number of subdispositions
  final int subdispNb;

  /// The meteo
  final int meteo;

  /// The day status
  final bool day;

  /// The week day status
  final bool weekDay;
}

/// EcoDriving class
class EcoDriving {
  /// Creates an EcoDriving instance
  const EcoDriving({
    required this.score,
    required this.scoreAccel,
    required this.scoreMain,
    required this.scoreDecel,
    required this.stdDevAccel,
    required this.stdDevMain,
    required this.stdDevDecel,
    required this.energyClass,
  });

  /// The score
  final double score;

  /// The acceleration score
  final double scoreAccel;

  /// The main score
  final double scoreMain;

  /// The deceleration score
  final double scoreDecel;

  /// The standard deviation of acceleration
  final double stdDevAccel;

  /// The standard deviation of main driving
  final double stdDevMain;

  /// The standard deviation of deceleration
  final double stdDevDecel;

  /// The energy class
  final int energyClass;
}

/// FuelEstimation class
class FuelEstimation {
  /// Creates a FuelEstimation instance
  const FuelEstimation({
    required this.co2Mass,
    required this.co2Emission,
    required this.fuelVolume,
    required this.fuelConsumption,
    required this.idleFuelVolume,
    required this.idleFuelPercentage,
    required this.idleFuelConsumption,
    required this.idleCo2Emission,
    required this.idleCo2Mass,
    required this.engineTempStatus,
    required this.coldFuelVolume,
  });

  /// The CO2 mass
  final double co2Mass;

  /// The CO2 emission
  final double co2Emission;

  /// The fuel volume
  final double fuelVolume;

  /// The fuel consumption
  final double fuelConsumption;

  /// The idle fuel volume
  final double idleFuelVolume;

  /// The idle fuel percentage
  final double idleFuelPercentage;

  /// The idle fuel consumption
  final double idleFuelConsumption;

  /// The idle CO2 emission
  final double idleCo2Emission;

  /// The idle CO2 mass
  final double idleCo2Mass;

  /// The engine temperature status
  final bool engineTempStatus;

  /// The cold fuel volume
  final double coldFuelVolume;
}

/// Safety class
class Safety {
  /// Creates a Safety instance
  const Safety({
    required this.nbAdh,
    required this.nbAccel,
    required this.nbDecel,
    required this.nbAdhCrit,
    required this.nbAccelCrit,
    required this.nbDecelCrit,
    required this.safetyScore,
  });

  /// The number of adhesion events
  final int nbAdh;

  /// The number of acceleration events
  final int nbAccel;

  /// The number of deceleration events
  final int nbDecel;

  /// The number of critical adhesion events
  final int nbAdhCrit;

  /// The number of critical acceleration events
  final int nbAccelCrit;

  /// The number of critical deceleration events
  final int nbDecelCrit;

  /// The safety score
  final double safetyScore;
}

/// Pollutants class
class Pollutants {
  /// Creates a Pollutants instance
  const Pollutants({
    required this.co,
    required this.hc,
    required this.nox,
    required this.soot,
  });

  /// The CO value
  final double co;

  /// The HC value
  final double hc;

  /// The NOx value
  final double nox;

  /// The soot value
  final double soot;
}

/// TireWear class
class TireWear {
  /// Creates a TireWear instance
  const TireWear({
    required this.frontTireAutonomy,
    required this.frontTireDistance,
    required this.frontTireTotalWear,
    required this.frontTireWear,
    required this.frontTireWearRate,
    required this.rearTireAutonomy,
    required this.rearTireDistance,
    required this.rearTireTotalWear,
    required this.rearTireWear,
    required this.rearTireWearRate,
  });

  /// The front tire autonomy
  final int frontTireAutonomy;

  /// The front tire distance
  final int frontTireDistance;

  /// The front tire total wear
  final int frontTireTotalWear;

  /// The front tire wear
  final int frontTireWear;

  /// The front tire wear rate
  final int frontTireWearRate;

  /// The rear tire autonomy
  final int rearTireAutonomy;

  /// The rear tire distance
  final int rearTireDistance;

  /// The rear tire total wear
  final int rearTireTotalWear;

  /// The rear tire wear
  final int rearTireWear;

  /// The rear tire wear rate
  final int rearTireWearRate;
}

/// DriverDistraction class
class DriverDistraction {
  /// Creates a DriverDistraction instance
  const DriverDistraction({
    required this.nbUnlock,
    required this.durationUnlock,
    required this.durationPercentUnlock,
    required this.distanceUnlock,
    required this.distancePercentUnlock,
    required this.score,
    this.scoreUnlock,
    this.scoreCall,
  });

  /// The number of unlocks
  final int nbUnlock;

  /// The duration of unlocks
  final double durationUnlock;

  /// The percentage duration of unlocks
  final double durationPercentUnlock;

  /// The distance of unlocks
  final double distanceUnlock;

  /// The percentage distance of unlocks
  final double distancePercentUnlock;

  /// The score
  final double score;

  /// The unlock score
  final double? scoreUnlock;

  /// The call score
  final double? scoreCall;
}

/// ItineraryData class
class ItineraryData {
  /// Creates an ItineraryData instance
  const ItineraryData({
    this.startDate,
    this.endDate,
    this.departureCity,
    this.arrivalCity,
    this.departureAddress,
    this.arrivalAddress,
  });

  /// The start date
  final String? startDate;

  /// The end date
  final String? endDate;

  /// The departure city
  final String? departureCity;

  /// The arrival city
  final String? arrivalCity;

  /// The departure address
  final String? departureAddress;

  /// The arrival address
  final String? arrivalAddress;
}

/// Logbook class
class Logbook {
  /// Creates a Logbook instance
  const Logbook({
    required this.status,
    this.updateDate,
  });

  /// The status
  final int status;

  /// The update date
  final String? updateDate;
}

/// SafetyEvent class
class SafetyEvent {
  /// Creates a SafetyEvent instance
  const SafetyEvent({
    required this.time,
    required this.longitude,
    required this.latitude,
    required this.velocity,
    required this.heading,
    required this.elevation,
    required this.distance,
    required this.type,
    required this.level,
    required this.value,
  });

  /// The time
  final double time;

  /// The longitude
  final double longitude;

  /// The latitude
  final double latitude;

  /// The velocity
  final double velocity;

  /// The heading
  final double heading;

  /// The elevation
  final double elevation;

  /// The distance
  final double distance;

  /// The type
  final int type;

  /// The level
  final int level;

  /// The value
  final double value;
}

/// SpeedingEvents class
class SpeedingEvents {
  /// Creates a SpeedingEvents instance
  const SpeedingEvents({
    required this.time,
    required this.longitude,
    required this.latitude,
    required this.type,
    required this.index,
  });

  /// The time
  final double time;

  /// The longitude
  final double longitude;

  /// The latitude
  final double latitude;

  /// The type
  final double type;

  /// The index
  final int index;
}

/// SpeedingStatistics class
class SpeedingStatistics {
  /// Creates a SpeedingStatistics instance
  const SpeedingStatistics({
    required this.distance,
    required this.duration,
    required this.speedingDistance,
    required this.speedingDuration,
    required this.score,
  });

  /// The distance
  final int distance;

  /// The duration
  final int duration;

  /// The speeding distance
  final int speedingDistance;

  /// The speeding duration
  final int speedingDuration;

  /// The score
  final double score;
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

/// EcoDrivingContext class
class EcoDrivingContext {
  /// Creates an EcoDrivingContext instance
  const EcoDrivingContext({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.efficiencyScore,
    required this.scoreAccel,
    required this.scoreMain,
    required this.scoreDecel,
  });

  /// The context ID
  final int contextId;

  /// The distance
  final double distance;

  /// The duration
  final double duration;

  /// The efficiency score
  final double efficiencyScore;

  /// The acceleration score
  final double scoreAccel;

  /// The main score
  final double scoreMain;

  /// The deceleration score
  final double scoreDecel;
}

/// FuelEstimationContext class
class FuelEstimationContext {
  /// Creates a FuelEstimationContext instance
  const FuelEstimationContext({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.co2Mass,
    required this.co2Emission,
    required this.fuelVolume,
    required this.fuelConsumption,
  });

  /// The context ID
  final int contextId;

  /// The distance
  final double distance;

  /// The duration
  final double duration;

  /// The CO2 mass
  final double co2Mass;

  /// The CO2 emission
  final double co2Emission;

  /// The fuel volume
  final double fuelVolume;

  /// The fuel consumption
  final double fuelConsumption;
}

/// SafetyContext class
class SafetyContext {
  /// Creates a SafetyContext instance
  const SafetyContext({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.nbAdh,
    required this.nbAccel,
    required this.nbDecel,
    required this.nbAdhCrit,
    required this.nbAccelCrit,
    required this.nbDecelCrit,
    required this.safetyScore,
  });

  /// The context ID
  final int contextId;

  /// The distance
  final double distance;

  /// The duration
  final double duration;

  /// The number of adhesion events
  final int nbAdh;

  /// The number of acceleration events
  final int nbAccel;

  /// The number of deceleration events
  final int nbDecel;

  /// The number of critical adhesion events
  final int nbAdhCrit;

  /// The number of critical acceleration events
  final int nbAccelCrit;

  /// The number of critical deceleration events
  final int nbDecelCrit;

  /// The safety score
  final double safetyScore;
}

/// CrashStatus enum
enum CrashStatus {
  /// The crash is unconfirmed
  unconfirmed,

  /// The crash is confirmed
  confirmed,
}

/// SpeedLimitContext class
class SpeedLimitContext {
  /// Creates a SpeedLimitContext instance
  const SpeedLimitContext({
    required this.speedLimit,
    required this.distance,
    required this.duration,
    required this.speedingDistance,
    required this.speedingDuration,
    required this.score,
  });

  /// The speed limit
  final int speedLimit;

  /// The distance
  final int distance;

  /// The duration
  final int duration;

  /// The speeding distance
  final int speedingDistance;

  /// The speeding duration
  final int speedingDuration;

  /// The score
  final double score;
}