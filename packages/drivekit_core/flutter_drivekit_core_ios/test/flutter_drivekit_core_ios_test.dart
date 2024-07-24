import 'package:flutter_drivekit_core_ios/flutter_drivekit_core_ios.dart';
import 'package:flutter_drivekit_core_ios/src/core_api.g.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreIOS', () {
    late IOSCoreApi iosCoreApi;

    setUp(() {
      iosCoreApi = MockIOSCoreApi();
      DrivekitCorePlatform.instance = DrivekitCoreIOS(iosCoreApi: iosCoreApi);
    });

    test('can be registered', () {
      DrivekitCoreIOS.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreIOS>());
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      when(iosCoreApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final name = await DrivekitCorePlatform.instance.getPlatformName();
      expect(name, 'iOS');
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      when(() => iosCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setApiKey('api_key');
      verify(() => iosCoreApi.setApiKey('api_key')).called(1);
    });

    test('setUserId calls setUserId method with correct key', () async {
      //mock
      when(() => iosCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setUserId('user_id');
      verify(() => iosCoreApi.setUserId('user_id')).called(1);
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

    test('getApiKey returns correct api key', () async {
      //mock
      const mockApiKey = '__mock_api_key';
      when(() => iosCoreApi.setApiKey(mockApiKey))
          .thenAnswer((_) async => mockApiKey);

      //test
      final apiKey = await DrivekitCorePlatform.instance.getApiKey();
      expect(apiKey, mockApiKey);
    });
  });
}
