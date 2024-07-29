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

/// PostGenericResponse class
class PostGenericResponse {
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

  final bool status;
  final String itinId;
  final List<Comment> comments;
  final String? userId;
  final Account? account;
  final ItineraryStatistics? itineraryStatistics;
  final EcoDriving? ecoDriving;
  final FuelEstimation? fuelEstimation;
  final Safety? safety;
  final AdvancedEcoDriving? advancedEcoDriving;
  final AdvancedFuelEstimation? advancedFuelEstimation;
  final AdvancedSafety? advancedSafety;
  final Pollutants? pollutants;
  final TireWear? tireWear;
  final BrakeWear? brakeWear;
  final List<DriverDistraction>? driverDistraction;
  final ItineraryData? itineraryData;
  final DateTime? endDate;
  final Logbook? logbook;
  final List<SafetyEvent>? safetyEvents;
  final List<CallEvent>? callEvents;
  final List<SpeedingEvents>? speedingEvents;
  final SpeedingStatistics? speedingStatistics;
  final EnergyEstimation? energyEstimation;
  final List<AdvancedEnergyEstimation>? advancedEnergyEstimation;
}

/// PostGeneric class
class PostGeneric {
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

  final Route route;
  final Account account;
  final SmartphoneData smartphoneData;
  final Vehicle vehicle;
  final ItineraryData itineraryData;
  final Map<String, String>? metaData;
  final List<PhoneCallRequest>? phoneCalls;
  final PostLogbook? logbook;
}

/// Account class
class Account {
  const Account({
    required this.account,
    required this.userId,
    this.vehicleId,
  });

  final String account;
  final String userId;
  final String? vehicleId;
}

/// AdvancedEcoDriving class
class AdvancedEcoDriving {
  const AdvancedEcoDriving({
    required this.ecoDrivingContext,
  });

  final List<EcoDrivingContext> ecoDrivingContext;
}

/// AdvancedFuelEstimation class
class AdvancedFuelEstimation {
  const AdvancedFuelEstimation({
    required this.fuelEstimationContext,
  });

  final List<FuelEstimationContext> fuelEstimationContext;
}

/// AdvancedSafety class
class AdvancedSafety {
  const AdvancedSafety({
    required this.safetyContext,
  });

  final List<SafetyContext> safetyContext;
}

/// BeaconData class
class BeaconData {
  const BeaconData({
    required this.proximityUuid,
    required this.major,
    required this.minor,
  });

  final String proximityUuid;
  final int major;
  final int minor;
}

/// BluetoothData class
class BluetoothData {
  const BluetoothData({
    required this.name,
    required this.macAddress,
  });

  final String name;
  final String macAddress;
}

/// BluetoothDevicesList class
class BluetoothDevicesList {
  const BluetoothDevicesList({
    required this.bluetoothDevices,
  });

  final List<BluetoothData> bluetoothDevices;
}

/// BrakeWear class
class BrakeWear {
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

  final int frontBrakeAutonomy;
  final int frontBrakeDistance;
  final int frontBrakePadWear;
  final int frontBrakeTotalWear;
  final int frontBrakeWearRate;
  final int rearBrakeAutonomy;
  final int rearBrakeDistance;
  final int rearBrakePadWear;
  final int rearBrakeTotalWear;
  final int rearBrakeWearRate;
}

/// Call class
class Call {
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

  final int id;
  final double start;
  final double end;
  final int durationS;
  final int duration;
  final int distanceM;
  final int distance;
  final String status;
  final String audioSystem;
  final String? audioInput;
  final String? audioOutput;
  final String? audioName;
  final int bluetoothClass;
  final bool forbidden;
}

/// CallEvent class
class CallEvent {
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

  final double time;
  final double latitude;
  final double longitude;
  final double velocity;
  final double heading;
  final double elevation;
  final double distance;
  final int type;
  final int duration;
  final String audioSystem;
  final String callType;
  final int index;
  final bool forbidden;
}

/// Comment class
class Comment {
  const Comment({
    required this.errorCode,
    required this.comment,
  });

  final int errorCode;
  final String comment;
}

/// DKAdvancedEnergyEstimation class
class AdvancedEnergyEstimation {
  const AdvancedEnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
    required this.duration,
    required this.distance,
    required this.contextId,
  });

  final double energy;
  final double energyConsumption;
  final double energyOpti;
  final double energyOptiConsumption;
  final double duration;
  final double distance;
  final int contextId;
}

/// DKCrashInfo class
class CrashInfo {
  const CrashInfo({
    required this.crashId,
    required this.date,
    required this.probability,
    required this.latitude,
    required this.longitude,
    required this.velocity,
    required this.crashStatus,
  });

  final String crashId;
  final DateTime date;
  final int probability;
  final double latitude;
  final double longitude;
  final double velocity;
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

class ItineraryStatistics {
  ItineraryStatistics({
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

  final double tripDuration;
  final double drivingDuration;
  final double idlingDuration;
  final double drivingPercentage;
  final double idlingPercentage;
  final double distance;
  final double speedMean;
  final int subdispNb;
  final int meteo;
  final bool day;
  final bool weekDay;
  final int transportationMode;
}

class EcoDriving {
  EcoDriving({
    required this.score,
    required this.scoreAccel,
    required this.scoreMain,
    required this.scoreDecel,
    required this.stdDevAccel,
    required this.stdDevMain,
    required this.stdDevDecel,
    required this.energyClass,
  });

  final double score;
  final double scoreAccel;
  final double scoreMain;
  final double scoreDecel;
  final double stdDevAccel;
  final double stdDevMain;
  final double stdDevDecel;
  final int energyClass;
}

class FuelEstimation {
  FuelEstimation({
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

  final double co2Mass;
  final double co2Emission;
  final double fuelVolume;
  final double fuelConsumption;
  final double idleFuelVolume;
  final double idleFuelPercentage;
  final double idleFuelConsumption;
  final double idleCo2Emission;
  final double idleCo2Mass;
  final bool engineTempStatus;
  final double coldFuelVolume;
}

class Safety {
  Safety({
    required this.nbAdh,
    required this.nbAccel,
    required this.nbDecel,
    required this.nbAdhCrit,
    required this.nbAccelCrit,
    required this.nbDecelCrit,
    required this.safetyScore,
  });

  final int nbAdh;
  final int nbAccel;
  final int nbDecel;
  final int nbAdhCrit;
  final int nbAccelCrit;
  final int nbDecelCrit;
  final double safetyScore;
}

class Pollutants {
  Pollutants({
    required this.co,
    required this.hc,
    required this.nox,
    required this.soot,
  });

  final double co;
  final double hc;
  final double nox;
  final double soot;
}

class TireWear {
  TireWear({
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

  final int frontTireAutonomy;
  final int frontTireDistance;
  final int frontTireTotalWear;
  final int frontTireWear;
  final int frontTireWearRate;
  final int rearTireAutonomy;
  final int rearTireDistance;
  final int rearTireTotalWear;
  final int rearTireWear;
  final int rearTireWearRate;
}

class DriverDistraction {
  DriverDistraction({
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

  final int nbUnlock;
  final double durationUnlock;
  final double durationPercentUnlock;
  final double distanceUnlock;
  final double distancePercentUnlock;
  final double score;
  final double? scoreUnlock;
  final double? scoreCall;
  final List<PigeonCall>? calls;
}

class ItineraryData {
  ItineraryData({
    this.startDate,
    this.endDate,
    this.departureCity,
    this.arrivalCity,
    this.departureAddress,
    this.arrivalAddress,
  });

  final String? startDate;
  final String? endDate;
  final String? departureCity;
  final String? arrivalCity;
  final String? departureAddress;
  final String? arrivalAddress;
}

class Logbook {
  Logbook({
    required this.status,
    this.updateDate,
  });

  final int status;
  final String? updateDate;
}

class SafetyEvent {
  SafetyEvent({
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

  final double time;
  final double longitude;
  final double latitude;
  final double velocity;
  final double heading;
  final double elevation;
  final double distance;
  final int type;
  final int level;
  final double value;
}

class SpeedingEvents {
  SpeedingEvents({
    required this.time,
    required this.longitude,
    required this.latitude,
    required this.type,
    required this.index,
  });

  final double time;
  final double longitude;
  final double latitude;
  final double type;
  final int index;
}

class SpeedingStatistics {
  SpeedingStatistics({
    required this.distance,
    required this.duration,
    required this.speedingDistance,
    required this.speedingDuration,
    required this.score,
    required this.speedLimitContexts,
  });

  final int distance;
  final int duration;
  final int speedingDistance;
  final int speedingDuration;
  final double score;
  final List<PigeonSpeedLimitContext> speedLimitContexts;
}

class Route {
  Route({
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

  final List<double> gpsDate;
  final List<double> gpsVelocity;
  final List<double> longitude;
  final List<double> latitude;
  final List<double> gpsElevation;
  final List<double> gpsAccuracy;
  final List<double> gpsHeading;
  final List<double> screenLocked;
  final List<double> activityValue;
  final List<int> roll;
  final List<int> pitch;
  final List<int> yaw;
  final List<int> gyroscopeNormVar;
}

class SmartphoneData {
  SmartphoneData({
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

  final DateTime gpsDate;
  final DateTime phoneDate;
  final int startMode;
  final int batteryPercent;
  final bool tripCut;
  final bool bluetoothEnabled;
  final String phoneModel;
  final String appBuildNumber;
  final String appVersion;
  final String osVersion;
  final String osType;
  final String sdkVersion;
  final String localTripId;
}

class PhoneCallRequest {
  PhoneCallRequest({
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

  final double start;
  final double end;
  final String status;
  final String audioSystem;
  final String? audioInput;
  final String? audioOutput;
  final String? audioName;
  final int proximity;
  final int bluetoothClass;
}

class PostLogbook {
  PostLogbook({
    required this.status,
  });

  final int status;
}

class EcoDrivingContext {
  EcoDrivingContext({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.efficiencyScore,
    required this.scoreAccel,
    required this.scoreMain,
    required this.scoreDecel,
  });

  final int contextId;
  final double distance;
  final double duration;
  final double efficiencyScore;
  final double scoreAccel;
  final double scoreMain;
  final double scoreDecel;
}

class FuelEstimationContext {
  FuelEstimationContext({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.co2Mass,
    required this.co2Emission,
    required this.fuelVolume,
    required this.fuelConsumption,
  });

  final int contextId;
  final double distance;
  final double duration;
  final double co2Mass;
  final double co2Emission;
  final double fuelVolume;
  final double fuelConsumption;
}

class SafetyContext {
  SafetyContext({
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

  final int contextId;
  final double distance;
  final double duration;
  final int nbAdh;
  final int nbAccel;
  final int nbDecel;
  final int nbAdhCrit;
  final int nbAccelCrit;
  final int nbDecelCrit;
  final double safetyScore;
}

enum CrashStatus {
  unconfirmed,
  confirmed,
}

class PigeonCall {
  PigeonCall({
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

  final int id;
  final double start;
  final double end;
  final int durationS;
  final int duration;
  final int distanceM;
  final int distance;
  final String status;
  final String audioSystem;
  final String? audioInput;
  final String? audioOutput;
  final String? audioName;
  final int bluetoothClass;
  final bool forbidden;
}

class PigeonSpeedLimitContext {
  PigeonSpeedLimitContext({
    required this.speedLimit,
    required this.distance,
    required this.duration,
    required this.speedingDistance,
    required this.speedingDuration,
    required this.score,
  });

  final int speedLimit;
  final int distance;
  final int duration;
  final int speedingDistance;
  final int speedingDuration;
  final double score;
}
