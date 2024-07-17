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
  });
}
