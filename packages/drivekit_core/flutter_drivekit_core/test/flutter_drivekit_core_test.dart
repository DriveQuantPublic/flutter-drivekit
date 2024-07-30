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
      test('enable logging', () async {
        when(
          () => drivekitCorePlatform.enableLogging(
            showInConsole: false,
            androidLogPath: '/testLogPath',
          ),
        ).thenAnswer((_) async {});

        await DriveKitCore.enableLogging(
          androidLogPath: '/testLogPath',
          showInConsole: false,
        );
        verify(
          () => drivekitCorePlatform.enableLogging(
            showInConsole: false,
            androidLogPath: '/testLogPath',
          ),
        ).called(1);
        verifyNever(
          () => drivekitCorePlatform.enableLogging(
            // ignore: avoid_redundant_argument_values
            showInConsole: true,
            // ignore: avoid_redundant_argument_values
            androidLogPath: '/DriveKit',
          ),
        );
      });

      test('disable logging', () async {
        when(() => drivekitCorePlatform.disableLogging())
            .thenAnswer((_) async {});

        await DriveKitCore.instance.disableLogging();
        verify(() => drivekitCorePlatform.disableLogging());
      });
    });

    group('getLogUriFile', () {
      test('returns correct log file URI when platform implementation exists',
          () async {
        final logFileUri = Uri.parse('file://log.txt');
        when(() => drivekitCorePlatform.getLogUriFile())
            .thenAnswer((_) async => logFileUri);

        final actualLogFileUri = await DriveKitCore.getLogUriFile();
        expect(actualLogFileUri, equals(logFileUri));
      });

      test('returns null when no log file URI is available', () async {
        when(() => drivekitCorePlatform.getLogUriFile())
            .thenAnswer((_) async => null);

        final actualLogFileUri = await DriveKitCore.getLogUriFile();
        expect(actualLogFileUri, isNull);
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
      test('removeListener', () async {
        final listener = DriveKitListener(
          onConnected: () {},
        );
        when(() => drivekitCorePlatform.removeDriveKitListener(any()))
            .thenAnswer((_) async {});
        DriveKitCore.instance.removeDriveKitListener(listener);
        verify(() => drivekitCorePlatform.removeDriveKitListener(listener));
      });
      test('removeAllListeners', () async {
        when(() => drivekitCorePlatform.removeAllDriveKitListeners())
            .thenAnswer((_) async {});
        DriveKitCore.instance.removeAllDriveKitListeners();
        verify(() => drivekitCorePlatform.removeAllDriveKitListeners());
      });
    });
  });
}
