import 'package:drivekit_core_ios/drivekit_core_ios.dart';
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
  });
}
