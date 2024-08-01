import 'package:collection/collection.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// Adapts the [PigeonDKCrashInfo] class to the [DKCrashInfo] class.
extension PigeonDKCrashInfoAdapter on PigeonDKCrashInfo {
  /// Converts a [PigeonDKCrashInfo] to a [DKCrashInfo].
  DKCrashInfo toModelImplementation() {
    return DKCrashInfo(
      crashId: crashId,
      date: date != null ? DateTime.fromMillisecondsSinceEpoch(date!) : null,
      status: status?.toModelImplementation(),
      probability: probability,
      latitude: latitude,
      longitude: longitude,
      velocity: velocity,
    );
  }
}

/// Adapts the [PigeonCrashStatus] class to the [CrashStatus] class.
extension PigeonCrashStatusAdapter on PigeonCrashStatus {
  /// Converts a [PigeonCrashStatus] to a [CrashStatus].
  CrashStatus toModelImplementation() {
    return switch (this) {
      PigeonCrashStatus.unconfirmed => CrashStatus.unconfirmed,
      PigeonCrashStatus.confirmed => CrashStatus.confirmed,
    };
  }
}

/// Adapts the [PigeonDKCrashFeedbackType] class to the [DKCrashFeedbackType] class.
extension PigeonDKCrashFeedbackTypeAdapter on PigeonDKCrashFeedbackType {
  /// Converts a [PigeonDKCrashFeedbackType] to a [DKCrashFeedbackType].
  DKCrashFeedbackType toModelImplementation() {
    return switch (this) {
      PigeonDKCrashFeedbackType.noCrash => DKCrashFeedbackType.noCrash,
      PigeonDKCrashFeedbackType.crashConfirmed =>
        DKCrashFeedbackType.crashConfirmed,
      PigeonDKCrashFeedbackType.noFeedback => DKCrashFeedbackType.noFeedback
    };
  }
}

/// Adapts the [PigeonDKCrashFeedbackSeverity] class to the [DKCrashFeedbackSeverity] class.
extension PigeonDKCrashFeedbackSeverityAdapter
    on PigeonDKCrashFeedbackSeverity {
  /// Converts a [PigeonDKCrashFeedbackSeverity] to a [DKCrashFeedbackSeverity].
  DKCrashFeedbackSeverity toModelImplementation() {
    return switch (this) {
      PigeonDKCrashFeedbackSeverity.none => DKCrashFeedbackSeverity.none,
      PigeonDKCrashFeedbackSeverity.minor => DKCrashFeedbackSeverity.minor,
      PigeonDKCrashFeedbackSeverity.critical =>
        DKCrashFeedbackSeverity.critical,
    };
  }
}

/// Adapts the [PigeonState] class to the [State] class.
extension PigeonStateAdapter on PigeonState {
  /// Converts a [PigeonState] to a [State].
  State toModelImplementation() {
    return switch (this) {
      PigeonState.inactive => State.inactive,
      PigeonState.starting => State.starting,
      PigeonState.running => State.running,
      PigeonState.stopping => State.stopping,
      PigeonState.sending => State.sending,
    };
  }
}

/// Adapts the [PigeonCancelTrip] class to the [CancelTrip] class.
extension PigeonCancelTripAdapter on PigeonCancelTrip {
  /// Converts a [PigeonCancelTrip] to a [CancelTrip].
  CancelTrip toModelImplementation() {
    return switch (this) {
      PigeonCancelTrip.user => CancelTrip.user,
      PigeonCancelTrip.highspeed => CancelTrip.highspeed,
      PigeonCancelTrip.noSpeed => CancelTrip.noSpeed,
      PigeonCancelTrip.noBeacon => CancelTrip.noBeacon,
      PigeonCancelTrip.missingConfiguration => CancelTrip.missingConfiguration,
      PigeonCancelTrip.noGpsData => CancelTrip.noGpsData,
      PigeonCancelTrip.reset => CancelTrip.reset,
      PigeonCancelTrip.beaconNoSpeed => CancelTrip.beaconNoSpeed,
      PigeonCancelTrip.bluetoothDeviceNoSpeed =>
        CancelTrip.bluetoothDeviceNoSpeed,
    };
  }
}

/// Adapt the [PigeonStartMode] class to the [TripPoint] class.
extension PigeonStartModeAdapter on PigeonStartMode {
  /// Converts a [PigeonStartMode] to a [StartMode].
  StartMode toModelImplementation() {
    return switch (this) {
      PigeonStartMode.gps => StartMode.gps,
      PigeonStartMode.beacon => StartMode.beacon,
      PigeonStartMode.manual => StartMode.manual,
      PigeonStartMode.geozone => StartMode.geozone,
      PigeonStartMode.bluetooth => StartMode.bluetooth,
      PigeonStartMode.unknownBluetooth => StartMode.unknownBluetooth,
      PigeonStartMode.bicycleActivity => StartMode.bicycleActivity,
      PigeonStartMode.connectedCar => StartMode.connectedCar,
    };
  }
}

/// Adapt the [PigeonTripPoint] class to the [TripPoint] class.
extension PigeonTripPointAdapter on PigeonTripPoint {
  /// Converts a [PigeonTripPoint] to a [TripPoint].
  TripPoint toModelImplementation() {
    return TripPoint(
      latitude: latitude,
      longitude: longitude,
      speed: speed,
      accuracy: accuracy,
      elevation: elevation,
      distance: distance,
      heading: heading,
      duration: duration,
    );
  }
}

/// Adapts the [PigeonComment] class to the corresponding class in the model.
extension PigeonCommentAdapter on PigeonComment {
  /// Converts a [PigeonComment] to a corresponding model class.
  Comment toModelImplementation() {
    return Comment(
      errorCode: errorCode,
      comment: comment,
    );
  }
}

/// Adapts the [PigeonAdvancedEnergyEstimation] class to the corresponding class in the model.
extension PigeonAdvancedEnergyEstimationAdapter
    on PigeonAdvancedEnergyEstimation {
  /// Converts a [PigeonAdvancedEnergyEstimation] to a corresponding model class.
  AdvancedEnergyEstimation toModelImplementation() {
    return AdvancedEnergyEstimation(
      energy: energy,
      energyConsumption: energyConsumption,
      energyOpti: energyOpti,
      energyOptiConsumption: energyOptiConsumption,
      duration: duration,
      distance: distance,
      contextId: contextId,
    );
  }
}

/// Adapts the [PigeonEnergyEstimation] class to the corresponding class in the model.
extension PigeonEnergyEstimationAdapter on PigeonEnergyEstimation {
  /// Converts a [PigeonEnergyEstimation] to a corresponding model class.
  EnergyEstimation toModelImplementation() {
    return EnergyEstimation(
      energy: energy,
      energyConsumption: energyConsumption,
      energyOpti: energyOpti,
      energyOptiConsumption: energyOptiConsumption,
    );
  }
}

/// Adapts the [PigeonItineraryStatistics] class to the corresponding class in the model.
extension PigeonItineraryStatisticsAdapter on PigeonItineraryStatistics {
  /// Converts a [PigeonItineraryStatistics] to a corresponding model class.
  ItineraryStatistics toModelImplementation() {
    return ItineraryStatistics(
      tripDuration: tripDuration,
      drivingDuration: drivingDuration,
      idlingDuration: idlingDuration,
      drivingPercentage: drivingPercentage,
      idlingPercentage: idlingPercentage,
      distance: distance,
      speedMean: speedMean,
      subdispNb: subdispNb,
      meteo: meteo,
      day: day,
      weekDay: weekDay,
      transportationMode: transportationMode,
    );
  }
}

/// Adapts the [PigeonCallEvent] class to the corresponding class in the model.
extension PigeonCallEventAdapter on PigeonCallEvent {
  /// Converts a [PigeonCallEvent] to a corresponding model class.
  CallEvent toModelImplementation() {
    return CallEvent(
      time: time,
      latitude: latitude,
      longitude: longitude,
      velocity: velocity,
      heading: heading,
      elevation: elevation,
      distance: distance,
      type: type,
      duration: duration,
      audioSystem: audioSystem,
      callType: callType,
      index: index,
      forbidden: forbidden,
    );
  }
}

/// Adapts the [PigeonPollutants] class to the corresponding class in the model.
extension PigeonPollutantsAdapter on PigeonPollutants {
  /// Converts a [PigeonPollutants] to a corresponding model class.
  Pollutants toModelImplementation() {
    return Pollutants(
      co: co,
      hc: hc,
      nox: nox,
      soot: soot,
    );
  }
}

/// Adapts the [PigeonTireWear] class to the corresponding class in the model.
extension PigeonTireWearAdapter on PigeonTireWear {
  /// Converts a [PigeonTireWear] to a corresponding model class.
  TireWear toModelImplementation() {
    return TireWear(
      frontTireAutonomy: frontTireAutonomy,
      frontTireDistance: frontTireDistance,
      frontTireTotalWear: frontTireTotalWear,
      frontTireWear: frontTireWear,
      frontTireWearRate: frontTireWearRate,
      rearTireAutonomy: rearTireAutonomy,
      rearTireDistance: rearTireDistance,
      rearTireTotalWear: rearTireTotalWear,
      rearTireWear: rearTireWear,
      rearTireWearRate: rearTireWearRate,
    );
  }
}

/// Adapts the [PigeonSafetyEvent] class to the corresponding class in the model.
extension PigeonSafetyEventAdapter on PigeonSafetyEvent {
  /// Converts a [PigeonSafetyEvent] to a corresponding model class.
  SafetyEvent toModelImplementation() {
    return SafetyEvent(
      time: time,
      longitude: longitude,
      latitude: latitude,
      velocity: velocity,
      heading: heading,
      elevation: elevation,
      distance: distance,
      type: type,
      level: level,
      value: value,
    );
  }
}

/// Adapts the [PigeonSpeedingEvents] class to the corresponding class in the model.
extension PigeonSpeedingEventsAdapter on PigeonSpeedingEvents {
  /// Converts a [PigeonSpeedingEvents] to a corresponding model class.
  SpeedingEvents toModelImplementation() {
    return SpeedingEvents(
      time: time,
      longitude: longitude,
      latitude: latitude,
      type: type,
      index: index,
    );
  }
}

/// Adapts the [PigeonPostLogbook] class to the corresponding class in the model.
extension PigeonPostLogbookAdapter on PigeonPostLogbook {
  /// Converts a [PigeonPostLogbook] to a corresponding model class.
  PostLogbook toModelImplementation() {
    return PostLogbook(
      status: status,
    );
  }
}

/// Adapts the [PigeonEcoDrivingContext] class to the corresponding class in the model.
extension PigeonEcoDrivingContextAdapter on PigeonEcoDrivingContext {
  /// Converts a [PigeonEcoDrivingContext] to a corresponding model class.
  EcoDrivingContext toModelImplementation() {
    return EcoDrivingContext(
      contextId: contextId,
      distance: distance,
      duration: duration,
      efficiencyScore: efficiencyScore,
      scoreAccel: scoreAccel,
      scoreMain: scoreMain,
      scoreDecel: scoreDecel,
    );
  }
}

/// Adapts the [PigeonFuelEstimationContext] class to the corresponding class in the model.
extension PigeonFuelEstimationContextAdapter on PigeonFuelEstimationContext {
  /// Converts a [PigeonFuelEstimationContext] to a corresponding model class.
  FuelEstimationContext toModelImplementation() {
    return FuelEstimationContext(
      contextId: contextId,
      distance: distance,
      duration: duration,
      co2Mass: co2Mass,
      co2Emission: co2Emission,
      fuelVolume: fuelVolume,
      fuelConsumption: fuelConsumption,
    );
  }
}

/// Adapts the [PigeonSafetyContext] class to the corresponding class in the model.
extension PigeonSafetyContextAdapter on PigeonSafetyContext {
  /// Converts a [PigeonSafetyContext] to a corresponding model class.
  SafetyContext toModelImplementation() {
    return SafetyContext(
      contextId: contextId,
      distance: distance,
      duration: duration,
      nbAdh: nbAdh,
      nbAccel: nbAccel,
      nbDecel: nbDecel,
      nbAdhCrit: nbAdhCrit,
      nbAccelCrit: nbAccelCrit,
      nbDecelCrit: nbDecelCrit,
      safetyScore: safetyScore,
    );
  }
}

/// Adapts the [PigeonSpeedLimitContext] class to the corresponding class in the model.
extension PigeonSpeedLimitContextAdapter on PigeonSpeedLimitContext {
  /// Converts a [PigeonSpeedLimitContext] to a corresponding model class.
  SpeedLimitContext toModelImplementation() {
    return SpeedLimitContext(
      speedLimit: speedLimit,
      distance: distance,
      duration: duration,
      speedingDistance: speedingDistance,
      speedingDuration: speedingDuration,
      score: score,
    );
  }
}

/// Adapts the [PigeonAccount] class to the corresponding class in the model.
extension PigeonAccountAdapter on PigeonAccount {
  /// Converts a [PigeonAccount] to a corresponding model class.
  Account toModelImplementation() {
    return Account(
      account: account,
      userId: userId,
      vehicleId: vehicleId,
    );
  }
}

/// Adapts the [PigeonSmartphoneData] class to the corresponding class in the model.
extension PigeonSmartphoneDataAdapter on PigeonSmartphoneData {
  /// Converts a [PigeonSmartphoneData] to a corresponding model class.
  SmartphoneData toModelImplementation() {
    return SmartphoneData(
      gpsDate: DateTime.fromMillisecondsSinceEpoch(gpsDate),
      phoneDate: DateTime.fromMillisecondsSinceEpoch(phoneDate),
      startMode: startMode,
      batteryPercent: batteryPercent,
      tripCut: tripCut,
      bluetoothEnabled: bluetoothEnabled,
      phoneModel: phoneModel,
      appBuildNumber: appBuildNumber,
      appVersion: appVersion,
      osVersion: osVersion,
      osType: osType,
      sdkVersion: sdkVersion,
      localTripId: localTripId,
    );
  }
}

/// Adapts the [PigeonPhoneCallRequest] class to the corresponding class in the model.
extension PigeonPhoneCallRequestAdapter on PigeonPhoneCallRequest {
  /// Converts a [PigeonPhoneCallRequest] to a corresponding model class.
  PhoneCallRequest toModelImplementation() {
    return PhoneCallRequest(
      start: start,
      end: end,
      status: status,
      audioSystem: audioSystem,
      audioInput: audioInput,
      audioOutput: audioOutput,
      audioName: audioName,
      proximity: proximity,
      bluetoothClass: bluetoothClass,
    );
  }
}

/// Adapts the [PigeonBrakeWear] class to the corresponding class in the model.
extension PigeonBrakeWearAdapter on PigeonBrakeWear {
  /// Converts a [PigeonBrakeWear] to a corresponding model class.
  BrakeWear toModelImplementation() {
    return BrakeWear(
      frontBrakeAutonomy: frontBrakeAutonomy,
      frontBrakeDistance: frontBrakeDistance,
      frontBrakePadWear: frontBrakePadWear,
      frontBrakeTotalWear: frontBrakeTotalWear,
      frontBrakeWearRate: frontBrakeWearRate,
      rearBrakeAutonomy: rearBrakeAutonomy,
      rearBrakeDistance: rearBrakeDistance,
      rearBrakePadWear: rearBrakePadWear,
      rearBrakeTotalWear: rearBrakeTotalWear,
      rearBrakeWearRate: rearBrakeWearRate,
    );
  }
}

/// Adapts the [PigeonEcoDriving] class to the corresponding class in the model.
extension PigeonEcoDrivingAdapter on PigeonEcoDriving {
  /// Converts a [PigeonEcoDriving] to a corresponding model class.
  EcoDriving toModelImplementation() {
    return EcoDriving(
      score: score,
      scoreAccel: scoreAccel,
      scoreMain: scoreMain,
      scoreDecel: scoreDecel,
      stdDevAccel: stdDevAccel,
      stdDevMain: stdDevMain,
      stdDevDecel: stdDevDecel,
      energyClass: energyClass,
    );
  }
}

/// Adapts the [PigeonFuelEstimation] class to the corresponding class in the model.
extension PigeonFuelEstimationAdapter on PigeonFuelEstimation {
  /// Converts a [PigeonFuelEstimation] to a corresponding model class.
  FuelEstimation toModelImplementation() {
    return FuelEstimation(
      co2Mass: co2Mass,
      co2Emission: co2Emission,
      fuelVolume: fuelVolume,
      fuelConsumption: fuelConsumption,
      idleFuelVolume: idleFuelVolume,
      idleFuelPercentage: idleFuelPercentage,
      idleFuelConsumption: idleFuelConsumption,
      idleCo2Emission: idleCo2Emission,
      idleCo2Mass: idleCo2Mass,
      engineTempStatus: engineTempStatus,
      coldFuelVolume: coldFuelVolume,
    );
  }
}

/// Adapts the [PigeonSafety] class to the corresponding class in the model.
extension PigeonSafetyAdapter on PigeonSafety {
  /// Converts a [PigeonSafety] to a corresponding model class.
  Safety toModelImplementation() {
    return Safety(
      nbAdh: nbAdh,
      nbAccel: nbAccel,
      nbDecel: nbDecel,
      nbAdhCrit: nbAdhCrit,
      nbAccelCrit: nbAccelCrit,
      nbDecelCrit: nbDecelCrit,
      safetyScore: safetyScore,
    );
  }
}

/// Adapts the [PigeonItineraryData] class to the corresponding class in the model.
extension PigeonItineraryDataAdapter on PigeonItineraryData {
  /// Converts a [PigeonItineraryData] to a corresponding model class.
  ItineraryData toModelImplementation() {
    return ItineraryData(
      startDate: startDate,
      endDate: endDate,
      departureCity: departureCity,
      arrivalCity: arrivalCity,
      departureAddress: departureAddress,
      arrivalAddress: arrivalAddress,
    );
  }
}

/// Adapts the [PigeonLogbook] class to the corresponding class in the model.
extension PigeonLogbookAdapter on PigeonLogbook {
  /// Converts a [PigeonLogbook] to a corresponding model class.
  Logbook toModelImplementation() {
    return Logbook(
      status: status,
      updateDate: updateDate,
    );
  }
}

/// Adapts the [PigeonSpeedingStatistics] class to the corresponding class in the model.
extension PigeonSpeedingStatisticsAdapter on PigeonSpeedingStatistics {
  /// Converts a [PigeonSpeedingStatistics] to a corresponding model class.
  SpeedingStatistics toModelImplementation() {
    return SpeedingStatistics(
      distance: distance,
      duration: duration,
      speedingDistance: speedingDistance,
      speedingDuration: speedingDuration,
      score: score,
      speedLimitContexts: speedLimitContexts
          .whereNotNull()
          .map((PigeonSpeedLimitContext e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonAdvancedSafety] class to the corresponding class in the model.
extension PigeonAdvancedSafetyAdapter on PigeonAdvancedSafety {
  /// Converts a [PigeonAdvancedSafety] to a corresponding model class.
  AdvancedSafety toModelImplementation() {
    return AdvancedSafety(
      safetyContext: safetyContext
          .whereNotNull()
          .map((PigeonSafetyContext e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonAdvancedEcoDriving] class to the corresponding class in the model.
extension PigeonAdvancedEcoDrivingAdapter on PigeonAdvancedEcoDriving {
  /// Converts a [PigeonAdvancedEcoDriving] to a corresponding model class.
  AdvancedEcoDriving toModelImplementation() {
    return AdvancedEcoDriving(
      ecoDrivingContext: ecoDrivingContext
          .whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonAdvancedFuelEstimation] class to the corresponding class in the model.
extension PigeonAdvancedFuelEstimationAdapter on PigeonAdvancedFuelEstimation {
  /// Converts a [PigeonAdvancedFuelEstimation] to a corresponding model class.
  AdvancedFuelEstimation toModelImplementation() {
    return AdvancedFuelEstimation(
      fuelEstimationContext: fuelEstimationContext
          .whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonRoute] class to the corresponding class in the model.
extension PigeonRouteAdapter on PigeonRoute {
  /// Converts a [PigeonRoute] to a corresponding model class.
  Route toModelImplementation() {
    return Route(
      gpsDate: gpsDate.whereNotNull().toList(),
      gpsVelocity: gpsVelocity.whereNotNull().toList(),
      longitude: longitude.whereNotNull().toList(),
      latitude: latitude.whereNotNull().toList(),
      gpsElevation: gpsElevation.whereNotNull().toList(),
      gpsAccuracy: gpsAccuracy.whereNotNull().toList(),
      gpsHeading: gpsHeading.whereNotNull().toList(),
      screenLocked: screenLocked.whereNotNull().toList(),
      activityValue: activityValue.whereNotNull().toList(),
      roll: roll.whereNotNull().toList(),
      pitch: pitch.whereNotNull().toList(),
      yaw: yaw.whereNotNull().toList(),
      gyroscopeNormVar: gyroscopeNormVar.whereNotNull().toList(),
    );
  }
}

/// Adapts the [PigeonPostGenericResponse] class to the corresponding class in the model.
extension PigeonPostGenericResponseAdapter on PigeonPostGenericResponse {
  /// Converts a [PigeonPostGenericResponse] to a corresponding model class.
  PostGenericResponse toModelImplementation() {
    return PostGenericResponse(
      status: status,
      itinId: itinId,
      comments: comments
          .whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      userId: userId,
      account: account?.toModelImplementation(),
      itineraryStatistics: itineraryStatistics?.toModelImplementation(),
      ecoDriving: ecoDriving?.toModelImplementation(),
      fuelEstimation: fuelEstimation?.toModelImplementation(),
      safety: safety?.toModelImplementation(),
      advancedEcoDriving: advancedEcoDriving?.toModelImplementation(),
      advancedFuelEstimation: advancedFuelEstimation?.toModelImplementation(),
      advancedSafety: advancedSafety?.toModelImplementation(),
      pollutants: pollutants?.toModelImplementation(),
      tireWear: tireWear?.toModelImplementation(),
      brakeWear: brakeWear?.toModelImplementation(),
      driverDistraction: driverDistraction
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      itineraryData: itineraryData?.toModelImplementation(),
      endDate: endDate != null
          ? DateTime.fromMillisecondsSinceEpoch(endDate!)
          : null,
      logbook: logbook?.toModelImplementation(),
      safetyEvents: safetyEvents
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      callEvents: callEvents
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      speedingEvents: speedingEvents
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      speedingStatistics: speedingStatistics?.toModelImplementation(),
      energyEstimation: energyEstimation?.toModelImplementation(),
      advancedEnergyEstimation: advancedEnergyEstimation
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonVehicle] class to the [Vehicle] class.
extension VehicleAdapter on PigeonVehicle {
  /// Converts a [PigeonVehicle] to a [Vehicle].
  Vehicle toModelImplementation() {
    return Vehicle(
      carTypeIndex: carTypeIndex,
      carEngineIndex: carEngineIndex,
      carPower: carPower,
      carMass: carMass,
      carGearboxIndex: carGearboxIndex,
      carConsumption: carConsumption,
      carAutoGearboxNumber: carAutoGearboxNumber,
      engineDisplacement: engineDisplacement,
      carPassengers: carPassengers,
      dqIndex: dqIndex,
      sra: sra,
      frontTireSize: frontTireSize,
      rearTireSize: rearTireSize,
      length: length,
      width: width,
      height: height,
      engineCylinderNb: engineCylinderNb,
      driveWheels: driveWheels,
    );
  }
}

/// Adapts the [PigeonPostGeneric] class to the [PostGeneric] class.
extension PigeonPostGenericAdapter on PigeonPostGeneric {
  /// Converts a [PigeonPostGeneric] to a [PostGeneric].
  PostGeneric toModelImplementation() {
    return PostGeneric(
      route: route.toModelImplementation(),
      account: account.toModelImplementation(),
      smartphoneData: smartphoneData.toModelImplementation(),
      vehicle: vehicle.toModelImplementation(),
      itineraryData: itineraryData.toModelImplementation(),
      metaData: convertMetadata(metaData),
      phoneCalls: phoneCalls
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      logbook: logbook?.toModelImplementation(),
    );
  }
}

/// Convert a the metadata map from pigeon to a map of non-nullable strings.
Map<String, String>? convertMetadata(Map<String?, String?>? input) {
  if (input == null) {
    return null;
  }

  final result = <String, String>{};
  input.forEach((key, value) {
    if (key != null && value != null) {
      result[key] = value;
    }
  });

  return result;
}

/// Adapts the [PigeonDriverDistraction] class to the corresponding class in the model.
extension PigeonDriverDistractionAdapter on PigeonDriverDistraction {
  /// Converts a [PigeonDriverDistraction] to a corresponding model class.
  DriverDistraction toModelImplementation() {
    return DriverDistraction(
      nbUnlock: nbUnlock,
      durationUnlock: durationUnlock,
      durationPercentUnlock: durationPercentUnlock,
      distanceUnlock: distanceUnlock,
      distancePercentUnlock: distancePercentUnlock,
      score: score,
      scoreUnlock: scoreUnlock,
      scoreCall: scoreCall,
      calls:
          calls?.whereNotNull().map((e) => e.toModelImplementation()).toList(),
    );
  }
}

/// Adapts the [PigeonCall] class to the corresponding class in the model.
extension PigeonCallAdapter on PigeonCall {
  /// Converts a [PigeonCall] to a corresponding model class.
  Call toModelImplementation() {
    return Call(
      id: id,
      start: start,
      end: end,
      durationS: durationS,
      duration: duration,
      distanceM: distanceM,
      distance: distance,
      status: status,
      audioSystem: audioSystem,
      audioInput: audioInput,
      audioOutput: audioOutput,
      audioName: audioName,
      bluetoothClass: bluetoothClass,
      forbidden: forbidden,
    );
  }
}
