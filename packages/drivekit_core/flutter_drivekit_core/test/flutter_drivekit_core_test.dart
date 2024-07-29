import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mocks/mocks.dart';

class MockDrivekitCorePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitCorePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockDriveKitListener());
  });

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
        final actualPlatformName =
            await DriveKitCore.instance.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });

    group('apiKey', () {
      test('calls setApiKey on platform implementation', () async {
        when(() => drivekitCorePlatform.setApiKey(any()))
            .thenAnswer((_) async {});

        await DriveKitCore.instance.setApiKey('api_key');
        verify(() => drivekitCorePlatform.setApiKey('api_key'));
      });

      test('calls getApiKey on platform implementation', () async {
        const mockedApiKey = 'apiKeyTest';
        when(() => drivekitCorePlatform.getApiKey())
            .thenAnswer((_) async => mockedApiKey);

        final actualApiKey = await DriveKitCore.instance.getApiKey();
        expect(actualApiKey, equals(mockedApiKey));
      });
    });

    group('userId', () {
      test('calls setUserId on platform implementation', () async {
        when(() => drivekitCorePlatform.setUserId(any()))
            .thenAnswer((_) async {});

        await DriveKitCore.instance.setUserId('user_id');
        verify(() => drivekitCorePlatform.setUserId('user_id'));
      });

      test('calls getUserId on platform implementation', () async {
        const mockedUserId = 'userIdTest';
        when(() => drivekitCorePlatform.getUserId())
            .thenAnswer((_) async => mockedUserId);

        final actualUserId = await DriveKitCore.instance.getUserId();
        expect(actualUserId, equals(mockedUserId));
      });
    });

    group('reset', () {
      test('calls reset on platform implementation', () async {
        when(() => drivekitCorePlatform.reset()).thenAnswer((_) async {});

        await DriveKitCore.instance.reset();
        verify(() => drivekitCorePlatform.reset());
      });
    });

    group('isTokenValid', () {
      test('returns true if token is valid and user is connected', () async {
        const tokenValidity = true;
        when(
          () => drivekitCorePlatform.isTokenValid(),
        ).thenAnswer((_) async => tokenValidity);

        final actualTokenValidity = await DriveKitCore.instance.isTokenValid();
        expect(actualTokenValidity, equals(tokenValidity));
      });
    });

    group('delete account', () {
      test('deletes user account', () async {
        when(() => drivekitCorePlatform.deleteAccount())
            .thenAnswer((_) async {});

        await DriveKitCore.instance.deleteAccount();
        verify(() => drivekitCorePlatform.deleteAccount());
      });
    });

    group('logging', () {
      test('disable logging', () async {
        when(() => drivekitCorePlatform.disableLogging())
            .thenAnswer((_) async {});

        await DriveKitCore.instance.disableLogging();
        verify(() => drivekitCorePlatform.disableLogging());
      });
    });

    group('listener', () {
      test('addListener', () async {
        final listener = DriveKitListener(
          onConnected: () {},
        );
        when(() => drivekitCorePlatform.addDriveKitListener(any()))
            .thenAnswer((_) async {});
        DriveKitCore.instance.addDriveKitListener(listener);
        verify(() => drivekitCorePlatform.addDriveKitListener(listener));
      });
    });
  });
}
