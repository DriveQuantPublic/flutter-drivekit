import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
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

/// Adapts the [PigeonPostGeneric] class to the [PostGeneric] class.
/// Adapt the [PigeonPostGenericResponse] class to the [PostGenericResponse] class.
