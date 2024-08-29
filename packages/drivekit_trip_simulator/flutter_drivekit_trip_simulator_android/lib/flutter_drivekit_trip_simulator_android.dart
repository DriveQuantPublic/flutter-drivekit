import 'package:flutter/foundation.dart';
import 'package:flutter_drivekit_trip_simulator_android/src/adapter.dart';
import 'package:flutter_drivekit_trip_simulator_android/src/trip_simulator_api.g.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';

/// The Android implementation of [DriveKitTripSimulatorPlatform].
class DriveKitTripSimulatorAndroid extends DriveKitTripSimulatorPlatform {
  /// Creates a new instance of [DriveKitTripSimulatorAndroid].
  /// The optional [androidTripSimulatorApi] parameter is used for
  /// dependency injection in tests.
  DriveKitTripSimulatorAndroid({
    AndroidTripSimulatorApi? androidTripSimulatorApi,
  }) : androidTripSimulatorApi =
            androidTripSimulatorApi ?? AndroidTripSimulatorApi();

  /// Registers this class as the default instance of
  /// [DriveKitTripSimulatorPlatform]
  static void registerWith() {
    DriveKitTripSimulatorPlatform.instance = DriveKitTripSimulatorAndroid();
  }

  /// The instance of [AndroidTripSimulatorApi], a class that provides
  /// access to the native methods via a method channel generated by pigeon.
  @visibleForTesting
  final AndroidTripSimulatorApi androidTripSimulatorApi;

  @override
  Future<void> start(PresetTrip presetTrip) =>
      androidTripSimulatorApi.start(presetTrip.toPigeonImplementation());

  @override
  Future<void> stop() => androidTripSimulatorApi.stop();
}
