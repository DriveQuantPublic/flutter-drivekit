import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mocks/mocks.dart';

class MockDriveKitCorePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DriveKitCorePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockDriveKitListener());
    registerFallbackValue(MockDKDeviceConfigurationListener());
    registerFallbackValue(MockUserInfo());
  });

  group('DriveKitCore', () {
    late DriveKitCorePlatform drivekitCorePlatform;

    setUp(() {
      drivekitCorePlatform = MockDriveKitCorePlatform();
      DriveKitCorePlatform.instance = drivekitCorePlatform;
    });

    group('apiKey', () {
      test('calls setApiKey on platform implementation', () async {
        when(() => drivekitCorePlatform.setApiKey(any()))
            .thenAnswer((_) async {});

        await DriveKitCore.instance.setApiKey('api_key');
        verify(() => drivekitCorePlatform.setApiKey('api_key')).called(1);
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
        verify(() => drivekitCorePlatform.setUserId('user_id')).called(1);
      });

      test('calls getUserId on platform implementation', () async {
        const mockedUserId = 'userIdTest';
        when(() => drivekitCorePlatform.getUserId())
            .thenAnswer((_) async => mockedUserId);

        final actualUserId = await DriveKitCore.instance.getUserId();
        expect(actualUserId, equals(mockedUserId));
      });
    });

    group('User Info', () {
      test('calls updateUserInfo on platform implementation', () async {
        when(() => drivekitCorePlatform.updateUserInfo(any()))
            .thenAnswer((_) async => true);

        const mockedUserInfo = UserInfo(
          firstname: 'firstname',
          lastname: 'lastname',
          pseudo: 'pseudo',
        );
        await DriveKitCore.instance.updateUserInfo(mockedUserInfo);
        verify(() => drivekitCorePlatform.updateUserInfo(mockedUserInfo))
            .called(1);
      });

      test('calls getUserInfo on platform implementation', () async {
        when(() => drivekitCorePlatform.getUserInfo()).thenAnswer(
          (_) async => GetUserInfoResponse(
            status: UserInfoSyncStatus.success,
            userInfo: const UserInfo(
              firstname: 'firstname',
              lastname: 'lastname',
              pseudo: 'pseudo',
            ),
          ),
        );

        const mockedUserInfo = UserInfo(
          firstname: 'firstname',
          lastname: 'lastname',
          pseudo: 'pseudo',
        );

        final actualUserInfo = await DriveKitCore.instance.getUserInfo();
        expect(actualUserInfo.status, UserInfoSyncStatus.success);
        expect(actualUserInfo.userInfo, mockedUserInfo);
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
        verify(() => drivekitCorePlatform.deleteAccount()).called(1);
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

        await DriveKitCore.instance.enableLogging(
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
        verify(() => drivekitCorePlatform.disableLogging()).called(1);
      });
    });

    group('getLogUriFile', () {
      test('returns correct log file URI when platform implementation exists',
          () async {
        final logFileUri = Uri.parse('file://log.txt');
        when(() => drivekitCorePlatform.getLogUriFile())
            .thenAnswer((_) async => logFileUri);

        final actualLogFileUri = await DriveKitCore.instance.getLogUriFile();
        expect(actualLogFileUri, equals(logFileUri));
      });

      test('returns null when no log file URI is available', () async {
        when(() => drivekitCorePlatform.getLogUriFile())
            .thenAnswer((_) async => null);

        final actualLogFileUri = await DriveKitCore.instance.getLogUriFile();
        expect(actualLogFileUri, isNull);
      });
    });

    group('DriveKitListener', () {
      test('addListener', () async {
        final listener = DriveKitListener(
          onConnected: () {},
        );
        when(() => drivekitCorePlatform.addDriveKitListener(any()))
            .thenAnswer((_) async {});
        DriveKitCore.instance.addDriveKitListener(listener);
        verify(() => drivekitCorePlatform.addDriveKitListener(listener))
            .called(1);
      });
      test('removeListener', () async {
        final listener = DriveKitListener(
          onConnected: () {},
        );
        when(() => drivekitCorePlatform.removeDriveKitListener(any()))
            .thenAnswer((_) async {});
        DriveKitCore.instance.removeDriveKitListener(listener);
        verify(() => drivekitCorePlatform.removeDriveKitListener(listener))
            .called(1);
      });
      test('removeAllListeners', () async {
        when(() => drivekitCorePlatform.removeAllDriveKitListeners())
            .thenAnswer((_) async {});
        DriveKitCore.instance.removeAllDriveKitListeners();
        verify(() => drivekitCorePlatform.removeAllDriveKitListeners())
            .called(1);
      });
    });

    group('DKDeviceConfigurationListener', () {
      test('addDeviceConfigurationListener', () async {
        final listener = DKDeviceConfigurationListener(
          onDeviceConfigurationChanged: (event) => {},
        );
        when(() => drivekitCorePlatform.addDeviceConfigurationListener(any()))
            .thenAnswer((_) async {});
        DriveKitCore.instance.addDeviceConfigurationListener(listener);
        verify(
          () => drivekitCorePlatform.addDeviceConfigurationListener(
            listener,
          ),
        ).called(1);
      });
      test('removeDeviceConfigurationListener', () async {
        final listener = DKDeviceConfigurationListener(
          onDeviceConfigurationChanged: (event) => {},
        );
        when(
          () => drivekitCorePlatform.removeDeviceConfigurationListener(
            any(),
          ),
        ).thenAnswer((_) async {});
        DriveKitCore.instance.removeDeviceConfigurationListener(listener);
        verify(
          () => drivekitCorePlatform.removeDeviceConfigurationListener(
            listener,
          ),
        ).called(1);
      });
      test('removeAllDeviceConfigurationListeners', () async {
        when(() => drivekitCorePlatform.removeAllDeviceConfigurationListeners())
            .thenAnswer((_) async {});
        DriveKitCore.instance.removeAllDeviceConfigurationListeners();
        verify(
          () => drivekitCorePlatform.removeAllDeviceConfigurationListeners(),
        ).called(1);
      });
    });
  });
}
