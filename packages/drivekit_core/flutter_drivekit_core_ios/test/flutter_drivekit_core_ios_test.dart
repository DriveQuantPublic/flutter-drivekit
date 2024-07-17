import 'package:flutter_drivekit_core_ios/flutter_drivekit_core_ios.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitCoreIOS', () {
    test('can be registered', () {
      DrivekitCoreIOS.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreIOS>());
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      final iosCoreApi = MockIOSCoreApi();
      when(iosCoreApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final drivekitCore = DrivekitCoreIOS(iosCoreApi: iosCoreApi);
      final name = await drivekitCore.getPlatformName();
      expect(name, 'iOS');
    });

    test('setApiKey calls setApiKey method with correct key', () async {
      //mock
      final iosCoreApi = MockIOSCoreApi();
      when(() => iosCoreApi.setApiKey(any())).thenAnswer((_) async {});

      //test
      final drivekitCore = DrivekitCoreIOS(iosCoreApi: iosCoreApi);
      await drivekitCore.setApiKey('api_key');
      verify(() => iosCoreApi.setApiKey('api_key')).called(1);
    });
  });
}
