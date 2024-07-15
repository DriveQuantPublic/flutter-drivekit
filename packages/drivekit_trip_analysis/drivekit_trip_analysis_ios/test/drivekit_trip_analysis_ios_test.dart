import 'package:drivekit_trip_analysis_ios/drivekit_trip_analysis_ios.dart';
import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitTripAnalysisIOS', () {
    test('can be registered', () {
      DrivekitTripAnalysisIOS.registerWith();
      expect(
        DrivekitTripAnalysisPlatform.instance,
        isA<DrivekitTripAnalysisIOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      final iOSTripAnalysisApi = MockIOSTripAnalysisApi();
      when(iOSTripAnalysisApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final drivekitTripAnalysisIOS =
          DrivekitTripAnalysisIOS(iosTripAnalysisApi: iOSTripAnalysisApi);
      final name = await drivekitTripAnalysisIOS.getPlatformName();
      expect(name, 'iOS');
    });
  });
}
