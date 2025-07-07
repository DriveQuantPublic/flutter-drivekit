import 'package:flutter_drivekit_driver_data_android/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';

/// Adapts the [TransportationMode] enum to the corresponding Pigeon enum
extension TransportationModeAdapter on TransportationMode {
  /// Converts a [TransportationMode] to a corresponding Pigeon enum
  PigeonTransportationMode toPigeonImplementation() {
    switch (this) {
      case TransportationMode.unknown:
        return PigeonTransportationMode.unknown;
      case TransportationMode.car:
        return PigeonTransportationMode.car;
      case TransportationMode.moto:
        return PigeonTransportationMode.moto;
      case TransportationMode.truck:
        return PigeonTransportationMode.truck;
      case TransportationMode.bus:
        return PigeonTransportationMode.bus;
      case TransportationMode.train:
        return PigeonTransportationMode.train;
      case TransportationMode.boat:
        return PigeonTransportationMode.boat;
      case TransportationMode.bike:
        return PigeonTransportationMode.bike;
      case TransportationMode.flight:
        return PigeonTransportationMode.flight;
      case TransportationMode.skiing:
        return PigeonTransportationMode.skiing;
      case TransportationMode.onFoot:
        return PigeonTransportationMode.onFoot;
      case TransportationMode.idle:
        return PigeonTransportationMode.idle;
      case TransportationMode.other:
        return PigeonTransportationMode.other;
    }
  }
}

/// Adapts the [SynchronizationType] enum to the corresponding Pigeon enum
extension SynchronizationTypeAdapter on SynchronizationType {
  /// Converts a [SynchronizationType] to a corresponding Pigeon enum
  PigeonSynchronizationType toPigeonImplementation() {
    switch (this) {
      case SynchronizationType.defaultSync:
        return PigeonSynchronizationType.defaultSync;
      case SynchronizationType.cache:
        return PigeonSynchronizationType.cache;
    }
  }
}

/// Adapts the [DriverPassengerMode] enum to the corresponding Pigeon enum
extension DriverPassengerModeAdapter on DriverPassengerMode {
  /// Converts a [DriverPassengerMode] to a corresponding Pigeon enum
  PigeonDriverPassengerMode toPigeonImplementation() {
    switch (this) {
      case DriverPassengerMode.driver:
        return PigeonDriverPassengerMode.driver;
      case DriverPassengerMode.passenger:
        return PigeonDriverPassengerMode.passenger;
    }
  }
}
