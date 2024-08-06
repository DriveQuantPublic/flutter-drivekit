import 'package:flutter_drivekit_driver_data_ios/flutter_drivekit_driver_data_ios.dart';
import 'package:flutter_drivekit_driver_data_ios/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitDriverDataIOS', () {
    late IOSDriverDataApi iosDriverDataApi;

    setUp(() {
      iosDriverDataApi = MockIOSDriverDataApi();
      DrivekitDriverDataPlatform.instance =
          DrivekitDriverDataIOS(iosDriverDataApi: iosDriverDataApi);
    });

    test('can be registered', () {
      DrivekitDriverDataIOS.registerWith();
      expect(
        DrivekitDriverDataPlatform.instance,
        isA<DrivekitDriverDataIOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      when(iosDriverDataApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final name = await DrivekitDriverDataPlatform.instance.getPlatformName();
      expect(name, 'iOS');
    });
  });
}
