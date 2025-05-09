import 'package:flutter_drivekit_core_android/flutter_drivekit_core_android.dart';
import 'package:flutter_drivekit_core_android/src/adapter.dart';
import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DriveKitCoreAndroid', () {
    late AndroidCoreApi androidCoreApi;
    late FlutterCoreApi flutterCoreApi;

    setUp(() {
      registerFallbackValue(MockUserInfo());
      androidCoreApi = MockAndroidCoreApi();
      flutterCoreApi = DriveKitCoreAndroid(androidCoreApi: androidCoreApi);
      DriveKitCorePlatform.instance = flutterCoreApi as DriveKitCoreAndroid;
    });

    test('can be registered', () {
      DriveKitCoreAndroid.registerWith();
      expect(DriveKitCorePlatform.instance, isA<DriveKitCoreAndroid>());
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      when(() => androidCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.setApiKey('api_key');
      verify(() => androidCoreApi.setApiKey('api_key')).called(1);
    });

    test('getApiKey calls getApiKey method', () async {
      const mockApiKey = 'apiKeyTest';

      //mock
      when(() => androidCoreApi.getApiKey())
          .thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DriveKitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });

    test('setUserId calls setUserId method with correct ID', () async {
      //mock
      when(() => androidCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.setUserId('user_id');
      verify(() => androidCoreApi.setUserId('user_id')).called(1);
    });

    test('getUserId calls getUserId method', () async {
      const mockedUserId = 'userIdTest';
      //mock
      when(() => androidCoreApi.getUserId())
          .thenAnswer((_) async => mockedUserId);

      //test
      final userId = await DriveKitCorePlatform.instance.getUserId();
      expect(userId, mockedUserId);
    });

    test('updateUserId calls updateUserId method with correct value', () async {
      //mock
      when(() => androidCoreApi.updateUserId(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.updateUserId('newUserId');
      verify(() => androidCoreApi.updateUserId('newUserId')).called(1);
    });

    test('getInstallationId calls getInstallationId method', () async {
      const mockedInstallationId = 'InstallationIdTest';
      //mock
      when(() => androidCoreApi.getInstallationId())
          .thenAnswer((_) async => mockedInstallationId);

      //test
      final installationId =
          await DriveKitCorePlatform.instance.getInstallationId();
      expect(installationId, mockedInstallationId);
    });

    test('reset calls reset method', () async {
      //mock
      when(() => androidCoreApi.reset()).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.reset();
      verify(() => androidCoreApi.reset()).called(1);
    });

    test('returns true if token is valid and user is connected', () async {
      //mock
      when(androidCoreApi.isTokenValid).thenAnswer((_) async => true);

      //test
      final isValid = await DriveKitCorePlatform.instance.isTokenValid();
      expect(isValid, true);
    });

    test('deletes user account', () async {
      //mock
      when(androidCoreApi.deleteAccount).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.deleteAccount();
      verify(() => androidCoreApi.deleteAccount()).called(1);
    });

    test('enable logging', () async {
      //mock
      when(
        () => androidCoreApi.enableLogging(
          showInConsole: false,
          androidLogPath: '/testPath',
        ),
      ).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance
          .enableLogging(showInConsole: false, androidLogPath: '/testPath');
      verify(
        () => androidCoreApi.enableLogging(
          showInConsole: false,
          androidLogPath: '/testPath',
        ),
      ).called(1);
      verifyNever(
        () => androidCoreApi.enableLogging(
          // ignore: avoid_redundant_argument_values
          showInConsole: true,
          // ignore: avoid_redundant_argument_values
          androidLogPath: '/DriveKit',
        ),
      );
    });

    test('disable logging', () async {
      //mock
      when(androidCoreApi.disableLogging).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.disableLogging();
      verify(() => androidCoreApi.disableLogging()).called(1);
    });

    test('returns correct log file URI when platform implementation exists',
        () async {
      final logFileUri = Uri.parse('file://log.txt');
      when(() => androidCoreApi.getLogUriFile())
          .thenAnswer((_) async => 'file://log.txt');

      final actualLogFileUri =
          await DriveKitCorePlatform.instance.getLogUriFile();
      expect(actualLogFileUri, equals(logFileUri));
    });

    test('returns null when no log file URI is available', () async {
      when(() => androidCoreApi.getLogUriFile()).thenAnswer((_) async => null);

      final actualLogFileUri =
          await DriveKitCorePlatform.instance.getLogUriFile();
      expect(actualLogFileUri, isNull);
    });
    group('DriveKitListener', () {
      test('can listen several listeners', () async {
        var onConnectedCount = 0;
        var onDisconnectedCount = 0;
        var onAccountDeletedCount = 0;
        var onAuthenticationErrorCount = 0;
        var onBackgroundFetchStatusChangedCount = 0;
        var userIdUpdateStatusCount = 0;
        //test
        DriveKitCorePlatform.instance.addDriveKitListener(
          DriveKitListener(
            onConnected: () {
              onConnectedCount++;
            },
            onAccountDeleted: (status) {
              onAccountDeletedCount++;
            },
            onAuthenticationError: (errorType) {
              onAuthenticationErrorCount++;
            },
            onBackgroundFetchStatusChanged: (status) {
              onBackgroundFetchStatusChangedCount++;
            },
            onDisconnected: () {
              onDisconnectedCount++;
            },
            userIdUpdateStatus: (status, userId) {
              userIdUpdateStatusCount++;
            },
          ),
        );
        flutterCoreApi.onConnected();
        expect(onConnectedCount, 1);
        expect(onDisconnectedCount, 0);

        flutterCoreApi.onDisconnected();
        expect(onDisconnectedCount, 1);

        flutterCoreApi.onAccountDeleted(PigeonDeleteAccountStatus.success);
        expect(onAccountDeletedCount, 1);

        flutterCoreApi.onAuthenticationError(PigeonRequestError.noNetwork);
        expect(onAuthenticationErrorCount, 1);

        flutterCoreApi.userIdUpdateStatus(
          PigeonUpdateUserIdStatus.alreadyUsed,
          null,
        );
        expect(userIdUpdateStatusCount, 1);

        DriveKitCorePlatform.instance.addDriveKitListener(
          DriveKitListener(
            onConnected: () {
              onConnectedCount++;
            },
            onAccountDeleted: (status) {
              onAccountDeletedCount++;
            },
            onAuthenticationError: (errorType) {
              onAuthenticationErrorCount++;
            },
            onBackgroundFetchStatusChanged: (status) {
              onBackgroundFetchStatusChangedCount++;
            },
            onDisconnected: () {
              onDisconnectedCount++;
            },
            userIdUpdateStatus: (status, userId) {
              userIdUpdateStatusCount++;
            },
          ),
        );
        flutterCoreApi.onConnected();
        expect(onConnectedCount, 3);

        flutterCoreApi.onDisconnected();
        expect(onDisconnectedCount, 3);

        flutterCoreApi.onAccountDeleted(PigeonDeleteAccountStatus.success);
        expect(onAccountDeletedCount, 3);

        flutterCoreApi.onAuthenticationError(PigeonRequestError.noNetwork);
        expect(onAuthenticationErrorCount, 3);

        flutterCoreApi.userIdUpdateStatus(
          PigeonUpdateUserIdStatus.alreadyUsed,
          null,
        );
        expect(userIdUpdateStatusCount, 3);

        // onBackgroundFetchStatusChanged is not supported on Android
        expect(onBackgroundFetchStatusChangedCount, 0);
      });

      test(
        'listener callbacks are transmitted with the right arguments',
        () async {
          final deleteAccountStatusList = <DeleteAccountStatus>[];
          final requestErrorList = <RequestError>[];
          final updateUserIdStatusList = <UpdateUserIdStatus>[];
          //test
          DriveKitCorePlatform.instance.addDriveKitListener(
            DriveKitListener(
              onAccountDeleted: deleteAccountStatusList.add,
              onAuthenticationError: requestErrorList.add,
              userIdUpdateStatus: (status, userId) {
                updateUserIdStatusList.add(status);
              },
            ),
          );
          flutterCoreApi.onAccountDeleted(PigeonDeleteAccountStatus.success);
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, <RequestError>[]);
          expect(updateUserIdStatusList, <UpdateUserIdStatus>[]);

          flutterCoreApi.onAuthenticationError(PigeonRequestError.noNetwork);
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, [RequestError.noNetwork]);
          expect(updateUserIdStatusList, <UpdateUserIdStatus>[]);

          flutterCoreApi.userIdUpdateStatus(
            PigeonUpdateUserIdStatus.alreadyUsed,
            null,
          );
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, [RequestError.noNetwork]);
          expect(updateUserIdStatusList, [UpdateUserIdStatus.alreadyUsed]);
        },
      );

      test('can remove a listener', () async {
        var onConnectedCount = 0;
        var onDisconnectedCount = 0;
        var onAccountDeletedCount = 0;
        var onAuthenticationErrorCount = 0;
        var onBackgroundFetchStatusChangedCount = 0;
        var userIdUpdateStatusCount = 0;

        final listener = DriveKitListener(
          onConnected: () {
            onConnectedCount++;
          },
          onAccountDeleted: (status) {
            onAccountDeletedCount++;
          },
          onAuthenticationError: (errorType) {
            onAuthenticationErrorCount++;
          },
          onBackgroundFetchStatusChanged: (status) {
            onBackgroundFetchStatusChangedCount++;
          },
          onDisconnected: () {
            onDisconnectedCount++;
          },
          userIdUpdateStatus: (status, userId) {
            userIdUpdateStatusCount++;
          },
        );
        DriveKitCorePlatform.instance.addDriveKitListener(listener);
        DriveKitCorePlatform.instance.removeDriveKitListener(listener);

        flutterCoreApi
          ..onConnected()
          ..onDisconnected()
          ..onAccountDeleted(PigeonDeleteAccountStatus.success)
          ..onAuthenticationError(PigeonRequestError.noNetwork)
          ..userIdUpdateStatus(
            PigeonUpdateUserIdStatus.alreadyUsed,
            null,
          );

        expect(onAuthenticationErrorCount, 0);
        expect(onAccountDeletedCount, 0);
        expect(onDisconnectedCount, 0);
        expect(userIdUpdateStatusCount, 0);
        expect(onConnectedCount, 0);
        expect(onDisconnectedCount, 0);
        expect(onBackgroundFetchStatusChangedCount, 0);
      });
    });

    test('can remove all listeners at once', () async {
      var onConnectedCount = 0;
      var onDisconnectedCount = 0;
      var onAccountDeletedCount = 0;
      var onAuthenticationErrorCount = 0;
      var onBackgroundFetchStatusChangedCount = 0;
      var userIdUpdateStatusCount = 0;

      final listener = DriveKitListener(
        onConnected: () {
          onConnectedCount++;
        },
        onAccountDeleted: (status) {
          onAccountDeletedCount++;
        },
        onAuthenticationError: (errorType) {
          onAuthenticationErrorCount++;
        },
        onBackgroundFetchStatusChanged: (status) {
          onBackgroundFetchStatusChangedCount++;
        },
        onDisconnected: () {
          onDisconnectedCount++;
        },
        userIdUpdateStatus: (status, userId) {
          userIdUpdateStatusCount++;
        },
      );
      DriveKitCorePlatform.instance.addDriveKitListener(listener);
      DriveKitCorePlatform.instance.addDriveKitListener(listener);
      flutterCoreApi.onConnected();
      DriveKitCorePlatform.instance.removeAllDriveKitListeners();

      flutterCoreApi
        ..onConnected()
        ..onDisconnected()
        ..onAccountDeleted(PigeonDeleteAccountStatus.success)
        ..onAuthenticationError(PigeonRequestError.noNetwork)
        ..userIdUpdateStatus(
          PigeonUpdateUserIdStatus.alreadyUsed,
          null,
        );

      expect(onConnectedCount, 2);
      expect(onDisconnectedCount, 0);
      expect(onAuthenticationErrorCount, 0);
      expect(onAccountDeletedCount, 0);
      expect(onDisconnectedCount, 0);
      expect(userIdUpdateStatusCount, 0);
      expect(onBackgroundFetchStatusChangedCount, 0);
    });

    group('DKDeviceConfigurationListener', () {
      test('can listen several listeners', () async {
        var onDeviceConfigurationChangedCount = 0;

        //test
        DriveKitCorePlatform.instance.addDeviceConfigurationListener(
          DKDeviceConfigurationListener(
            onDeviceConfigurationChanged: (event) {
              onDeviceConfigurationChangedCount++;
            },
          ),
        );
        flutterCoreApi.onDeviceConfigurationChanged(
          PigeonDeviceConfigurationEvent.activityPermissionValid,
        );
        expect(onDeviceConfigurationChangedCount, 1);

        DriveKitCorePlatform.instance.addDeviceConfigurationListener(
          DKDeviceConfigurationListener(
            onDeviceConfigurationChanged: (event) {
              onDeviceConfigurationChangedCount++;
            },
          ),
        );
        flutterCoreApi.onDeviceConfigurationChanged(
          PigeonDeviceConfigurationEvent.activityPermissionValid,
        );
        expect(onDeviceConfigurationChangedCount, 3);
      });

      test('can remove a listener', () async {
        var onDeviceConfigurationChangedCount = 0;

        final listener = DKDeviceConfigurationListener(
          onDeviceConfigurationChanged: (event) {
            onDeviceConfigurationChangedCount++;
          },
        );

        DriveKitCorePlatform.instance.addDeviceConfigurationListener(listener);
        DriveKitCorePlatform.instance
            .removeDeviceConfigurationListener(listener);

        flutterCoreApi.onDeviceConfigurationChanged(
          PigeonDeviceConfigurationEvent.activityPermissionValid,
        );

        expect(onDeviceConfigurationChangedCount, 0);
      });

      test('can remove all listeners at once', () async {
        var onDeviceConfigurationChangedCount = 0;

        final listener = DKDeviceConfigurationListener(
          onDeviceConfigurationChanged: (event) {
            onDeviceConfigurationChangedCount++;
          },
        );

        DriveKitCorePlatform.instance.addDeviceConfigurationListener(listener);
        DriveKitCorePlatform.instance.addDeviceConfigurationListener(listener);
        flutterCoreApi.onDeviceConfigurationChanged(
          PigeonDeviceConfigurationEvent.activityPermissionValid,
        );
        DriveKitCorePlatform.instance.removeAllDeviceConfigurationListeners();

        flutterCoreApi.onDeviceConfigurationChanged(
          PigeonDeviceConfigurationEvent.activityPermissionValid,
        );

        expect(onDeviceConfigurationChangedCount, 2);
      });
    });

    group('UserInfo', () {
      test('updateUserInfo calls Android implementation', () async {
        //mock
        const mockUserInfo = UserInfo();
        when(() => androidCoreApi.updateUserInfo(any()))
            .thenAnswer((_) async => true);

        //test
        await DriveKitCorePlatform.instance.updateUserInfo(mockUserInfo);
        verify(
          () => androidCoreApi.updateUserInfo(any()),
        ).called(1);
      });

      test('userInfo toPigeonImplementation includes all attributes', () {
        //mock
        const userInfo = UserInfo(
          firstname: 'firstname',
          lastname: 'lastname',
          pseudo: 'pseudo',
        );

        //test
        final pigeonUserInfo = userInfo.toPigeonImplementation();
        expect(pigeonUserInfo.firstname, userInfo.firstname);
        expect(pigeonUserInfo.lastname, userInfo.lastname);
        expect(pigeonUserInfo.pseudo, userInfo.pseudo);
      });

      test(
          'null userInfo.toPigeonImplementation includes null attributes'
          ' and includes default attributes value if not possible to be null',
          () {
        const userInfo = UserInfo();

        //test
        final pigeonUserInfo = userInfo.toPigeonImplementation();
        expect(pigeonUserInfo.firstname, null);
        expect(pigeonUserInfo.lastname, null);
        expect(pigeonUserInfo.pseudo, null);
      });

      test('getUserInfo calls Android implementation', () async {
        //mock
        when(() => androidCoreApi.getUserInfo()).thenAnswer(
          (_) async => PigeonGetUserInfoResponse(
            status: PigeonUserInfoSyncStatus.success,
            userInfo: PigeonUserInfo(),
          ),
        );

        //test
        await DriveKitCorePlatform.instance.getUserInfo();
        verify(() => androidCoreApi.getUserInfo()).called(1);
      });
    });
  });
}
