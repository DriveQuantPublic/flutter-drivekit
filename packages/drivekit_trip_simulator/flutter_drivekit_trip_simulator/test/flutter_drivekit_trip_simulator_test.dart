import 'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart';
import 'package:flutter_drivekit_trip_simulator_platform_interface/flutter_drivekit_trip_simulator_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDriveKitTripSimulatorPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DriveKitTripSimulatorPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DriveKitTripSimulator', () {
    late DriveKitTripSimulatorPlatform driveKitTripSimulatorPlatform;

    setUp(() {
      driveKitTripSimulatorPlatform = MockDriveKitTripSimulatorPlatform();
      DriveKitTripSimulatorPlatform.instance = driveKitTripSimulatorPlatform;
    });

    group('start', () {
      test('start trip simulation', () async {
        when(
          () => driveKitTripSimulatorPlatform.start(PresetTrip.shortTrip),
        ).thenAnswer((_) async {});

        await DriveKitTripSimulator.instance.start(PresetTrip.shortTrip);
        verify(
            () => DriveKitTripSimulator.instance.start(PresetTrip.shortTrip));
      });
    });

    group('stop', () {
      test('stop trip simulation', () async {
        when(
          () => driveKitTripSimulatorPlatform.stop(),
        ).thenAnswer((_) async {});

        await DriveKitTripSimulator.instance.stop();
        verify(DriveKitTripSimulator.instance.stop);
      });
    });
  });
}
