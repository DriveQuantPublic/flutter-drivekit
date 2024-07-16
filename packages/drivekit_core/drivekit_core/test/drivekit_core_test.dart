import 'package:drivekit_core/drivekit_core.dart';
import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivekitCorePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitCorePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitCore', () {
    late DrivekitCorePlatform drivekitCorePlatform;

    setUp(() {
      drivekitCorePlatform = MockDrivekitCorePlatform();
      DrivekitCorePlatform.instance = drivekitCorePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => drivekitCorePlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });
  });
}
