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
  group('DrivekitTripSimulator', () {
    late DrivekitTripSimulatorPlatform drivekitTripSimulatorPlatform;

    setUp(() {
      drivekitTripSimulatorPlatform = MockDrivekitTripSimulatorPlatform();
      DrivekitTripSimulatorPlatform.instance = drivekitTripSimulatorPlatform;
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
