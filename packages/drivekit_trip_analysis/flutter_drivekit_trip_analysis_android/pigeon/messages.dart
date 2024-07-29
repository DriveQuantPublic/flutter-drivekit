// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/tripanalysis/TripAnalysisApi.kt',
    kotlinOptions: KotlinOptions(
      errorClassName: 'FlutterTripAnalysisError',
      package: 'com.drivequant.drivekit.flutter.tripanalysis',
    ),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class AndroidTripAnalysisApi {
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
    this.length,
    this.width,
    this.height,
    this.engineCylinderNb,
    this.driveWheels,
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
  final double? length;
  final double? width;
  final double? height;
  final int? engineCylinderNb;
  final int? driveWheels;
}

enum PigeonCancelTrip {
  user,
  highspeed,
  noSpeed,
  noBeacon,
  noBluetoothDevice,
  missingConfiguration,
  noGpsData,
  reset,
  beaconNoSpeed,
  bluetoothDeviceNoSpeed;
}

enum PigeonStartMode {
  gps,
  beacon,
  manual,
  geozone,
  bluetooth,
  unknownBluetooth,
  bicycleActivity,
  connectedCar;
}

enum PigeonCrashFeedbackType{
  noCrash,
  crashConfirmed,
  noFeedback;
}

enum PigeonCrashFeedbackSeverity {
  none,
  minor,
  critical;
}

enum PigeonState {
  inactive,
  starting,
  running,
  stopping,
  sending;
}

enum PigeonCrashStatus{
  confirmed,
  unconfirmed;
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

class PigeonDKCrashInfo {
  const PigeonDKCrashInfo({
    required this.probability, required this.latitude, required this.longitude, required this.velocity, this.crashId,
    this.date,
    this.status,
  });

  final String? crashId;
  final DateTime? date;
  final PigeonCrashStatus? status;
  final int probability;
  final double latitude;
  final double longitude;
  final double velocity;
}

class PigeonPostGenericResponse {
  PigeonPostGenericResponse({
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
  final List<PigeonComment> comments;
  final String? userId;
  final PigeonAccount? account;
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
  final List<PigeonDriverDistraction>? driverDistraction;
  final PigeonItineraryData? itineraryData;
  final DateTime? endDate;
  final PigeonLogbook? logbook;
  final List<PigeonSafetyEvent>? safetyEvents;
  final List<PigeonCallEvent>? callEvents;
  final List<PigeonSpeedingEvents>? speedingEvents;
  final PigeonSpeedingStatistics? speedingStatistics;
  final PigeonEnergyEstimation? energyEstimation;
  final List<PigeonAdvancedEnergyEstimation>? advancedEnergyEstimation;
}

class PigeonComment {
  const PigeonComment({
    required this.errorCode,
    required this.comment,
  });

  final int errorCode;
  final String comment;
}

class PigeonAccount {
  const PigeonAccount({
    required this.account,
    required this.userId,
    this.vehicleId,
  });

  final String account;
  final String userId;
  final String? vehicleId;
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
    required this.safetyScore,
    required this.nbAdh,
    required this.nbAccel,
    required this.nbDecel,
    required this.nbAdhCrit,
    required this.nbAccelCrit,
    required this.nbDecelCrit,
  });

  final double safetyScore;
  final int nbAdh;
  final int nbAccel;
  final int nbDecel;
  final int nbAdhCrit;
  final int nbAccelCrit;
  final int nbDecelCrit;
}

class PigeonAdvancedEcoDriving {
  const PigeonAdvancedEcoDriving({
    required this.ecoDrivingContext,
  });

  final List<PigeonEcoDrivingContext> ecoDrivingContext;
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

class PigeonAdvancedFuelEstimation {
  const PigeonAdvancedFuelEstimation({
    required this.fuelEstimationContext,
  });

  final List<PigeonFuelEstimationContext> fuelEstimationContext;
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

class PigeonAdvancedSafety {
  const PigeonAdvancedSafety({
    required this.safetyContext,
  });

  final List<PigeonSafetyContext> safetyContext;
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
    required this.frontTireWear,
    required this.rearTireWear,
    required this.frontTireDistance,
    required this.rearTireDistance,
    required this.frontTireAutonomy,
    required this.rearTireAutonomy,
    required this.frontTireTotalWear,
    required this.rearTireTotalWear,
    required this.frontTireWearRate,
    required this.rearTireWearRate,
  });

  final int frontTireWear;
  final int rearTireWear;
  final int frontTireDistance;
  final int rearTireDistance;
  final int frontTireAutonomy;
  final int rearTireAutonomy;
  final double frontTireTotalWear;
  final double rearTireTotalWear;
  final double frontTireWearRate;
  final double rearTireWearRate;
}

class PigeonBrakeWear {
  const PigeonBrakeWear({
    required this.frontBrakePadWear,
    required this.rearBrakePadWear,
    required this.frontBrakeDistance,
    required this.rearBrakeDistance,
    required this.frontBrakeAutonomy,
    required this.rearBrakeAutonomy,
    required this.frontBrakeTotalWear,
    required this.rearBrakeTotalWear,
    required this.frontBrakeWearRate,
    required this.rearBrakeWearRate,
  });

  final int frontBrakePadWear;
  final int rearBrakePadWear;
  final int frontBrakeDistance;
  final int rearBrakeDistance;
  final int frontBrakeAutonomy;
  final int rearBrakeAutonomy;
  final double frontBrakeTotalWear;
  final double rearBrakeTotalWear;
  final double frontBrakeWearRate;
  final double rearBrakeWearRate;
}

class PigeonTripAdviceData {
  const PigeonTripAdviceData({
    this.id,
    this.title,
    this.message,
    this.messageId,
    this.theme,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? messageId;
  final String? theme;
}

class PigeonDriverDistraction {
  const PigeonDriverDistraction({
    required this.nbUnlock,
    required this.durationUnlock,
    required this.durationUnlockPercent,
    required this.distanceUnlock,
    required this.distancePercentUnlock,
    required this.score,
    this.scoreUnlock,
    this.scoreCall,
    this.calls,
  });

  final int nbUnlock;
  final double durationUnlock;
  final double durationUnlockPercent;
  final double distanceUnlock;
  final double distancePercentUnlock;
  final double score;
  final double? scoreUnlock;
  final double? scoreCall;
  final List<PigeonCall>? calls;
}

class PigeonItineraryData {
  const PigeonItineraryData({
    required this.endDate,
    this.arrivalAddress,
    this.arrivalCity,
    this.departureAddress,
    this.departureCity,
    this.startDate,
  });

  final DateTime endDate;
  final String? arrivalAddress;
  final String? arrivalCity;
  final String? departureAddress;
  final String? departureCity;
  final DateTime? startDate;
}

class PigeonLogbook {
  const PigeonLogbook({
    required this.status,
    this.updateDate,
  });

  final int status;
  final DateTime? updateDate;
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
  final double duration;
  final String audioSystem;
  final String callType;
  final int index;
  final bool forbidden;
}

class PigeonSpeedingEvents {
  const PigeonSpeedingEvents({
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
  final List<PigeonSpeedLimitContext> speedLimitContexts;
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

class PigeonEnergyEstimation {
  const PigeonEnergyEstimation({
    required this.energy,
    required this.energyOpti,
    required this.energyConsumption,
    required this.energyOptiConsumption,
  });

  final double energy;
  final double energyOpti;
  final double energyConsumption;
  final double energyOptiConsumption;
}

class PigeonAdvancedEnergyEstimation {
  const PigeonAdvancedEnergyEstimation({
    required this.contextId,
    required this.distance,
    required this.duration,
    required this.energy,
    required this.energyOpti,
    required this.energyConsumption,
    required this.energyOptiConsumption,
  });

  final int contextId;
  final double distance;
  final double duration;
  final double energy;
  final double energyOpti;
  final double energyConsumption;
  final double energyOptiConsumption;
}

class PigeonPostGeneric {
  const PigeonPostGeneric({
    required this.route,
    required this.account,
    required this.smartphoneData,
    required this.vehicle,
    required this.itineraryData,
    this.metaData,
    this.phoneCalls,
    this.logbook,
  });

  final PigeonRoute route;
  final PigeonAccount account;
  final PigeonSmartphoneData smartphoneData;
  final PigeonVehicle vehicle;
  final PigeonItineraryData itineraryData;
  final Map<String, String>? metaData;
  final List<PigeonPhoneCallRequest>? phoneCalls;
  final PigeonPostLogbook? logbook;
}

class PigeonPostLogbook {
  const PigeonPostLogbook({
    required this.status,
  });

  final int status;
}

class PigeonPhoneCallRequest {
  const PigeonPhoneCallRequest({
    required this.start,
    required this.end,
    required this.status,
    required this.audioSystem,
    required this.proximity, required this.bluetoothClass, this.audioInput,
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
    this.stoppingStateRoute,
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
  final PigeonRoute? stoppingStateRoute;
}

class PigeonSmartphoneData {
  const PigeonSmartphoneData({
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
    required this.localTripId, this.beacon,
    this.bluetoothDeviceData,
    this.connectedCarData,
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
  final PigeonBeacon? beacon;
  final PigeonBluetoothDeviceData? bluetoothDeviceData;
  final PigeonConnectedCarData? connectedCarData;
  final String localTripId;
}

class PigeonBeacon {
  const PigeonBeacon({
    required this.proximityUuid,
    required this.major,
    required this.minor,
  });

  final String proximityUuid;
  final int major;
  final int minor;
}

class PigeonBluetoothDeviceData {
  const PigeonBluetoothDeviceData({
    required this.macAddress,
    this.name,
  });

  final String macAddress;
  final String? name;
}

class PigeonConnectedCarData {
  const PigeonConnectedCarData({
    required this.type,
    this.data,
  });

  final PigeonConnectedCarType type;
  final Map<String, String>? data;
}

enum PigeonConnectedCarType {
  androidAuto,
  automotiveOs,
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
