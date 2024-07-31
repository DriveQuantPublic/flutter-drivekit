import 'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivekitTripSimulatorPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitTripSimulatorPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final driveKitTripSimulator = DriveKitTripSimulator.instance;

  group('DrivekitTripSimulator', () {
    late DrivekitTripSimulatorPlatform drivekitTripSimulatorPlatform;

    setUp(() {
      drivekitTripSimulatorPlatform = MockDrivekitTripSimulatorPlatform();
      DrivekitTripSimulatorPlatform.instance = drivekitTripSimulatorPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => drivekitTripSimulatorPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName =
            await driveKitTripSimulator.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });

    group('start', () {
      test('start trip simulation', () async {
        when(
          () => drivekitTripSimulatorPlatform.start(PresetTrip.shortTrip),
        ).thenAnswer((_) async {});

        await DriveKitTripSimulator.start(PresetTrip.shortTrip);
        verify(() => DriveKitTripSimulator.start(PresetTrip.shortTrip));
      });
    });

    group('stop', () {
      test('stop trip simulation', () async {
        when(
          () => drivekitTripSimulatorPlatform.stop(),
        ).thenAnswer((_) async {});

        await DriveKitTripSimulator.stop();
        verify(DriveKitTripSimulator.stop);
      });
    });
  });
}
