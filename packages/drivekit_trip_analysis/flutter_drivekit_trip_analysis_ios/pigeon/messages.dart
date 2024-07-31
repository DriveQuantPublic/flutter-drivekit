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
  void activateAutoStart(bool activate);
  void activateCrashDetection(bool activate);
  void startTrip();
  void stopTrip();
  void cancelTrip();
  bool isTripRunning();
  void setMonitorPotentialTripStart(bool activate);
  bool getMonitorPotentialTripStart();
  void setVehicle(PigeonVehicle vehicle);
}

@FlutterApi()
abstract class TripListener {
  void tripStarted(PigeonStartMode startMode);
  void tripPoint(PigeonTripPoint tripPoint);
  void tripSavedForRepost();
  void tripFinished(PigeonPostGeneric post, PigeonPostGenericResponse response);
  void tripCancelled(PigeonCancelTrip cancelTrip);
  void beaconDetected();
  void significantLocationChangeDetected(PigeonState state);
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
  final double carPower;
  final double carMass;
  final int carGearboxIndex;
  final double carConsumption;
  final int carAutoGearboxNumber;
  final double engineDisplacement;
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

class PigeonAccount {
  // Add properties and methods as needed
}

class PigeonAdvancedEcoDriving {
  List<PigeonEcoDrivingContext>? ecoDrivingContext;
}

class PigeonAdvancedFuelEstimation {
  List<PigeonFuelEstimationContext>? fuelEstimationContext;
}

class PigeonAdvancedSafety {
  List<PigeonSafetyContext>? safetyContext;
}

class PigeonBeaconData {
  PigeonBeaconData({
    required this.proximityUuid,
    required this.major,
    required this.minor,
  });
  final String proximityUuid;
  final int major;
  final int minor;
}

class PigeonBluetoothData {
  PigeonBluetoothData({
    required this.name,
    required this.macAddress,
  });
  final String name;
  final String macAddress;
}

class PigeonBluetoothDevicesList {
  PigeonBluetoothDevicesList({
    required this.bluetoothDevices,
  });
  List<PigeonBluetoothData> bluetoothDevices;
}

class PigeonBrakeWear {
  PigeonBrakeWear({
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
  int frontBrakeAutonomy;
  int frontBrakeDistance;
  int frontBrakePadWear;
  int frontBrakeTotalWear;
  int frontBrakeWearRate;
  int rearBrakeAutonomy;
  int rearBrakeDistance;
  int rearBrakePadWear;
  int rearBrakeTotalWear;
  int rearBrakeWearRate;
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

class PigeonCallEvent {
  PigeonCallEvent({
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

enum PigeonCancelTrip {
  user,
  highspeed,
  noSpeed,
  noBeacon,
  noBluetoothDevice,
  missingConfiguration,
  noGPSData,
  reset,
  beaconNoSpeed,
  bluetoothDeviceNoSpeed,
}

class PigeonComment {
  PigeonComment({
    required this.errorCode,
    required this.comment,
  });
  int errorCode;
  String comment;
}

enum PigeonCrashFeedbackSeverity {
  none,
  minor,
  critical,
}

enum PigeonCrashFeedbackType {
  noCrash,
  confirmed,
  noFeedback,
}

class PigeonDKAdvancedEnergyEstimation {
  PigeonDKAdvancedEnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
    required this.duration,
    required this.distance,
    required this.contextId,
  });
  double energy;
  double energyConsumption;
  double energyOpti;
  double energyOptiConsumption;
  double duration;
  double distance;
  int contextId;
}

enum PigeonDKCrashAlert {
  silence,
  vibration,
  soundAndVibration,
}

enum PigeonDKCrashFeedbackSeverity {
  none,
  minor,
  critical,
}

enum PigeonDKCrashFeedbackType {
  noCrash,
  confirmed,
  noFeedback,
}

class PigeonDKCrashInfo {
  PigeonDKCrashInfo({
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
  final PigeonDKCrashStatus crashStatus;
}

enum PigeonDKCrashStatus {
  unconfirmed,
  confirmed,
}

class PigeonDKEnergyEstimation {
  PigeonDKEnergyEstimation({
    required this.energy,
    required this.energyConsumption,
    required this.energyOpti,
    required this.energyOptiConsumption,
  });
  double energy;
  double energyConsumption;
  double energyOpti;
  double energyOptiConsumption;
}

class PigeonDKWorkingHours {
  PigeonDKWorkingHours({
    required this.enabled,
    required this.insideHours,
    required this.outsideHours,
    required this.workingHoursDayConfigurations,
  });
  bool enabled;
  PigeonDKWorkingHoursTimeSlotStatus insideHours;
  PigeonDKWorkingHoursTimeSlotStatus outsideHours;
  List<PigeonDKWorkingHoursDayConfiguration> workingHoursDayConfigurations;
}

class PigeonDKWorkingHoursDayConfiguration {
  PigeonDKWorkingHoursDayConfiguration({
    required this.day,
    required this.entireDayOff,
    required this.startTime,
    required this.endTime,
  });
  PigeonDKDay day;
  bool entireDayOff;
  double startTime;
  double endTime;
}

enum PigeonDKWorkingHoursSyncStatus {
  success,
  cacheOnly,
  failed,
}

enum PigeonDKWorkingHoursTimeSlotStatus {
  disabled,
  personal,
  business,
}

enum PigeonDKWorkingHoursUpdateStatus {
  success,
  failed,
  invalidDayOfWeek,
  invalidStartOrEndTime,
  startTimeGreaterThanEndTime,
  duplicatedDay,
  invalidDayCount,
}

class PigeonDriverDistraction {
  PigeonDriverDistraction({
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
  int nbUnlock;
  double durationUnlock;
  double durationPercentUnlock;
  double distanceUnlock;
  double distancePercentUnlock;
  double score;
  double? scoreUnlock;
  double? scoreCall;
  List<PigeonCall>? calls;
}

class PigeonEcoDriving {
  PigeonEcoDriving({
    required this.score,
    required this.scoreAccel,
    required this.scoreMain,
    required this.scoreDecel,
    required this.stdDevAccel,
    required this.stdDevMain,
    required this.stdDevDecel,
    required this.energyClass,
  });
  double score;
  double scoreAccel;
  double scoreMain;
  double scoreDecel;
  double stdDevAccel;
  double stdDevMain;
  double stdDevDecel;
  int energyClass;
}

class PigeonEcoDrivingContext {
  PigeonEcoDrivingContext({
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

class PigeonFuelEstimation {
  PigeonFuelEstimation({
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

class PigeonFuelEstimationContext {
  PigeonFuelEstimationContext({
    required this.co2Emission,
    required this.co2Mass,
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.fuelConsumption,
    required this.fuelVolume,
  });
  final double co2Emission;
  final double co2Mass;
  final int contextId;
  final double distance;
  final double duration;
  final double fuelConsumption;
  final double fuelVolume;
}

class PigeonItineraryData {
  PigeonItineraryData({
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

class PigeonItineraryStatistics {
  PigeonItineraryStatistics({
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

class PigeonLogbook {
  PigeonLogbook({
    required this.status,
    this.updateDate,
  });
  final int status;
  final String? updateDate;
}

enum PigeonLogbookType {
  unknown,
  pro,
  perso,
}

class PigeonPollutants {
  PigeonPollutants({
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

class PigeonPostGeneric {
  PigeonPostGeneric({
    this.route,
    this.itineraryData,
    this.vehicle,
    this.metaData,
  });
  final PigeonRoute? route;
  final PigeonItineraryData? itineraryData;
  final PigeonVehicle? vehicle;
  final Map<String, String>? metaData;
}

class PigeonPostGenericResponse {
  PigeonPostGenericResponse({
    required this.status,
    required this.endDate,
    this.itinId,
    this.userId,
    this.comments,
    this.itineraryData,
    this.itineraryStatistics,
    this.ecoDriving,
    this.fuelEstimation,
    this.safety,
    this.logbook,
    this.pollutants,
    this.tireWear,
    this.brakeWear,
    this.safetyEvents,
    this.tripAdvicesData,
    this.driverDistraction,
    this.advancedEcoDriving,
    this.advancedFuelEstimation,
    this.advancedSafety,
    this.callEvents,
    this.speedingEvents,
    this.speedingStatistics,
    this.energyEstimation,
    this.advancedEnergyEstimation,
  });
  final bool status;
  final String? itinId;
  final String endDate;
  final String? userId;
  final List<PigeonComment>? comments;
  final PigeonItineraryData? itineraryData;
  final PigeonItineraryStatistics? itineraryStatistics;
  final PigeonEcoDriving? ecoDriving;
  final PigeonFuelEstimation? fuelEstimation;
  final PigeonSafety? safety;
  final PigeonLogbook? logbook;
  final PigeonPollutants? pollutants;
  final PigeonTireWear? tireWear;
  final PigeonBrakeWear? brakeWear;
  final List<PigeonSafetyEvent>? safetyEvents;
  final List<PigeonTripAdviceData>? tripAdvicesData;
  final PigeonDriverDistraction? driverDistraction;
  final PigeonAdvancedEcoDriving? advancedEcoDriving;
  final PigeonAdvancedFuelEstimation? advancedFuelEstimation;
  final PigeonAdvancedSafety? advancedSafety;
  final List<PigeonCallEvent>? callEvents;
  final List<PigeonSpeedingEvent>? speedingEvents;
  final PigeonSpeedingStatistics? speedingStatistics;
  final PigeonDKEnergyEstimation? energyEstimation;
  final List<PigeonDKAdvancedEnergyEstimation>? advancedEnergyEstimation;
}

class PigeonRoute {
  PigeonRoute({
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

class PigeonSafety {
  PigeonSafety({
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

class PigeonSafetyContext {
  PigeonSafetyContext({
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

class PigeonSafetyEvent {
  PigeonSafetyEvent({
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

class PigeonSpeedingEvent {
  PigeonSpeedingEvent({
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
  PigeonSpeedingStatistics({
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

enum PigeonStartMode {
  gps,
  beacon,
  manual,
  geozone,
  bluetooth,
  bluetoothUnknown,
}

enum PigeonState {
  inactive,
  starting,
  running,
  stopping,
  sending,
}

class PigeonTireWear {
  PigeonTireWear({
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

class PigeonTripAdviceData {
  PigeonTripAdviceData({
    this.title,
    this.message,
    this.messageId,
    this.id,
    this.theme,
  });
  final String? title;
  final String? message;
  final String? messageId;
  final String? id;
  final String? theme;
}

class PigeonTripPoint {
  PigeonTripPoint({
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

enum PigeonTripResponseInfo {
  engineSpeedNotAvailable,
  engineSpeedIsNull,
  noVehicleCharacteristics,
  dataLoss,
  distanceTooShort,
  invalidVehicleCharacteristics,
  invalidVehicleId,
}

class PigeonTripResponseStatus {
  PigeonTripResponseStatus({
    required this.status,
    required this.hasSafetyAndEcoDrivingScore,
    required this.info,
    this.error,
  });
  final PigeonTripResponseStatusType status;
  final bool hasSafetyAndEcoDrivingScore;
  final List<PigeonTripResponseInfo> info;
  final PigeonTripResponseError? error;
}

enum PigeonTripResponseStatusType {
  tripValid,
  tripError,
}

enum PigeonDKDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  unknown,
}
