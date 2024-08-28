import 'package:flutter_drivekit_trip_simulator_android/flutter_drivekit_trip_simulator_android.dart';
import 'package:flutter_drivekit_trip_simulator_android/src/trip_simulator_api.g.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitTripSimulatorAndroid', () {
    late AndroidTripSimulatorApi androidTripSimulatorApi;

    setUp(() {
      androidTripSimulatorApi = MockAndroidTripSimulatorApi();
      DrivekitTripSimulatorPlatform.instance = DrivekitTripSimulatorAndroid(
        androidTripSimulatorApi: androidTripSimulatorApi,
      );
    });

    test('can be registered', () {
      DrivekitTripSimulatorAndroid.registerWith();
      expect(
        DrivekitTripSimulatorPlatform.instance,
        isA<DrivekitTripSimulatorAndroid>(),
      );
    });

    test('start trip simulation', () async {
      //mock
      when(() => androidTripSimulatorApi.start(PigeonPresetTrip.shortTrip))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripSimulatorPlatform.instance.start(PresetTrip.shortTrip);
      verify(
        () =>
            DrivekitTripSimulatorPlatform.instance.start(PresetTrip.shortTrip),
      ).called(1);
    });

    test('stop trip simulation', () async {
      //mock
      when(() => androidTripSimulatorApi.stop()).thenAnswer((_) async {});

      //test
      await DrivekitTripSimulatorPlatform.instance.stop();
      verify(
        () => DrivekitTripSimulatorPlatform.instance.stop(),
      ).called(1);
    });
  });
}
