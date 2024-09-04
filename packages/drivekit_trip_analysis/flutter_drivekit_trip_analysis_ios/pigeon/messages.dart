// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSTripAnalysisApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterTripAnalysisError'),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class IOSTripAnalysisApi {
  bool isAutoStartActivated();
  void activateAutoStart(bool activate);
  bool isCrashDetectionActivated();
  void activateCrashDetection(bool activate);
  void startTrip();
  void stopTrip();
  void cancelTrip();
  bool isTripRunning();
  void setStopTimeOut(int timeOut);
  bool isMonitoringPotentialTripStart();
  void setMonitorPotentialTripStart(bool activate);
  void setVehicle(PigeonVehicle vehicle);
  PigeonTripResponseStatus? getTripResponseStatus(
    PigeonPostGenericResponse tripResponse,
  );
}

@FlutterApi()
abstract class FlutterTripAnalysisApi {
  void tripStarted(PigeonStartMode startMode);
  void tripPoint(PigeonTripPoint tripPoint);
  void tripSavedForRepost();
  void tripFinished(PigeonPostGeneric post, PigeonPostGenericResponse response);
  void tripCancelled(PigeonCancelTrip cancelTrip);
  void potentialTripStart(PigeonStartMode startMode);
  void beaconDetected();
  void significantLocationChangeDetected(PigeonLocation location);
  void sdkStateChanged(PigeonState state);
  void crashDetected(PigeonDKCrashInfo crashInfo);
  void crashFeedbackSent(
    PigeonDKCrashInfo crashInfo,
    PigeonDKCrashFeedbackType feedbackType,
    PigeonDKCrashFeedbackSeverity severity,
  );
}

class PigeonVehicle {
  const PigeonVehicle({
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

  final int carTypeIndex;

  final int carEngineIndex;

  final int carPower;

  final int carMass;

  final int carGearboxIndex;

  final double carConsumption;

  final int carAutoGearboxNumber;

  final int engineDisplacement;

  final int carPassengers;

  final String? dqIndex;

  final String? sra;

  final String? frontTireSize;

  final String? rearTireSize;

  final double length;

  final double width;

  final double height;

  final int engineCylinderNb;

  final int driveWheels;
}

enum PigeonStartMode {
  gps,

  beacon,

  manual,

  geozone,

  bluetooth,

  unknownBluetooth,
}

enum PigeonCancelTrip {
  user,

  highspeed,

  noSpeed,

  noBeacon,

  missingConfiguration,

  noGpsData,

  reset,

  beaconNoSpeed,

  noBluetoothDevice,

  bluetoothDeviceNoSpeed;
}

class PigeonTripPoint {
  const PigeonTripPoint({
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.accuracy,
    required this.elevation,
    required this.distance,
    required this.heading,
    required this.duration,
  });

  final double latitude;

  final double longitude;

  final double speed;

  final double accuracy;

  final double elevation;

  final double distance;

  final double heading;

  final double duration;
}

enum PigeonState {
  inactive,

  starting,

  running,

  stopping,

  sending;
}

class PigeonDKCrashInfo {
  const PigeonDKCrashInfo({
    required this.probability,
    required this.latitude,
    required this.longitude,
    required this.velocity,
    this.crashId,
    this.date,
    this.status,
  });

  final String? crashId;

  final String? date;

  final PigeonCrashStatus? status;

  final int probability;

  final double latitude;

  final double longitude;

  final double velocity;
}

enum PigeonDKCrashFeedbackType {
  noCrash,

  crashConfirmed,

  noFeedback;
}

enum PigeonDKCrashFeedbackSeverity {
  none,

  minor,

  critical;
}

class PigeonPostGenericResponse {
  const PigeonPostGenericResponse({
    required this.status,
    required this.itinId,
    required this.comments,
    this.userId,
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

  final String? itinId;

  final List<PigeonComment?> comments;

  final String? userId;

  final PigeonItineraryStatistics? itineraryStatistics;

  final PigeonEcoDriving? ecoDriving;

  final PigeonFuelEstimation? fuelEstimation;

  final PigeonSafety? safety;

  final PigeonAdvancedEcoDriving? advancedEcoDriving;

  final PigeonAdvancedFuelEstimation? advancedFuelEstimation;

  final PigeonAdvancedSafety? advancedSafety;

  final PigeonPollutants? pollutants;

  final PigeonTireWear? tireWear;

  final PigeonBrakeWear? brakeWear;

  final PigeonDriverDistraction? driverDistraction;

  final PigeonItineraryData? itineraryData;

  final String? endDate;

  final PigeonLogbook? logbook;

  final List<PigeonSafetyEvent?>? safetyEvents;

  final List<PigeonCallEvent?>? callEvents;

  final List<PigeonSpeedingEvent?>? speedingEvents;

  final PigeonSpeedingStatistics? speedingStatistics;

  final PigeonEnergyEstimation? energyEstimation;

  final List<PigeonAdvancedEnergyEstimation?>? advancedEnergyEstimation;
}

class PigeonPostGeneric {
  const PigeonPostGeneric({
    required this.route,
    required this.vehicle,
    required this.itineraryData,
    this.metaData,
  });

  final PigeonRoute? route;

  final PigeonVehicle? vehicle;

  final PigeonItineraryData? itineraryData;

  final Map<String?, String?>? metaData;
}

class PigeonAdvancedEcoDriving {
  const PigeonAdvancedEcoDriving({
    required this.ecoDrivingContext,
  });

  final List<PigeonEcoDrivingContext?> ecoDrivingContext;
}

class PigeonAdvancedFuelEstimation {
  const PigeonAdvancedFuelEstimation({
    required this.fuelEstimationContext,
  });

  final List<PigeonFuelEstimationContext?> fuelEstimationContext;
}

class PigeonAdvancedSafety {
  const PigeonAdvancedSafety({
    required this.safetyContext,
  });

  final List<PigeonSafetyContext?> safetyContext;
}

class PigeonBeaconData {
  const PigeonBeaconData({
    required this.proximityUuid,
    required this.major,
    required this.minor,
  });

  final String proximityUuid;

  final int major;

  final int minor;
}

class PigeonBluetoothData {
  const PigeonBluetoothData({
    required this.name,
    required this.macAddress,
  });

  final String name;

  final String macAddress;
}

class PigeonBluetoothDevicesList {
  const PigeonBluetoothDevicesList({
    required this.bluetoothDevices,
  });

  final List<PigeonBluetoothData?> bluetoothDevices;
}

class PigeonBrakeWear {
  const PigeonBrakeWear({
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

class PigeonCall {
  const PigeonCall({
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

class PigeonCallEvent {
  const PigeonCallEvent({
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

class PigeonComment {
  const PigeonComment({
    required this.errorCode,
    required this.comment,
  });

  final int errorCode;

  final String comment;
}

class PigeonAdvancedEnergyEstimation {
  const PigeonAdvancedEnergyEstimation({
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

class PigeonEnergyEstimation {
  const PigeonEnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
  });

  final double energy;

  final double energyConsumption;

  final double energyOpti;

  final double energyOptiConsumption;
}

class PigeonItineraryStatistics {
  const PigeonItineraryStatistics({
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

class PigeonEcoDriving {
  const PigeonEcoDriving({
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

class PigeonFuelEstimation {
  const PigeonFuelEstimation({
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

class PigeonSafety {
  const PigeonSafety({
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

class PigeonPollutants {
  const PigeonPollutants({
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

class PigeonTireWear {
  const PigeonTireWear({
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

class PigeonDriverDistraction {
  const PigeonDriverDistraction({
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

  final List<PigeonCall?>? calls;
}

class PigeonItineraryData {
  const PigeonItineraryData({
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

class PigeonLogbook {
  const PigeonLogbook({
    required this.status,
    this.updateDate,
  });

  final int status;

  final String? updateDate;
}

class PigeonSafetyEvent {
  const PigeonSafetyEvent({
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

class PigeonSpeedingEvent {
  const PigeonSpeedingEvent({
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

class PigeonSpeedingStatistics {
  const PigeonSpeedingStatistics({
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

  final List<PigeonSpeedLimitContext?> speedLimitContexts;
}

class PigeonRoute {
  const PigeonRoute({
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

  final List<double?> gpsDate;

  final List<double?> gpsVelocity;

  final List<double?> longitude;

  final List<double?> latitude;

  final List<double?> gpsElevation;

  final List<double?> gpsAccuracy;

  final List<double?> gpsHeading;

  final List<double?> screenLocked;

  final List<double?> activityValue;

  final List<int?> roll;

  final List<int?> pitch;

  final List<int?> yaw;

  final List<int?> gyroscopeNormVar;
}

class PigeonEcoDrivingContext {
  const PigeonEcoDrivingContext({
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

class PigeonFuelEstimationContext {
  const PigeonFuelEstimationContext({
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

class PigeonSafetyContext {
  const PigeonSafetyContext({
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

enum PigeonCrashStatus {
  unconfirmed,

  confirmed,
}

class PigeonPigeonCall {
  const PigeonPigeonCall({
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
  const PigeonSpeedLimitContext({
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

class PigeonLocation {
  const PigeonLocation({
    required this.longitude,
    required this.latitude,
  });

  final double longitude;

  final double latitude;
}

class PigeonTripResponseStatus {
  PigeonTripResponseStatus({
    required this.status,
    required this.hasSafetyAndEcoDrivingScore,
    required this.info,
    required this.error,
  });
  final PigeonTripResponseStatusType status;
  final bool hasSafetyAndEcoDrivingScore;
  final List<PigeonTripResponseInfoItem?> info;
  final PigeonTripResponseError? error;
}

enum PigeonTripResponseStatusType {
  tripValid,
  tripError,
}

class PigeonTripResponseInfoItem {
  PigeonTripResponseInfoItem({required this.info});

  final PigeonTripResponseInfo info;
}

enum PigeonTripResponseInfo {
  engineSpeedNotAvailable,
  engineSpeedIsNull,
  noVehicleCharacteristics,
  dataLoss,
  distanceTooShort,
  invalidVehicleCharacteristics,
  invalidVehicleId,
}

enum PigeonTripResponseError {
  noAccountSet,
  noRouteObjectFound,
  invalidRouteDefinition,
  noVelocityData,
  invalidSamplingPeriod,
  invalidCustomerId,
  noDateFound,
  maxDailyRequestNumberReached,
  dataError,
  invalidRouteVectors,
  missingBeacon,
  invalidBeacon,
  duplicateTrip,
  insufficientGpsData,
  userDisabled,
  invalidUser,
  invalidGpsData,
  invalidTrip,
  accountLimitReached,
}
