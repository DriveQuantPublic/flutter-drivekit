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
  Map<String, String>? getTripMetadata();
  void updateTripMetadata(String key, String? value);
  void setTripMetadata(Map<String, String>? metadata);
  void deleteTripMetadata(String key);
  void deleteAllTripMetadata();
  PigeonCurrentTripInfo? getCurrentTripInfo();
  PigeonLastTripLocation? getLastTripLocation();
  bool isTripSharingAvailable();
  @async
  PigeonCreateTripSharingLinkResponse createTripSharingLink(
    int durationInSeconds,
  );
  @async
  PigeonGetTripSharingLinkResponse getTripSharingLink({
    PigeonSynchronizationType synchronizationType =
        PigeonSynchronizationType.defaultSync,
  });
  @async
  PigeonRevokeTripSharingLinkStatus revokeTripSharingLink();
}

@FlutterApi()
abstract class FlutterTripAnalysisApi {
  void tripRecordingStarted(PigeonTripRecordingStartedState state);
  void tripRecordingConfirmed(PigeonTripRecordingConfirmedState state);
  void tripRecordingCanceled(PigeonTripRecordingCanceledState state);
  void tripRecordingFinished(PigeonTripRecordingFinishedState state);
  void tripStarted(PigeonStartMode startMode);
  void tripPoint(PigeonTripPoint tripPoint);
  void tripSavedForRepost();
  void tripFinished(PigeonTripResponseStatus response);
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

/// Trip Sharing Synchronization Type
enum PigeonSynchronizationType {
  /// synchronize by calling the DriveQuant servers
  defaultSync,

  /// retrieve already synchronized items in the local database
  cache
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
    this.userLocationUrl,
  });

  final String? crashId;

  final String? date;

  final PigeonCrashStatus? status;

  final int probability;

  final double latitude;

  final double longitude;

  final double velocity;

  final String? userLocationUrl;
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
    required this.duration,
    required this.durationPercent,
    required this.distance,
    required this.distancePercent,
    required this.type,
    required this.audioSystem,
    required this.bluetoothClass,
    required this.isForbidden,
    this.audioInput,
    this.audioOutput,
    this.audioName,
  });

  final int id;

  final double start;

  final double end;

  final int duration;

  final int durationPercent;

  final int distance;

  final int distancePercent;

  final String type;

  final String audioSystem;

  final String? audioInput;

  final String? audioOutput;

  final String? audioName;

  final int bluetoothClass;

  final bool isForbidden;
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
  });

  final int nbUnlock;

  final double durationUnlock;

  final double durationPercentUnlock;

  final double distanceUnlock;

  final double distancePercentUnlock;

  final double score;

  final double? scoreUnlock;

  final double? scoreCall;
}

class PigeonLogbook {
  const PigeonLogbook({
    required this.status,
    this.updateDate,
  });

  final int status;

  final String? updateDate;
}

class PigeonOccupantInfo {
  const PigeonOccupantInfo({
    required this.role,
    required this.passengerProbability,
  });

  final PigeonOccupantRole role;

  final int passengerProbability;
}

enum PigeonOccupantRole { driver, passenger, unavailable, notApplicable }

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
  });

  final int distance;

  final int duration;

  final int speedingDistance;

  final int speedingDuration;

  final double score;
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
    required this.itinId,
    required this.hasSafetyAndEcoDrivingScore,
    required this.info,
    required this.error,
    required this.trip,
  });
  final PigeonTripResponseStatusType status;
  final String? itinId;
  final bool hasSafetyAndEcoDrivingScore;
  final List<PigeonTripResponseInfoItem?> info;
  final PigeonTripResponseError? error;
  final PigeonTrip? trip;
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

class PigeonTrip {
  /// Creates a PigeonTrip instance
  PigeonTrip({
    required this.itinId,
    required this.startDate,
    required this.endDate,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureAddress,
    required this.arrivalAddress,
    required this.vehicleId,
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
    required this.logbook,
    required this.occupantInfo,
    required this.safetyEvents,
    required this.speedingStatistics,
    required this.energyEstimation,
    required this.advancedEnergyEstimation,
    required this.tripAdvicesData,
    required this.maneuverData,
    required this.evaluationData,
    required this.metadata,
    required this.transportationMode,
    required this.declaredTransportationMode,
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

  /// The vehicle ID
  final String? vehicleId;

  /// The itinerary statistics
  final PigeonTripStatistics? tripStatistics;

  /// The eco driving information
  final PigeonEcoDriving? ecoDriving;

  /// The fuel estimation information
  final PigeonFuelEstimation? fuelEstimation;

  /// The safety information
  final PigeonSafety? safety;

  /// The advanced eco driving information
  final PigeonAdvancedEcoDriving? advancedEcoDriving;

  /// The advanced fuel estimation information
  final PigeonAdvancedFuelEstimation? advancedFuelEstimation;

  /// The advanced safety information
  final PigeonAdvancedSafety? advancedSafety;

  /// The pollutants information
  final PigeonPollutants? pollutants;

  /// The tire wear information
  final PigeonTireWear? tireWear;

  /// The brake wear information
  final PigeonBrakeWear? brakeWear;

  /// The driver distraction information
  final PigeonDriverDistraction? driverDistraction;

  /// The logbook information
  final PigeonLogbook? logbook;

  /// The occupant role and passenger probability information
  final PigeonOccupantInfo? occupantInfo;

  /// The list of safety events
  final List<PigeonSafetyEvent?>? safetyEvents;

  /// The speeding statistics
  final PigeonSpeedingStatistics? speedingStatistics;

  /// The energy estimation information
  final PigeonEnergyEstimation? energyEstimation;

  /// The list of advanced energy estimations
  final List<PigeonAdvancedEnergyEstimation?>? advancedEnergyEstimation;

  /// Trip advices
  final List<PigeonTripAdviceData?>? tripAdvicesData;

  /// Trip maneuver data
  final PigeonManeuverData? maneuverData;

  /// Trip evaluation data
  final PigeonEvaluationData? evaluationData;

  /// The metadata
  final Map<String?, String?>? metadata;

  /// The transportation mode
  final int transportationMode;

  /// The declared transportation mode
  final PigeonDeclaredTransportationMode? declaredTransportationMode;

  /// The trip is scored or not
  final bool unscored;

  /// The trip calls
  final List<PigeonCall?>? calls;

  /// The speed limit contexts
  final List<PigeonSpeedLimitContext?>? speedLimitContexts;
}

class PigeonTripStatistics {
  const PigeonTripStatistics({
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
}

class PigeonTripAdviceData {
  PigeonTripAdviceData({
    required this.id,
    required this.title,
    required this.message,
    required this.messageId,
    required this.theme,
    required this.adviceEvaluation,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? messageId;
  final String? theme;
  final PigeonTripAdviceEvaluation? adviceEvaluation;
}

class PigeonTripAdviceEvaluation {
  PigeonTripAdviceEvaluation({
    required this.evaluation,
    required this.feedback,
    required this.comment,
  });

  final int evaluation;

  final int feedback;

  final String? comment;
}

class PigeonManeuverData {
  PigeonManeuverData({
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

  final int nbStraightReverseDrivings;
  final int nbCurveReverseDrivings;
  final int nbTurns;
  final int nbHillStarts;
  final int nbRoundAbouts;
  final int nbEmergencyStops;
  final int nbAngledParkings;
  final int nbParallelParkings;
  final int nbBayParkings;
}

class PigeonEvaluationData {
  PigeonEvaluationData({required this.comment, required this.evaluation});

  final String? comment;
  final int evaluation;
}

class PigeonDeclaredTransportationMode {
  PigeonDeclaredTransportationMode({
    required this.transportationMode,
    required this.comment,
    required this.passenger,
  });

  final int transportationMode;
  final String? comment;
  final bool? passenger;
}

class PigeonCurrentTripInfo {
  PigeonCurrentTripInfo({
    required this.localTripId,
    required this.date,
    required this.startMode,
  });

  final String localTripId;
  final String date;
  final PigeonStartMode startMode;
}

class PigeonLastTripLocation {
  PigeonLastTripLocation({
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.accuracyMeter,
    required this.accuracyLevel,
  });

  final String date;
  final double latitude;
  final double longitude;
  final double accuracyMeter;
  final PigeonAccuracyLevel accuracyLevel;
}

enum PigeonAccuracyLevel {
  good,
  fair,
  poor,
}

class PigeonTripRecordingStartedState {
  PigeonTripRecordingStartedState({
    required this.localTripId,
    required this.recordingStartDate,
    required this.startMode,
  });

  final String localTripId;

  final String recordingStartDate;

  final PigeonStartMode startMode;
}

class PigeonTripRecordingConfirmedState {
  PigeonTripRecordingConfirmedState({
    required this.localTripId,
    required this.recordingStartDate,
    required this.recordingConfirmationDate,
    required this.startMode,
  });

  final String localTripId;

  final String recordingStartDate;

  final String recordingConfirmationDate;

  final PigeonStartMode startMode;
}

class PigeonTripRecordingCanceledState {
  PigeonTripRecordingCanceledState({
    required this.localTripId,
    required this.recordingStartDate,
    required this.recordingConfirmationDate,
    required this.startMode,
    required this.cancelationReason,
  });

  final String localTripId;

  final String recordingStartDate;

  final String? recordingConfirmationDate;

  final PigeonStartMode startMode;

  final PigeonTripCancelationReason cancelationReason;
}

enum PigeonTripCancelationReason {
  user,

  highSpeed,

  noSpeed,

  noBeacon,

  missingConfiguration,

  noLocationData,

  reset,

  beaconNoSpeed,

  noBluetoothDevice,

  bluetoothDeviceNoSpeed,

  appKilled;
}

class PigeonTripRecordingFinishedState {
  PigeonTripRecordingFinishedState({
    required this.localTripId,
    required this.recordingStartDate,
    required this.recordingConfirmationDate,
    required this.startMode,
    required this.recordingEndDate,
  });

  final String localTripId;

  final String recordingStartDate;

  final String recordingConfirmationDate;

  final PigeonStartMode startMode;

  final String recordingEndDate;
}

class PigeonCreateTripSharingLinkResponse {
  PigeonCreateTripSharingLinkResponse({
    required this.status,
    required this.data,
  });

  final PigeonCreateTripSharingLinkStatus status;
  final PigeonTripSharingLink? data;
}

enum PigeonCreateTripSharingLinkStatus {
  success,
  activeLinkAlreadyExists,
  error,
  userNotConnected,
  invalidDuration,
  unauthenticated,
  forbidden
}

class PigeonGetTripSharingLinkResponse {
  PigeonGetTripSharingLinkResponse({
    required this.status,
    required this.data,
  });

  final PigeonGetTripSharingLinkStatus status;
  final PigeonTripSharingLink? data;
}

enum PigeonGetTripSharingLinkStatus {
  success,
  failedToGetCacheOnly,
  noActiveLink,
  userNotConnected,
  unauthenticated,
  forbidden
}

enum PigeonRevokeTripSharingLinkStatus {
  success,
  noActiveLink,
  error,
  userNotConnected,
  unauthenticated,
  forbidden
}

class PigeonTripSharingLink {
  PigeonTripSharingLink({
    required this.code,
    required this.url,
    required this.startDate,
    required this.endDate,
  });

  final String code;

  final String url;

  final String startDate;

  final String endDate;
}
