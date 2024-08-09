import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivekitDriverDataPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitDriverDataPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final driveKitDriverData = DriveKitDriverData.instance;

  group('DrivekitDriverData', () {
    late DrivekitDriverDataPlatform drivekitDriverDataPlatform;

    setUp(() {
      drivekitDriverDataPlatform = MockDrivekitDriverDataPlatform();
      DrivekitDriverDataPlatform.instance = drivekitDriverDataPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => drivekitDriverDataPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await driveKitDriverData.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });

    group('deleteTrip', () {
      test('Delete a trip', () async {
        const result = false;
        when(
          () => drivekitDriverDataPlatform.deleteTrip(any()),
        ).thenAnswer((_) async => result);

        final actualDeletionResult = await driveKitDriverData.deleteTrip(any());
        expect(actualDeletionResult, equals(result));
      });
    });
  });
}
