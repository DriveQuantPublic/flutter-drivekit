import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
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

        final actualPlatformName = await DriveKitCore.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });

    group('apiKey', () {
      test('calls setApiKey on platform implementation', () async {
        when(() => drivekitCorePlatform.setApiKey(any()))
            .thenAnswer((_) async {});

        await DriveKitCore.setApiKey('api_key');
        verify(() => drivekitCorePlatform.setApiKey('api_key'));
      });

      test('calls getApiKey on platform implementation', () async {
        const mockedApiKey = 'apiKeyTest';
        when(() => drivekitCorePlatform.getApiKey())
            .thenAnswer((_) async => mockedApiKey);

        final actualApiKey = await DriveKitCore.getApiKey();
        expect(actualApiKey, equals(mockedApiKey));
      });
    });

    group('userId', () {
      test('calls setUserId on platform implementation', () async {
        when(() => drivekitCorePlatform.setUserId(any()))
            .thenAnswer((_) async {});

        await DriveKitCore.setUserId('user_id');
        verify(() => drivekitCorePlatform.setUserId('user_id'));
      });

      test('calls getUserId on platform implementation', () async {
        const mockedUserId = 'userIdTest';
        when(() => drivekitCorePlatform.getUserId())
            .thenAnswer((_) async => mockedUserId);

        final actualUserId = await DriveKitCore.getUserId();
        expect(actualUserId, equals(mockedUserId));
      });
    });

    group('reset', () {
      test('calls reset on platform implementation', () async {
        when(() => drivekitCorePlatform.reset()).thenAnswer((_) async {});

        await DriveKitCore.reset();
        verify(() => drivekitCorePlatform.reset());
      });
    });

    group('isTokenValid', () {
      test('returns true if token is valid and user is connected', () async {
        const tokenValidity = true;
        when(
          () => drivekitCorePlatform.isTokenValid(),
        ).thenAnswer((_) async => tokenValidity);

        final actualTokenValidity = await DriveKitCore.isTokenValid();
        expect(actualTokenValidity, equals(tokenValidity));
      });
    });

    group('delete account', () {
      test('deletes user account', () async {
        when(() => drivekitCorePlatform.deleteAccount())
            .thenAnswer((_) async {});

        await DriveKitCore.deleteAccount();
        verify(() => drivekitCorePlatform.deleteAccount());
      });
    });

    group('logging', () {
      test('enable logging', () async {
        when(
          () => drivekitCorePlatform.enableLogging(
            androidLogPath: '/testLogPath',
            showInConsole: false,
          ),
        ).thenAnswer((_) async {});

        await DriveKitCore.enableLogging(
          androidLogPath: '/testLogPath',
          showInConsole: false,
        );
        verify(
          () => drivekitCorePlatform.enableLogging(
            androidLogPath: '/testLogPath',
            showInConsole: false,
          ),
        ).called(1);
        verifyNever(
          () => drivekitCorePlatform.enableLogging(
            // ignore: avoid_redundant_argument_values
            androidLogPath: '/DriveKit',
            // ignore: avoid_redundant_argument_values
            showInConsole: true,
          ),
        );
      });

      test('disable logging', () async {
        when(() => drivekitCorePlatform.disableLogging())
            .thenAnswer((_) async {});

        await DriveKitCore.disableLogging();
        verify(() => drivekitCorePlatform.disableLogging());
      });
    });
  });
}
