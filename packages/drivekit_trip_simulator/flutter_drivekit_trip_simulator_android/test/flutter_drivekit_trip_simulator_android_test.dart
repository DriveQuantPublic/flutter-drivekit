import 'package:flutter_drivekit_trip_simulator_android/flutter_drivekit_trip_simulator_android.dart';
import 'package:flutter_drivekit_trip_simulator_android/src/trip_simulator_api.g.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DriveKitTripSimulatorAndroid', () {
    late AndroidTripSimulatorApi androidTripSimulatorApi;

    setUp(() {
      androidTripSimulatorApi = MockAndroidTripSimulatorApi();
      DriveKitTripSimulatorPlatform.instance = DriveKitTripSimulatorAndroid(
        androidTripSimulatorApi: androidTripSimulatorApi,
      );
    });

    test('can be registered', () {
      DriveKitTripSimulatorAndroid.registerWith();
      expect(
        DriveKitTripSimulatorPlatform.instance,
        isA<DriveKitTripSimulatorAndroid>(),
      );
    });

    test('start trip simulation', () async {
      //mock
      when(() => androidTripSimulatorApi.start(PigeonPresetTrip.shortTrip))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripSimulatorPlatform.instance.start(PresetTrip.shortTrip);
      verify(
        () =>
            DriveKitTripSimulatorPlatform.instance.start(PresetTrip.shortTrip),
      ).called(1);
    });

    test('stop trip simulation', () async {
      //mock
      when(() => androidTripSimulatorApi.stop()).thenAnswer((_) async {});

      //test
      await DriveKitTripSimulatorPlatform.instance.stop();
      verify(
        () => DriveKitTripSimulatorPlatform.instance.stop(),
      ).called(1);
    });
  });
}
