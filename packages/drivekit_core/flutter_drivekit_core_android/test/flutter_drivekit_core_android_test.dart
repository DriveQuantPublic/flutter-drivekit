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

    test('setUserId calls setUserId method with correct ID', () async {
      //mock
      when(() => androidCoreApi.setUserId(any())).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.setUserId('user_id');
      verify(() => androidCoreApi.setUserId('user_id')).called(1);
    });

    test('reset calls reset method', () async {
      //mock
      when(() => androidCoreApi.reset()).thenAnswer((_) async {});

      //test
      await DrivekitCorePlatform.instance.reset();
      verify(() => androidCoreApi.reset()).called(1);
    });
  });
}
