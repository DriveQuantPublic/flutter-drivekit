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

    test('getPlatformName returns correct name', () async {
      //mocks
      when(iosTripSimulatorApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final name =
          await DrivekitTripSimulatorPlatform.instance.getPlatformName();
      expect(name, 'iOS');
    });
  });
}
