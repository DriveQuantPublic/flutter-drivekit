import 'package:flutter_drivekit_core_ios/flutter_drivekit_core_ios.dart';
import 'package:flutter_drivekit_core_ios/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreIOS', () {
    late IOSCoreApi iosCoreApi;
    late FlutterCoreApi flutterCoreApi;

    setUp(() {
      iosCoreApi = MockIOSCoreApi();
      flutterCoreApi = DrivekitCoreIOS(iosCoreApi: iosCoreApi);
      DrivekitCorePlatform.instance = flutterCoreApi as DrivekitCoreIOS;
    });

    test('can be registered', () {
      DrivekitCoreIOS.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreIOS>());
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      when(() => iosCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setApiKey('api_key');
      verify(() => iosCoreApi.setApiKey('api_key')).called(1);
    });

    test('getApiKey returns correct api key', () async {
      const mockApiKey = 'apiKeyTest';
      //mock
      when(() => iosCoreApi.getApiKey()).thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DrivekitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });

    test('setUserId calls setUserId method with correct key', () async {
      //mock
      when(() => iosCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setUserId('user_id');
      verify(() => iosCoreApi.setUserId('user_id')).called(1);
    });

    test('getUserId calls getUserId method', () async {
      const mockedUserId = 'userIdTest';
      //mock
      when(() => iosCoreApi.getUserId()).thenAnswer((_) async => mockedUserId);

      //test
      final userId = await DrivekitCorePlatform.instance.getUserId();
      expect(userId, mockedUserId);
    });

    test('reset calls reset method', () async {
      //mock
      when(() => iosCoreApi.reset()).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.reset();
      verify(() => iosCoreApi.reset()).called(1);
    });

    test('returns true if token is valid and user is connected', () async {
      //mocks
      when(iosCoreApi.isTokenValid).thenAnswer((_) async => true);

      //test
      final isValid = await DrivekitCorePlatform.instance.isTokenValid();
      expect(isValid, true);
    });

    test('deletes user account', () async {
      //mock
      when(iosCoreApi.deleteAccount).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.deleteAccount();
      verify(() => iosCoreApi.deleteAccount()).called(1);
    });

    test('enable logging', () async {
      //mock
      when(() => iosCoreApi.enableLogging(showInConsole: false))
          .thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.enableLogging(showInConsole: false);
      verify(() => iosCoreApi.enableLogging(showInConsole: false)).called(1);
      // ignore: avoid_redundant_argument_values
      verifyNever(() => iosCoreApi.enableLogging(showInConsole: true));
    });

    test('disable logging', () async {
      //mock
      when(iosCoreApi.disableLogging).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.disableLogging();
      verify(() => iosCoreApi.disableLogging()).called(1);
    });
    test('returns correct log file URI when platform implementation exists',
        () async {
      final logFileUri = Uri.parse('file://log.txt');
      when(() => iosCoreApi.getLogUriFile())
          .thenAnswer((_) async => 'file://log.txt');

      final actualLogFileUri =
          await DrivekitCorePlatform.instance.getLogUriFile();
      expect(actualLogFileUri, equals(logFileUri));
    });

    test('returns null when no log file URI is available', () async {
      when(() => iosCoreApi.getLogUriFile()).thenAnswer((_) async => null);

      final actualLogFileUri =
          await DrivekitCorePlatform.instance.getLogUriFile();
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
        DrivekitCorePlatform.instance.addDriveKitListener(
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

        DrivekitCorePlatform.instance.addDriveKitListener(
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
          DrivekitCorePlatform.instance.addDriveKitListener(
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
    });
  });
}
