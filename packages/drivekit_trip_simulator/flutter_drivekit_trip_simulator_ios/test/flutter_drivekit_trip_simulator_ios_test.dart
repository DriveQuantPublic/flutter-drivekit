import 'package:flutter_drivekit_trip_simulator_ios/flutter_drivekit_trip_simulator_ios.dart';
import 'package:flutter_drivekit_trip_simulator_ios/src/trip_simulator_api.g.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitTripSimulatorIOS', () {
    late IOSTripSimulatorApi iosTripSimulatorApi;

    setUp(() {
      iosTripSimulatorApi = MockIOSTripSimulatorApi();
      DrivekitTripSimulatorPlatform.instance =
          DrivekitTripSimulatorIOS(iosTripSimulatorApi: iosTripSimulatorApi);
    });

    test('can be registered', () {
      DrivekitTripSimulatorIOS.registerWith();
      expect(
        DrivekitTripSimulatorPlatform.instance,
        isA<DrivekitTripSimulatorIOS>(),
      );
    });

    test('start trip simulation', () async {
      //mock
      when(() => iosTripSimulatorApi.start(PigeonPresetTrip.shortTrip))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripSimulatorPlatform.instance.start(PresetTrip.shortTrip);
      verify(() => iosTripSimulatorApi.start(PigeonPresetTrip.shortTrip))
          .called(1);
    });

    test('stop trip simulation', () async {
      //mock
      when(() => iosTripSimulatorApi.stop()).thenAnswer((_) async {});

      //test
      await DrivekitTripSimulatorPlatform.instance.stop();
      verify(() => iosTripSimulatorApi.stop()).called(1);
    });
  });
}
