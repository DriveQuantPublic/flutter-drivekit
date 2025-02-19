import 'package:collection/collection.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// Adapts the [PigeonDKCrashInfo] class to the [DKCrashInfo] class.
extension PigeonDKCrashInfoAdapter on PigeonDKCrashInfo {
  /// Converts a [PigeonDKCrashInfo] to a [DKCrashInfo].
  DKCrashInfo toModelImplementation() {
    return DKCrashInfo(
      crashId: crashId,
      date: date,
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

/// Adapts the [PigeonDKCrashFeedbackType] class to the [DKCrashFeedbackType]
/// class.
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

/// Adapts the [PigeonDKCrashFeedbackSeverity] class to the
/// [DKCrashFeedbackSeverity] class.
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
      PigeonCancelTrip.noBluetoothDevice => CancelTrip.noBluetoothDevice,
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

/// Adapts the [PigeonAdvancedEnergyEstimation] class to the corresponding
/// class in the model.
extension PigeonAdvancedEnergyEstimationAdapter
    on PigeonAdvancedEnergyEstimation {
  /// Converts a [PigeonAdvancedEnergyEstimation] to a corresponding model class
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

/// Adapts the [PigeonEnergyEstimation] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonSafetyEvent] class to the corresponding class in the model
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

/// Adapts the [PigeonEcoDrivingContext] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonFuelEstimationContext] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonSafetyContext] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonSpeedLimitContext] class to the corresponding class in
/// the model.
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

/// Adapts the [PigeonFuelEstimation] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonSpeedingStatistics] class to the corresponding class
/// in the model.
extension PigeonSpeedingStatisticsAdapter on PigeonSpeedingStatistics {
  /// Converts a [PigeonSpeedingStatistics] to a corresponding model class.
  SpeedingStatistics toModelImplementation() {
    return SpeedingStatistics(
      distance: distance,
      duration: duration,
      speedingDistance: speedingDistance,
      speedingDuration: speedingDuration,
      score: score,
    );
  }
}

/// Adapts the [PigeonAdvancedSafety] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonAdvancedEcoDriving] class to the corresponding class in
/// the model.
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

/// Adapts the [PigeonAdvancedFuelEstimation] class to the corresponding class
/// in the model.
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

/// Convert the metadata map from pigeon to a map of non-nullable strings.
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

/// Adapts the [PigeonDriverDistraction] class to the corresponding class
/// in the model.
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
      duration: duration,
      durationPercent: durationPercent,
      distance: distance,
      distancePercent: distancePercent,
      type: type,
      audioSystem: audioSystem,
      audioInput: audioInput,
      audioOutput: audioOutput,
      audioName: audioName,
      bluetoothClass: bluetoothClass,
      isForbidden: isForbidden,
    );
  }
}

/// Adapts the [PigeonTripResponseStatus] class to the corresponding class
extension PigeonTripResponseStatusAdapter on PigeonTripResponseStatus {
  /// Converts a [PigeonTripResponseStatus] to a corresponding model class.
  TripResponseStatus toModelImplementation() {
    return TripResponseStatus(
      status: status.toModelImplementation(),
      itinId: itinId,
      hasSafetyAndEcoDrivingScore: hasSafetyAndEcoDrivingScore,
      info: info.whereNotNull().map((e) => e.toModelImplementation()).toList(),
      error: error?.toModelImplementation(),
      trip: trip?.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonTripResponseInfo] class to the corresponding class
extension PigeonTripResponseInfoAdapter on PigeonTripResponseInfo {
  /// Converts a [PigeonTripResponseInfo] to a corresponding model class.
  TripResponseInfo toModelImplementation() {
    switch (this) {
      case PigeonTripResponseInfo.engineSpeedNotAvailable:
        return TripResponseInfo.engineSpeedNotAvailable;
      case PigeonTripResponseInfo.engineSpeedIsNull:
        return TripResponseInfo.engineSpeedIsNull;
      case PigeonTripResponseInfo.noVehicleCharacteristics:
        return TripResponseInfo.noVehicleCharacteristics;
      case PigeonTripResponseInfo.dataLoss:
        return TripResponseInfo.dataLoss;
      case PigeonTripResponseInfo.distanceTooShort:
        return TripResponseInfo.distanceTooShort;
      case PigeonTripResponseInfo.invalidVehicleCharacteristics:
        return TripResponseInfo.invalidVehicleCharacteristics;
      case PigeonTripResponseInfo.invalidVehicleId:
        return TripResponseInfo.invalidVehicleId;
    }
  }
}

/// Adapts the [PigeonTripResponseStatusType] enum to the corresponding enum
extension PigeonTripResponseStatusTypeAdapter on PigeonTripResponseStatusType {
  /// Converts a [PigeonTripResponseStatusType] to a corresponding model enum.
  TripResponseStatusType toModelImplementation() {
    switch (this) {
      case PigeonTripResponseStatusType.tripValid:
        return TripResponseStatusType.tripValid;
      case PigeonTripResponseStatusType.tripError:
        return TripResponseStatusType.tripError;
    }
  }
}

/// Adapts the [PigeonTripResponseError] enum to the corresponding enum
extension PigeonTripResponseErrorAdapter on PigeonTripResponseError {
  /// Converts a [PigeonTripResponseError] to a corresponding model enum.
  TripResponseError toModelImplementation() {
    switch (this) {
      case PigeonTripResponseError.accountLimitReached:
        return TripResponseError.accountLimitReached;
      case PigeonTripResponseError.dataError:
        return TripResponseError.dataError;
      case PigeonTripResponseError.noAccountSet:
        return TripResponseError.noAccountSet;
      case PigeonTripResponseError.noRouteObjectFound:
        return TripResponseError.noRouteObjectFound;
      case PigeonTripResponseError.invalidRouteDefinition:
        return TripResponseError.invalidRouteDefinition;
      case PigeonTripResponseError.noVelocityData:
        return TripResponseError.noVelocityData;
      case PigeonTripResponseError.invalidSamplingPeriod:
        return TripResponseError.invalidSamplingPeriod;
      case PigeonTripResponseError.invalidCustomerId:
        return TripResponseError.invalidCustomerId;
      case PigeonTripResponseError.noDateFound:
        return TripResponseError.noDateFound;
      case PigeonTripResponseError.maxDailyRequestNumberReached:
        return TripResponseError.maxDailyRequestNumberReached;
      case PigeonTripResponseError.invalidRouteVectors:
        return TripResponseError.invalidRouteVectors;
      case PigeonTripResponseError.missingBeacon:
        return TripResponseError.missingBeacon;
      case PigeonTripResponseError.invalidBeacon:
        return TripResponseError.invalidBeacon;
      case PigeonTripResponseError.duplicateTrip:
        return TripResponseError.duplicateTrip;
      case PigeonTripResponseError.insufficientGpsData:
        return TripResponseError.insufficientGpsData;
      case PigeonTripResponseError.userDisabled:
        return TripResponseError.userDisabled;
      case PigeonTripResponseError.invalidUser:
        return TripResponseError.invalidUser;
      case PigeonTripResponseError.invalidGpsData:
        return TripResponseError.invalidGpsData;
      case PigeonTripResponseError.invalidTrip:
        return TripResponseError.invalidTrip;
      case PigeonTripResponseError.unknownError:
        return TripResponseError.unknownError;
    }
  }
}

/// Adapts the [PigeonTripResponseInfoItem] class to the corresponding enum
extension PigeonTripResponseInfoItemAdapter on PigeonTripResponseInfoItem {
  /// Converts a [PigeonTripResponseInfoItem] to a corresponding model class.
  TripResponseInfo toModelImplementation() {
    return info.toModelImplementation();
  }
}

/// Adapts the [PigeonTrip] class to the corresponding class
/// in the model.
extension PigeonTripAdapter on PigeonTrip {
  /// Converts a [PigeonTrip] to a corresponding model class.
  Trip toModelImplementation() {
    return Trip(
      itinId: itinId,
      tripStatistics: tripStatistics?.toModelImplementation(),
      ecoDriving: ecoDriving?.toModelImplementation(),
      fuelEstimation: fuelEstimation?.toModelImplementation(),
      safety: safety?.toModelImplementation(),
      advancedEcoDriving: advancedEcoDriving?.toModelImplementation(),
      advancedFuelEstimation: advancedFuelEstimation?.toModelImplementation(),
      advancedSafety: advancedSafety?.toModelImplementation(),
      pollutants: pollutants?.toModelImplementation(),
      tireWear: tireWear?.toModelImplementation(),
      brakeWear: brakeWear?.toModelImplementation(),
      driverDistraction: driverDistraction?.toModelImplementation(),
      endDate: endDate,
      logbook: logbook?.toModelImplementation(),
      safetyEvents: safetyEvents
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      speedingStatistics: speedingStatistics?.toModelImplementation(),
      energyEstimation: energyEstimation?.toModelImplementation(),
      advancedEnergyEstimation: advancedEnergyEstimation
          ?.whereNotNull()
          .map((e) => e.toModelImplementation())
          .toList(),
      startDate: startDate,
      departureCity: departureCity,
      arrivalCity: arrivalCity,
      departureAddress: departureAddress,
      arrivalAddress: arrivalAddress,
      vehicleId: vehicleId,
      metaData: convertMetadata(metadata),
      transportationMode: transportationMode,
      unscored: unscored,
      calls:
          calls?.whereNotNull().map((e) => e.toModelImplementation()).toList(),
      speedLimitContexts: speedLimitContexts
          ?.whereNotNull()
          .map((PigeonSpeedLimitContext e) => e.toModelImplementation())
          .toList(),
    );
  }
}

/// Adapts the [PigeonTripStatistics] class to the corresponding class in
/// the model.
extension PigeonTripStatisticsAdapter on PigeonTripStatistics {
  /// Converts a [PigeonTripStatistics] to a corresponding model class.
  TripStatistics toModelImplementation() {
    return TripStatistics(
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
    );
  }
}

/// Adapts the [PigeonCurrentTripInfo] class to the corresponding class in
/// the model.
extension PigeonCurrentTripInfoAdapter on PigeonCurrentTripInfo {
  /// Converts a [PigeonCurrentTripInfo] to a corresponding model class.
  CurrentTripInfo? toModelImplementation() {
    return CurrentTripInfo(
      localTripId: localTripId,
      date: date,
      startMode: startMode.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonLastTripLocation] class to the corresponding class in
/// the model.
extension PigeonLastTripLocationAdapter on PigeonLastTripLocation {
  /// Converts a [PigeonLastTripLocation] to a corresponding model class.
  LastTripLocation? toModelImplementation() {
    return LastTripLocation(
      date: date,
      latitude: latitude,
      longitude: longitude,
      accuracyMeter: accuracyMeter,
      accuracyLevel: accuracyLevel.toModelImplementation(),
    );
  }
}

/// Adapt the [PigeonAccuracyLevel] class to the [AccuracyLevel] class.
extension PigeonAccuracyLevelAdapter on PigeonAccuracyLevel {
  /// Converts a [PigeonStartMode] to a [StartMode].
  AccuracyLevel toModelImplementation() {
    return switch (this) {
      PigeonAccuracyLevel.good => AccuracyLevel.good,
      PigeonAccuracyLevel.fair => AccuracyLevel.fair,
      PigeonAccuracyLevel.poor => AccuracyLevel.poor,
    };
  }
}

/// Adapts the [PigeonTripRecordingStartedState] class to the corresponding
/// class in the model.
extension PigeonTripRecordingStartedStateAdapter
    on PigeonTripRecordingStartedState {
  /// Converts a [PigeonTripRecordingStartedState] to a corresponding class.
  DKTripRecordingStartedState toModelImplementation() {
    return DKTripRecordingStartedState(
      localTripId: localTripId,
      recordingStartDate: recordingStartDate,
      startMode: startMode.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonTripRecordingConfirmedState] class to the corresponding
/// class in the model.
extension PigeonTripRecordingConfirmedStateAdapter
    on PigeonTripRecordingConfirmedState {
  /// Converts a [PigeonTripRecordingConfirmedState] to a corresponding class.
  DKTripRecordingConfirmedState toModelImplementation() {
    return DKTripRecordingConfirmedState(
      localTripId: localTripId,
      recordingStartDate: recordingStartDate,
      startMode: startMode.toModelImplementation(),
      recordingConfirmationDate: recordingConfirmationDate,
    );
  }
}

/// Adapts the [PigeonTripRecordingCanceledState] class to the corresponding
/// class in the model.
extension PigeonTripRecordingCanceledStateAdapter
    on PigeonTripRecordingCanceledState {
  /// Converts a [PigeonTripRecordingCanceledState] to a corresponding class.
  DKTripRecordingCanceledState toModelImplementation() {
    return DKTripRecordingCanceledState(
      localTripId: localTripId,
      recordingStartDate: recordingStartDate,
      startMode: startMode.toModelImplementation(),
      recordingConfirmationDate: recordingConfirmationDate,
      cancelationReason: cancelationReason.toModelImplementation(),
    );
  }
}

/// Adapt [PigeonTripCancelationReason] class to [DKTripCancelationReason] class
extension PigeonTripCancelationReasonAdapter on PigeonTripCancelationReason {
  /// Converts a [PigeonTripCancelationReason] to a [DKTripCancelationReason].
  DKTripCancelationReason toModelImplementation() {
    return switch (this) {
      PigeonTripCancelationReason.user => DKTripCancelationReason.user,
      PigeonTripCancelationReason.highSpeed =>
        DKTripCancelationReason.highSpeed,
      PigeonTripCancelationReason.noSpeed => DKTripCancelationReason.noSpeed,
      PigeonTripCancelationReason.noBeacon => DKTripCancelationReason.noBeacon,
      PigeonTripCancelationReason.missingConfiguration =>
        DKTripCancelationReason.missingConfiguration,
      PigeonTripCancelationReason.noLocationData =>
        DKTripCancelationReason.noLocationData,
      PigeonTripCancelationReason.reset => DKTripCancelationReason.reset,
      PigeonTripCancelationReason.beaconNoSpeed =>
        DKTripCancelationReason.beaconNoSpeed,
      PigeonTripCancelationReason.noBluetoothDevice =>
        DKTripCancelationReason.noBluetoothDevice,
      PigeonTripCancelationReason.bluetoothDeviceNoSpeed =>
        DKTripCancelationReason.bluetoothDeviceNoSpeed,
      PigeonTripCancelationReason.appKilled =>
        DKTripCancelationReason.appKilled,
    };
  }
}

/// Adapts the [PigeonTripRecordingFinishedState] class to the corresponding
/// class in the model.
extension PigeonTripRecordingFinishedStateAdapter
    on PigeonTripRecordingFinishedState {
  /// Converts a [PigeonTripRecordingFinishedState] to a corresponding class.
  DKTripRecordingFinishedState toModelImplementation() {
    return DKTripRecordingFinishedState(
      localTripId: localTripId,
      recordingStartDate: recordingStartDate,
      startMode: startMode.toModelImplementation(),
      recordingConfirmationDate: recordingConfirmationDate,
      recordingEndDate: recordingEndDate,
    );
  }
}

/// Adapts the [PigeonCreateTripSharingLinkResponse] class to the corresponding
/// class in the model.
extension PigeonCreateTripSharingLinkResponseAdapter
    on PigeonCreateTripSharingLinkResponse {
  /// Converts a [PigeonCreateTripSharingLinkResponse] to a corresponding model
  /// class.
  CreateTripSharingLinkResponse toModelImplementation() {
    return CreateTripSharingLinkResponse(
      status: status.toModelImplementation(),
      data: data?.toModelImplementation(),
    );
  }
}

/// Adapt the [PigeonCreateTripSharingLinkStatus] class to
/// the [CreateTripSharingLinkStatus] class.
extension PigeonCreateTripSharingLinkStatusAdapter
    on PigeonCreateTripSharingLinkStatus {
  /// Converts a [PigeonCreateTripSharingLinkStatus] to
  /// a [CreateTripSharingLinkStatus].
  CreateTripSharingLinkStatus toModelImplementation() {
    return switch (this) {
      PigeonCreateTripSharingLinkStatus.success =>
        CreateTripSharingLinkStatus.success,
      PigeonCreateTripSharingLinkStatus.activeLinkAlreadyExists =>
        CreateTripSharingLinkStatus.activeLinkAlreadyExists,
      PigeonCreateTripSharingLinkStatus.error =>
        CreateTripSharingLinkStatus.error,
      PigeonCreateTripSharingLinkStatus.userNotConnected =>
        CreateTripSharingLinkStatus.userNotConnected,
      PigeonCreateTripSharingLinkStatus.invalidDuration =>
        CreateTripSharingLinkStatus.invalidDuration,
      PigeonCreateTripSharingLinkStatus.unauthenticated =>
        CreateTripSharingLinkStatus.unauthenticated,
      PigeonCreateTripSharingLinkStatus.forbidden =>
        CreateTripSharingLinkStatus.forbidden,
    };
  }
}

/// Adapts the [PigeonTripSharingLink] class to the corresponding class in
/// the model.
extension PigeonTripSharingLinkAdapter on PigeonTripSharingLink {
  /// Converts a [PigeonTripSharingLink] to a corresponding model class.
  DKTripSharingLink? toModelImplementation() {
    return DKTripSharingLink(
      code: code,
      url: url,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

/// Adapts the [PigeonGetTripSharingLinkResponse] class to the corresponding
/// class in the model.
extension PigeonGetTripSharingLinkResponseAdapter
    on PigeonGetTripSharingLinkResponse {
  /// Converts a [PigeonGetTripSharingLinkResponse] to a corresponding model
  /// class.
  GetTripSharingLinkResponse toModelImplementation() {
    return GetTripSharingLinkResponse(
      status: status.toModelImplementation(),
      data: data?.toModelImplementation(),
    );
  }
}

/// Adapt the [PigeonGetTripSharingLinkStatus] class to
/// the [GetTripSharingLinkStatus] class.
extension PigeonGetTripSharingLinkStatusAdapter
    on PigeonGetTripSharingLinkStatus {
  /// Converts a [PigeonGetTripSharingLinkStatus] to
  /// a [GetTripSharingLinkStatus].
  GetTripSharingLinkStatus toModelImplementation() {
    return switch (this) {
      PigeonGetTripSharingLinkStatus.success =>
        GetTripSharingLinkStatus.success,
      PigeonGetTripSharingLinkStatus.failedToGetCacheOnly =>
        GetTripSharingLinkStatus.failedToGetCacheOnly,
      PigeonGetTripSharingLinkStatus.noActiveLink =>
        GetTripSharingLinkStatus.noActiveLink,
      PigeonGetTripSharingLinkStatus.userNotConnected =>
        GetTripSharingLinkStatus.userNotConnected,
      PigeonGetTripSharingLinkStatus.unauthenticated =>
        GetTripSharingLinkStatus.unauthenticated,
      PigeonGetTripSharingLinkStatus.forbidden =>
        GetTripSharingLinkStatus.forbidden,
    };
  }
}

/// Adapt the [PigeonRevokeTripSharingLinkStatus] class to
/// the [RevokeTripSharingLinkStatus] class.
extension PigeonRevokeTripSharingLinkStatusAdapter
    on PigeonRevokeTripSharingLinkStatus {
  /// Converts a [PigeonRevokeTripSharingLinkStatus] to
  /// a [RevokeTripSharingLinkStatus].
  RevokeTripSharingLinkStatus toModelImplementation() {
    return switch (this) {
      PigeonRevokeTripSharingLinkStatus.success =>
        RevokeTripSharingLinkStatus.success,
      PigeonRevokeTripSharingLinkStatus.noActiveLink =>
        RevokeTripSharingLinkStatus.noActiveLink,
      PigeonRevokeTripSharingLinkStatus.error =>
        RevokeTripSharingLinkStatus.error,
      PigeonRevokeTripSharingLinkStatus.userNotConnected =>
        RevokeTripSharingLinkStatus.userNotConnected,
      PigeonRevokeTripSharingLinkStatus.unauthenticated =>
        RevokeTripSharingLinkStatus.unauthenticated,
      PigeonRevokeTripSharingLinkStatus.forbidden =>
        RevokeTripSharingLinkStatus.forbidden,
    };
  }
}
