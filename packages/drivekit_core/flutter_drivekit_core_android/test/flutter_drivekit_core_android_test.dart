import 'package:flutter_drivekit_core_android/flutter_drivekit_core_android.dart';
import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreAndroid', () {
    late AndroidCoreApi androidCoreApi;
    late FlutterCoreApi flutterCoreApi;

    setUp(() {
      androidCoreApi = MockAndroidCoreApi();
      flutterCoreApi = DrivekitCoreAndroid(androidCoreApi: androidCoreApi);
      DrivekitCorePlatform.instance = flutterCoreApi as DrivekitCoreAndroid;
    });

    test('can be registered', () {
      DrivekitCoreAndroid.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreAndroid>());
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      when(() => androidCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setApiKey('api_key');
      verify(() => androidCoreApi.setApiKey('api_key')).called(1);
    });

    test('getApiKey calls getApiKey method', () async {
      const mockApiKey = 'apiKeyTest';

      //mock
      when(() => androidCoreApi.getApiKey())
          .thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DrivekitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });

    test('setUserId calls setUserId method with correct ID', () async {
      //mock
      when(() => androidCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setUserId('user_id');
      verify(() => androidCoreApi.setUserId('user_id')).called(1);
    });

    test('getUserId calls getUserId method', () async {
      const mockedUserId = 'userIdTest';
      //mock
      when(() => androidCoreApi.getUserId())
          .thenAnswer((_) async => mockedUserId);

      //test
      final userId = await DrivekitCorePlatform.instance.getUserId();
      expect(userId, mockedUserId);
    });

    test('reset calls reset method', () async {
      //mock
      when(() => androidCoreApi.reset()).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.reset();
      verify(() => androidCoreApi.reset()).called(1);
    });

    test('returns true if token is valid and user is connected', () async {
      //mock
      when(androidCoreApi.isTokenValid).thenAnswer((_) async => true);

      //test
      final isValid = await DrivekitCorePlatform.instance.isTokenValid();
      expect(isValid, true);
    });

    test('deletes user account', () async {
      //mock
      when(androidCoreApi.deleteAccount).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.deleteAccount();
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
      await DrivekitCorePlatform.instance
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
      await DrivekitCorePlatform.instance.disableLogging();
      verify(() => androidCoreApi.disableLogging()).called(1);
    });

    test('returns correct log file URI when platform implementation exists',
        () async {
      final logFileUri = Uri.parse('file://log.txt');
      when(() => androidCoreApi.getLogUriFile())
          .thenAnswer((_) async => 'file://log.txt');

      final actualLogFileUri =
          await DrivekitCorePlatform.instance.getLogUriFile();
      expect(actualLogFileUri, equals(logFileUri));
    });

    test('returns null when no log file URI is available', () async {
      when(() => androidCoreApi.getLogUriFile()).thenAnswer((_) async => null);

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

        DrivekitCorePlatform.instance.addDriveKitListener(
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
          DrivekitCorePlatform.instance.addDriveKitListener(
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
    });
  });
}
