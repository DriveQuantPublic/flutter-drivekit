import 'package:collection/collection.dart';
import 'package:flutter_drivekit_driver_data_ios/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// Adapts the [PigeonAdvancedEnergyEstimation] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonEnergyEstimation] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonEcoDrivingContext] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonSafetyContext] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonSpeedLimitContext] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonItineraryData] class to the corresponding class in the
/// model.
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

/// Adapts the [PigeonAdvancedSafety] class to the corresponding class
/// in the model.
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

/// Adapts the [PigeonAdvancedEcoDriving] class to the corresponding class
/// in the model.
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
      itineraryData: itineraryData?.toModelImplementation(),
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
      metaData: convertMetadata(metaData),
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

/// Adapts the [PigeonTripSyncStatus] enum to the corresponding model enum
extension PigeonTripSyncStatusAdapter on PigeonTripSyncStatus {
  /// Converts a [PigeonTripSyncStatus] to a corresponding model enum.
  TripSyncStatus toModelImplementation() {
    switch (this) {
      case PigeonTripSyncStatus.success:
        return TripSyncStatus.success;
      case PigeonTripSyncStatus.cacheDataOnly:
        return TripSyncStatus.cacheDataOnly;
      case PigeonTripSyncStatus.failedToSyncTripsCacheOnly:
        return TripSyncStatus.failedToSyncTripsCacheOnly;
      case PigeonTripSyncStatus.syncAlreadyInProgress:
        return TripSyncStatus.syncAlreadyInProgress;
      case PigeonTripSyncStatus.failedToSyncSafetyEvents:
        return TripSyncStatus.failedToSyncSafetyEvents;
    }
  }
}

/// Adapts the [PigeonGetTripsResponse] class to
/// the corresponding class in the model.
extension PigeonGetTripsResponseAdapter on PigeonGetTripsResponse {
  /// Converts a [PigeonGetTripsResponse] to a corresponding model class.
  GetTripsResponse toModelImplementation() {
    return GetTripsResponse(
      status: status.toModelImplementation(),
      trips:
          trips.whereNotNull().map((e) => e.toModelImplementation()).toList(),
    );
  }
}

/// Adapts the [PigeonGetTripResponse] class to
/// the corresponding class in the model.
extension PigeonGetTripResponseAdapter on PigeonGetTripResponse {
  /// Converts a [PigeonGetTripResponse] to a corresponding model class.
  GetTripResponse toModelImplementation() {
    return GetTripResponse(
      status: status.toModelImplementation(),
      trip: trip?.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonTripAdviceData] class to the corresponding model class
extension PigeonTripAdviceDataAdapter on PigeonTripAdviceData {
  /// Converts a [PigeonTripAdviceData] to a corresponding model class.
  TripAdviceData toModelImplementation() {
    return TripAdviceData(
      id: id,
      title: title,
      message: message,
      messageId: messageId,
      theme: theme,
      adviceEvaluation: adviceEvaluation?.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonManeuverData] class to the corresponding model class
extension PigeonManeuverDataAdapter on PigeonManeuverData {
  /// Converts a [PigeonManeuverData] to a corresponding model class.
  ManeuverData toModelImplementation() {
    return ManeuverData(
      nbStraightReverseDrivings: nbStraightReverseDrivings,
      nbCurveReverseDrivings: nbCurveReverseDrivings,
      nbTurns: nbTurns,
      nbHillStarts: nbHillStarts,
      nbRoundAbouts: nbRoundAbouts,
      nbEmergencyStops: nbEmergencyStops,
      nbAngledParkings: nbAngledParkings,
      nbParallelParkings: nbParallelParkings,
      nbBayParkings: nbBayParkings,
    );
  }
}

/// Adapts the [PigeonEvaluationData] class to the corresponding model class
extension PigeonEvaluationDataAdapter on PigeonEvaluationData {
  /// Converts a [PigeonEvaluationData] to a corresponding model class.
  EvaluationData toModelImplementation() {
    return EvaluationData(
      comment: comment,
      evaluation: evaluation,
    );
  }
}

/// Adapts the [PigeonDeclaredTransportationMode] class to the corresponding
/// class in the model.
extension PigeonDeclaredTransportationModeAdapter
    on PigeonDeclaredTransportationMode {
  /// Converts a [PigeonDeclaredTransportationMode] to a corresponding class
  DeclaredTransportationMode toModelImplementation() {
    return DeclaredTransportationMode(
      transportationMode: transportationMode,
      comment: comment,
      passenger: passenger,
    );
  }
}

/// Adapts the [PigeonTripAdviceEvaluation] class to the corresponding class
extension PigeonTripAdviceEvaluationAdapter on PigeonTripAdviceEvaluation {
  /// Converts a [PigeonTripAdviceEvaluation] to a corresponding model class.
  TripAdviceEvaluation toModelImplementation() {
    return TripAdviceEvaluation(
      evaluation: evaluation,
      feedback: feedback,
      comment: comment,
    );
  }
}

/// Adapts the [PigeonRoute] class to the corresponding class in the model.
extension PigeonRouteAdapter on PigeonRoute {
  /// Converts a [PigeonRoute] to a corresponding model class.
  Route toModelImplementation() {
    return Route(
      callIndex: callIndex?.toList(),
      callTime: callTime?.toList(),
      itinId: itinId,
      latitude: latitude?.toList(),
      longitude: longitude?.toList(),
      screenLockedIndex: screenLockedIndex?.toList(),
      screenLockedTime: screenLockedTime?.toList(),
      speedingIndex: speedingIndex?.toList(),
      speedingTime: speedingTime?.toList(),
    );
  }
}

/// Adapts the [PigeonGetRouteResponse] class to
/// the corresponding class in the model.
extension PigeonGetRouteResponseAdapter on PigeonGetRouteResponse {
  /// Converts a [PigeonGetRouteResponse] to a corresponding model class.
  GetRouteResponse toModelImplementation() {
    return GetRouteResponse(
      status: status.toModelImplementation(),
      route: route?.toModelImplementation(),
    );
  }
}

/// Adapts the [PigeonRouteSyncStatus] enum to the corresponding model enum
extension PigeonRouteSyncStatusAdapter on PigeonRouteSyncStatus {
  /// Converts a [PigeonRouteSyncStatus] to a corresponding model enum.
  RouteSyncStatus toModelImplementation() {
    switch (this) {
      case PigeonRouteSyncStatus.success:
        return RouteSyncStatus.success;
      case PigeonRouteSyncStatus.failedToRetrieveRoute:
        return RouteSyncStatus.failedToRetrieveRoute;
      case PigeonRouteSyncStatus.wrongItinId:
        return RouteSyncStatus.wrongItinId;
    }
  }
}
