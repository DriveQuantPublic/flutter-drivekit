import 'package:flutter_drivekit_core_android/flutter_drivekit_core_android.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreAndroid', () {
    test('can be registered', () {
      DrivekitCoreAndroid.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      //mock
      final androidCoreApi = MockAndroidCoreApi();
      when(androidCoreApi.getPlatformName).thenAnswer((_) async => 'Android');

      //test
      final drivekitCore = DrivekitCoreAndroid(androidCoreApi: androidCoreApi);
      final name = await drivekitCore.getPlatformName();
      expect(name, 'Android');
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      final androidCoreApi = MockAndroidCoreApi();
      when(() => androidCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      final drivekitCore = DrivekitCoreAndroid(androidCoreApi: androidCoreApi);
      await drivekitCore.setApiKey('api_key');
      verify(() => androidCoreApi.setApiKey('api_key')).called(1);
    });
  });
}
