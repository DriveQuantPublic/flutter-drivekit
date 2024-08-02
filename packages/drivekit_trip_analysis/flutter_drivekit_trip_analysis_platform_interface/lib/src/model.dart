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
  ///
  /// [PostGeneric] object contains raw data sent to DriveQuant's server,
  /// [PostGenericResponse] object contains the trip analysis
  /// made on DriveQuant's server.
  final void Function(PostGeneric post, PostGenericResponse response)?
      tripFinished;

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
  final void Function(State state)? significantLocationChangeDetected;

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
  final DateTime? date;

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

/// PostGenericResponse class
class PostGenericResponse {
  /// Creates a PostGenericResponse instance
  const PostGenericResponse({
    required this.status,
    required this.itinId,
    required this.comments,
    this.userId,
    this.account,
    this.itineraryStatistics,
    this.ecoDriving,
    this.fuelEstimation,
    this.safety,
    this.advancedEcoDriving,
    this.advancedFuelEstimation,
    this.advancedSafety,
    this.pollutants,
    this.tireWear,
    this.brakeWear,
    this.driverDistraction,
    this.itineraryData,
    this.endDate,
    this.logbook,
    this.safetyEvents,
    this.callEvents,
    this.speedingEvents,
    this.speedingStatistics,
    this.energyEstimation,
    this.advancedEnergyEstimation,
  });

  /// The status of the response
  final bool status;

  /// The itinerary ID
  final String itinId;

  /// The list of comments
  final List<Comment> comments;

  /// The user ID
  final String? userId;

  /// The account information
  final Account? account;

  /// The itinerary statistics
  final ItineraryStatistics? itineraryStatistics;

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
  final List<DriverDistraction>? driverDistraction;

  /// The itinerary data
  final ItineraryData? itineraryData;

  /// The end date of the itinerary
  final DateTime? endDate;

  /// The logbook information
  final Logbook? logbook;

  /// The list of safety events
  final List<SafetyEvent>? safetyEvents;

  /// The list of call events
  final List<CallEvent>? callEvents;

  /// The list of speeding events
  final List<SpeedingEvents>? speedingEvents;

  /// The speeding statistics
  final SpeedingStatistics? speedingStatistics;

  /// The energy estimation information
  final EnergyEstimation? energyEstimation;

  /// The list of advanced energy estimations
  final List<AdvancedEnergyEstimation>? advancedEnergyEstimation;
}

/// PostGeneric class
class PostGeneric {
  /// Creates a PostGeneric instance
  const PostGeneric({
    required this.route,
    required this.account,
    required this.smartphoneData,
    required this.vehicle,
    required this.itineraryData,
    this.metaData,
    this.phoneCalls,
    this.logbook,
  });

  /// The route information
  final Route route;

  /// The account information
  final Account account;

  /// The smartphone data
  final SmartphoneData smartphoneData;

  /// The vehicle information
  final Vehicle vehicle;

  /// The itinerary data
  final ItineraryData itineraryData;

  /// The metadata
  final Map<String, String>? metaData;

  /// The list of phone call requests
  final List<PhoneCallRequest>? phoneCalls;

  /// The logbook information
  final PostLogbook? logbook;
}

/// Account class
class Account {
  /// Creates an Account instance
  const Account({
    required this.account,
    required this.userId,
    this.vehicleId,
  });

  /// The account identifier
  final String account;

  /// The user identifier
  final String userId;

  /// The vehicle identifier
  final String? vehicleId;
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
  final DateTime date;

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

/// ItineraryStatistics class
class ItineraryStatistics {
  /// Creates an ItineraryStatistics instance
  const ItineraryStatistics({
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
    required this.transportationMode,
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

  /// The transportation mode
  final int transportationMode;
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
    this.calls,
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

  /// The list of calls
  final List<Call>? calls;
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
    required this.speedLimitContexts,
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

  /// The list of speed limit contexts
  final List<SpeedLimitContext> speedLimitContexts;
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

/// SmartphoneData class
class SmartphoneData {
  /// Creates a SmartphoneData instance
  const SmartphoneData({
    required this.gpsDate,
    required this.phoneDate,
    required this.startMode,
    required this.batteryPercent,
    required this.tripCut,
    required this.bluetoothEnabled,
    required this.phoneModel,
    required this.appBuildNumber,
    required this.appVersion,
    required this.osVersion,
    required this.osType,
    required this.sdkVersion,
    required this.localTripId,
  });

  /// The GPS date
  final DateTime gpsDate;

  /// The phone date
  final DateTime phoneDate;

  /// The start mode
  final int startMode;

  /// The battery percentage
  final int batteryPercent;

  /// The trip cut status
  final bool tripCut;

  /// The Bluetooth enabled status
  final bool bluetoothEnabled;

  /// The phone model
  final String phoneModel;

  /// The app build number
  final String appBuildNumber;

  /// The app version
  final String appVersion;

  /// The OS version
  final String osVersion;

  /// The OS type
  final String osType;

  /// The SDK version
  final String sdkVersion;

  /// The local trip ID
  final String localTripId;
}

/// PhoneCallRequest class
class PhoneCallRequest {
  /// Creates a PhoneCallRequest instance
  const PhoneCallRequest({
    required this.start,
    required this.end,
    required this.status,
    required this.audioSystem,
    required this.proximity,
    required this.bluetoothClass,
    this.audioInput,
    this.audioOutput,
    this.audioName,
  });

  /// The start time
  final double start;

  /// The end time
  final double end;

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

  /// The proximity
  final int proximity;

  /// The Bluetooth class
  final int bluetoothClass;
}

/// PostLogbook class
class PostLogbook {
  /// Creates a PostLogbook instance
  const PostLogbook({
    required this.status,
  });

  /// The status
  final int status;
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

/// PigeonSpeedLimitContext class
class SpeedLimitContext {
  /// Creates a PigeonSpeedLimitContext instance
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
