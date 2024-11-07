import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

/// Adapts the [Vehicle] class to the [PigeonVehicle] class.
extension VehicleAdapter on Vehicle {
  /// Converts a [Vehicle] to a [PigeonVehicle].
  PigeonVehicle toPigeonImplementation() {
    return PigeonVehicle(
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

/// Adapts the [AdvancedEnergyEstimation] class to the corresponding Pigeon
extension AdvancedEnergyEstimationAdapter on AdvancedEnergyEstimation {
  /// Converts a [AdvancedEnergyEstimation] to a corresponding Pigeon
  PigeonAdvancedEnergyEstimation toPigeonImplementation() {
    return PigeonAdvancedEnergyEstimation(
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

/// Adapts the [EnergyEstimation] class to the corresponding Pigeon
extension EnergyEstimationAdapter on EnergyEstimation {
  /// Converts a [EnergyEstimation] to a corresponding Pigeon
  PigeonEnergyEstimation toPigeonImplementation() {
    return PigeonEnergyEstimation(
      energy: energy,
      energyConsumption: energyConsumption,
      energyOpti: energyOpti,
      energyOptiConsumption: energyOptiConsumption,
    );
  }
}

/// Adapts the [Pollutants] class to the corresponding Pigeon
extension PollutantsAdapter on Pollutants {
  /// Converts a [Pollutants] to a corresponding Pigeon
  PigeonPollutants toPigeonImplementation() {
    return PigeonPollutants(
      co: co,
      hc: hc,
      nox: nox,
      soot: soot,
    );
  }
}

/// Adapts the [TireWear] class to the corresponding Pigeon
extension TireWearAdapter on TireWear {
  /// Converts a [TireWear] to a corresponding Pigeon
  PigeonTireWear toPigeonImplementation() {
    return PigeonTireWear(
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

/// Adapts the [SafetyEvent] class to the corresponding Pigeon
extension SafetyEventAdapter on SafetyEvent {
  /// Converts a [SafetyEvent] to a corresponding Pigeon
  PigeonSafetyEvent toPigeonImplementation() {
    return PigeonSafetyEvent(
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

/// Adapts the [EcoDrivingContext] class to the corresponding Pigeon
extension EcoDrivingContextAdapter on EcoDrivingContext {
  /// Converts a [EcoDrivingContext] to a corresponding Pigeon
  PigeonEcoDrivingContext toPigeonImplementation() {
    return PigeonEcoDrivingContext(
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

/// Adapts the [FuelEstimationContext] class to the corresponding Pigeon
extension FuelEstimationContextAdapter on FuelEstimationContext {
  /// Converts a [FuelEstimationContext] to a corresponding Pigeon
  PigeonFuelEstimationContext toPigeonImplementation() {
    return PigeonFuelEstimationContext(
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

/// Adapts the [SafetyContext] class to the corresponding Pigeon
extension SafetyContextAdapter on SafetyContext {
  /// Converts a [SafetyContext] to a corresponding Pigeon
  PigeonSafetyContext toPigeonImplementation() {
    return PigeonSafetyContext(
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

/// Adapts the [SpeedLimitContext] class to the corresponding Pigeon
extension SpeedLimitContextAdapter on SpeedLimitContext {
  /// Converts a [SpeedLimitContext] to a corresponding Pigeon
  PigeonSpeedLimitContext toPigeonImplementation() {
    return PigeonSpeedLimitContext(
      speedLimit: speedLimit,
      distance: distance,
      duration: duration,
      speedingDistance: speedingDistance,
      speedingDuration: speedingDuration,
      score: score,
    );
  }
}

/// Adapts the [BrakeWear] class to the corresponding class Pigeon
extension BrakeWearAdapter on BrakeWear {
  /// Converts a [BrakeWear] to a corresponding Pigeon
  PigeonBrakeWear toPigeonImplementation() {
    return PigeonBrakeWear(
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

/// Adapts the [EcoDriving] class to the corresponding Pigeon
extension EcoDrivingAdapter on EcoDriving {
  /// Converts a [EcoDriving] to a corresponding model class.
  PigeonEcoDriving toPigeonImplementation() {
    return PigeonEcoDriving(
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

/// Adapts the [FuelEstimation] class to the corresponding Pigeon
extension FuelEstimationAdapter on FuelEstimation {
  /// Converts a [FuelEstimation] to a corresponding Pigeon
  PigeonFuelEstimation toPigeonImplementation() {
    return PigeonFuelEstimation(
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

/// Adapts the [Safety] class to the corresponding Pigeon
extension SafetyAdapter on Safety {
  /// Converts a [Safety] to a corresponding Pigeon
  PigeonSafety toPigeonImplementation() {
    return PigeonSafety(
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

/// Adapts the [Logbook] class to the corresponding Pigeon
extension LogbookAdapter on Logbook {
  /// Converts a [Logbook] to a corresponding Pigeon
  PigeonLogbook toPigeonImplementation() {
    return PigeonLogbook(
      status: status,
      updateDate: updateDate,
    );
  }
}

/// Adapts the [SpeedingStatistics] class to the Pigeon
extension SpeedingStatisticsAdapter on SpeedingStatistics {
  /// Converts a [SpeedingStatistics] to a corresponding Pigeon
  PigeonSpeedingStatistics toPigeonImplementation() {
    return PigeonSpeedingStatistics(
      distance: distance,
      duration: duration,
      speedingDistance: speedingDistance,
      speedingDuration: speedingDuration,
      score: score,
    );
  }
}

/// Adapts the [AdvancedSafety] class to the corresponding Pigeon
extension AdvancedSafetyAdapter on AdvancedSafety {
  /// Converts a [AdvancedSafety] to a corresponding model class.
  PigeonAdvancedSafety toPigeonImplementation() {
    return PigeonAdvancedSafety(
      safetyContext: safetyContext
          .map((SafetyContext e) => e.toPigeonImplementation())
          .toList(),
    );
  }
}

/// Adapts the [AdvancedEcoDriving] class to the corresponding Pigeon
extension AdvancedEcoDrivingAdapter on AdvancedEcoDriving {
  /// Converts a [AdvancedEcoDriving] to a corresponding Pigeon
  PigeonAdvancedEcoDriving toPigeonImplementation() {
    return PigeonAdvancedEcoDriving(
      ecoDrivingContext:
          ecoDrivingContext.map((e) => e.toPigeonImplementation()).toList(),
    );
  }
}

/// Adapts the [AdvancedFuelEstimation] class to the corresponding Pigeon
extension AdvancedFuelEstimationAdapter on AdvancedFuelEstimation {
  /// Converts a [AdvancedFuelEstimation] to a corresponding pigeon.
  PigeonAdvancedFuelEstimation toPigeonImplementation() {
    return PigeonAdvancedFuelEstimation(
      fuelEstimationContext:
          fuelEstimationContext.map((e) => e.toPigeonImplementation()).toList(),
    );
  }
}

/// Adapts the [DriverDistraction] class to the corresponding Pigeon
extension PigeonDriverDistractionAdapter on DriverDistraction {
  /// Converts a [DriverDistraction] to a corresponding Pigeon.
  PigeonDriverDistraction toPigeonImplementation() {
    return PigeonDriverDistraction(
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

/// Adapts the [Call] class to the corresponding pigeon.
extension PigeonCallAdapter on Call {
  /// Converts a [Call] to a corresponding Pigeon class.
  PigeonCall toPigeonImplementation() {
    return PigeonCall(
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
