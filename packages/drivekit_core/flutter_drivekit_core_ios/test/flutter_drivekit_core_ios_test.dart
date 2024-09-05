import 'package:flutter_drivekit_core_ios/flutter_drivekit_core_ios.dart';
import 'package:flutter_drivekit_core_ios/src/adapter.dart';
import 'package:flutter_drivekit_core_ios/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DriveKitCoreIOS', () {
    late IOSCoreApi iosCoreApi;
    late FlutterCoreApi flutterCoreApi;

    setUp(() {
      registerFallbackValue(MockUserInfo());
      iosCoreApi = MockIOSCoreApi();
      flutterCoreApi = DriveKitCoreIOS(iosCoreApi: iosCoreApi);
      DriveKitCorePlatform.instance = flutterCoreApi as DriveKitCoreIOS;
    });

    test('can be registered', () {
      DriveKitCoreIOS.registerWith();
      expect(DriveKitCorePlatform.instance, isA<DriveKitCoreIOS>());
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      when(() => iosCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.setApiKey('api_key');
      verify(() => iosCoreApi.setApiKey('api_key')).called(1);
    });

    test('getApiKey returns correct api key', () async {
      const mockApiKey = 'apiKeyTest';
      //mock
      when(() => iosCoreApi.getApiKey()).thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DriveKitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });

    test('setUserId calls setUserId method with correct key', () async {
      //mock
      when(() => iosCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.setUserId('user_id');
      verify(() => iosCoreApi.setUserId('user_id')).called(1);
    });

    test('getUserId calls getUserId method', () async {
      const mockedUserId = 'userIdTest';
      //mock
      when(() => iosCoreApi.getUserId()).thenAnswer((_) async => mockedUserId);

      //test
      final userId = await DriveKitCorePlatform.instance.getUserId();
      expect(userId, mockedUserId);
    });

    test('updateUserId calls updateUserId method with correct value', () async {
      //mock
      when(() => iosCoreApi.updateUserId(any())).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.updateUserId('newUserId');
      verify(() => iosCoreApi.updateUserId('newUserId')).called(1);
    });

    test('reset calls reset method', () async {
      //mock
      when(() => iosCoreApi.reset()).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.reset();
      verify(() => iosCoreApi.reset()).called(1);
    });

    test('returns true if token is valid and user is connected', () async {
      //mocks
      when(iosCoreApi.isTokenValid).thenAnswer((_) async => true);

      //test
      final isValid = await DriveKitCorePlatform.instance.isTokenValid();
      expect(isValid, true);
    });

    test('deletes user account', () async {
      //mock
      when(iosCoreApi.deleteAccount).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.deleteAccount();
      verify(() => iosCoreApi.deleteAccount()).called(1);
    });

    test('enable logging', () async {
      //mock
      when(() => iosCoreApi.enableLogging(showInConsole: false))
          .thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.enableLogging(showInConsole: false);
      verify(() => iosCoreApi.enableLogging(showInConsole: false)).called(1);
      // ignore: avoid_redundant_argument_values
      verifyNever(() => iosCoreApi.enableLogging(showInConsole: true));
    });

    test('disable logging', () async {
      //mock
      when(iosCoreApi.disableLogging).thenAnswer((_) async {});

      //test
      await DriveKitCorePlatform.instance.disableLogging();
      verify(() => iosCoreApi.disableLogging()).called(1);
    });
    test('returns correct log file URI when platform implementation exists',
        () async {
      final logFileUri = Uri.parse('file://log.txt');
      when(() => iosCoreApi.getLogUriFile())
          .thenAnswer((_) async => 'file://log.txt');

      final actualLogFileUri =
          await DriveKitCorePlatform.instance.getLogUriFile();
      expect(actualLogFileUri, equals(logFileUri));
    });

    test('returns null when no log file URI is available', () async {
      when(() => iosCoreApi.getLogUriFile()).thenAnswer((_) async => null);

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
            onDisconnected: () {
              onDisconnectedCount++;
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
            userIdUpdateStatus: (status, userId) {
              userIdUpdateStatusCount++;
            },
          ),
        );
        flutterCoreApi.driveKitDidConnect();
        expect(onConnectedCount, 1);
        expect(onDisconnectedCount, 0);

        flutterCoreApi.driveKitDidDisconnect();
        expect(onDisconnectedCount, 1);

        flutterCoreApi.driveKitAccountDeletionCompleted(
          PigeonDeleteAccountStatus.success,
        );
        expect(onAccountDeletedCount, 1);

        flutterCoreApi.driveKitDidReceiveAuthenticationError(
          PigeonRequestError.noNetwork,
        );
        expect(onAuthenticationErrorCount, 1);

        flutterCoreApi.driveKitBackgroundFetchStatusChanged(
          PigeonBackgroundFetchStatus.completed,
        );
        expect(onBackgroundFetchStatusChangedCount, 1);

        flutterCoreApi.userIdUpdateStatusChanged(
          PigeonUpdateUserIdStatus.alreadyUsed,
          null,
        );
        expect(userIdUpdateStatusCount, 1);

        DriveKitCorePlatform.instance.addDriveKitListener(
          DriveKitListener(
            onConnected: () {
              onConnectedCount++;
            },
            onDisconnected: () {
              onDisconnectedCount++;
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
            userIdUpdateStatus: (status, userId) {
              userIdUpdateStatusCount++;
            },
          ),
        );
        flutterCoreApi.driveKitDidConnect();
        expect(onConnectedCount, 3);

        flutterCoreApi.driveKitDidDisconnect();
        expect(onDisconnectedCount, 3);

        flutterCoreApi.driveKitAccountDeletionCompleted(
          PigeonDeleteAccountStatus.success,
        );
        expect(onAccountDeletedCount, 3);

        flutterCoreApi.driveKitDidReceiveAuthenticationError(
          PigeonRequestError.noNetwork,
        );
        expect(onAuthenticationErrorCount, 3);

        flutterCoreApi.userIdUpdateStatusChanged(
          PigeonUpdateUserIdStatus.alreadyUsed,
          null,
        );
        expect(userIdUpdateStatusCount, 3);

        flutterCoreApi.driveKitBackgroundFetchStatusChanged(
          PigeonBackgroundFetchStatus.completed,
        );
        expect(onBackgroundFetchStatusChangedCount, 3);
      });

      test(
        'listener callbacks are transmitted with the right arguments',
        () async {
          final deleteAccountStatusList = <DeleteAccountStatus>[];
          final requestErrorList = <RequestError>[];
          final updateUserIdStatusList = <UpdateUserIdStatus>[];
          final backgroundFetchStatusList = <BackgroundFetchStatus>[];
          //test
          DriveKitCorePlatform.instance.addDriveKitListener(
            DriveKitListener(
              onAccountDeleted: deleteAccountStatusList.add,
              onAuthenticationError: requestErrorList.add,
              userIdUpdateStatus: (status, userId) {
                updateUserIdStatusList.add(status);
              },
              onBackgroundFetchStatusChanged: backgroundFetchStatusList.add,
            ),
          );
          flutterCoreApi.driveKitAccountDeletionCompleted(
            PigeonDeleteAccountStatus.success,
          );
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, <RequestError>[]);
          expect(updateUserIdStatusList, <UpdateUserIdStatus>[]);
          expect(backgroundFetchStatusList, <BackgroundFetchStatus>[]);

          flutterCoreApi.driveKitDidReceiveAuthenticationError(
            PigeonRequestError.noNetwork,
          );
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, [RequestError.noNetwork]);
          expect(updateUserIdStatusList, <UpdateUserIdStatus>[]);
          expect(backgroundFetchStatusList, <BackgroundFetchStatus>[]);

          flutterCoreApi.userIdUpdateStatusChanged(
            PigeonUpdateUserIdStatus.alreadyUsed,
            null,
          );
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, [RequestError.noNetwork]);
          expect(updateUserIdStatusList, [UpdateUserIdStatus.alreadyUsed]);
          expect(backgroundFetchStatusList, <BackgroundFetchStatus>[]);

          flutterCoreApi.driveKitBackgroundFetchStatusChanged(
            PigeonBackgroundFetchStatus.completed,
          );
          expect(deleteAccountStatusList, [DeleteAccountStatus.success]);
          expect(requestErrorList, [RequestError.noNetwork]);
          expect(updateUserIdStatusList, [UpdateUserIdStatus.alreadyUsed]);
          expect(backgroundFetchStatusList, [BackgroundFetchStatus.completed]);
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
          ..driveKitDidConnect()
          ..driveKitDidDisconnect()
          ..driveKitAccountDeletionCompleted(PigeonDeleteAccountStatus.success)
          ..driveKitDidReceiveAuthenticationError(PigeonRequestError.noNetwork)
          ..userIdUpdateStatusChanged(
            PigeonUpdateUserIdStatus.alreadyUsed,
            null,
          )
          ..driveKitBackgroundFetchStatusChanged(
            PigeonBackgroundFetchStatus.completed,
          );

        expect(onAuthenticationErrorCount, 0);
        expect(onAccountDeletedCount, 0);
        expect(onDisconnectedCount, 0);
        expect(userIdUpdateStatusCount, 0);
        expect(onConnectedCount, 0);
        expect(onDisconnectedCount, 0);
        expect(onBackgroundFetchStatusChangedCount, 0);
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
        flutterCoreApi.driveKitDidConnect();
        DriveKitCorePlatform.instance.removeAllDriveKitListeners();

        flutterCoreApi
          ..driveKitDidConnect()
          ..driveKitDidDisconnect()
          ..driveKitAccountDeletionCompleted(PigeonDeleteAccountStatus.success)
          ..driveKitDidReceiveAuthenticationError(PigeonRequestError.noNetwork)
          ..userIdUpdateStatusChanged(
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
      test('updateUserInfo calls iOS implementation', () async {
        //mock
        const mockUserInfo = UserInfo();
        when(() => iosCoreApi.updateUserInfo(any()))
            .thenAnswer((_) async => true);

        //test
        await DriveKitCorePlatform.instance.updateUserInfo(mockUserInfo);
        verify(
          () => iosCoreApi.updateUserInfo(any()),
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

      test('getUserInfo calls iOS implementation', () async {
        //mock
        when(() => iosCoreApi.getUserInfo()).thenAnswer(
          (_) async => PigeonGetUserInfoResponse(
            status: PigeonUserInfoSyncStatus.success,
            userInfo: PigeonUserInfo(),
          ),
        );

        //test
        await DriveKitCorePlatform.instance.getUserInfo();
        verify(() => iosCoreApi.getUserInfo()).called(1);
      });
    });
  });
}
