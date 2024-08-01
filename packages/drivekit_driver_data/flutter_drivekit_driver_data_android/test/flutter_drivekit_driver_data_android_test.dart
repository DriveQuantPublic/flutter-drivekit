import 'package:flutter_drivekit_driver_data_android/flutter_drivekit_driver_data_android.dart';
import 'package:flutter_drivekit_driver_data_android/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitDriverDataAndroid', () {
    late AndroidDriverDataApi androidDriverDataApi;

    setUp(() {
      androidDriverDataApi = MockAndroidDriverDataApi();
      DrivekitDriverDataPlatform.instance = DrivekitDriverDataAndroid(
        androidDriverDataApi: androidDriverDataApi,
      );
    });

    test('can be registered', () {
      DrivekitDriverDataAndroid.registerWith();
      expect(
        DrivekitDriverDataPlatform.instance,
        isA<DrivekitDriverDataAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mock
      when(androidDriverDataApi.getPlatformName)
          .thenAnswer((_) async => 'Android');

      //test
      final name = await DrivekitDriverDataPlatform.instance.getPlatformName();
      expect(name, 'Android');
    });
  });
}