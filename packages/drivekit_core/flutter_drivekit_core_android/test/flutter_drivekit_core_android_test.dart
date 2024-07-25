import 'package:flutter_drivekit_core_android/flutter_drivekit_core_android.dart';
import 'package:flutter_drivekit_core_android/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreAndroid', () {
    late AndroidCoreApi androidCoreApi;

    setUp(() {
      androidCoreApi = MockAndroidCoreApi();
      DrivekitCorePlatform.instance =
          DrivekitCoreAndroid(androidCoreApi: androidCoreApi);
    });

    test('can be registered', () {
      DrivekitCoreAndroid.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      //mock
      when(androidCoreApi.getPlatformName).thenAnswer((_) async => 'Android');

      //test
      final name = await DrivekitCorePlatform.instance.getPlatformName();
      expect(name, 'Android');
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

    test('getApiKey returns correct api key', () async {
      //mock
      const mockApiKey = '__mock_api_key';
      when(() => androidCoreApi.setApiKey(mockApiKey))
          .thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DrivekitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });
  });
}
