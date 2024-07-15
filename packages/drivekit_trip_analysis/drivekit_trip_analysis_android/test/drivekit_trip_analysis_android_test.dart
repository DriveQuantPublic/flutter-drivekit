import 'package:drivekit_trip_analysis_android/drivekit_trip_analysis_android.dart';
import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitTripAnalysisAndroid', () {
    test('can be registered', () {
      DrivekitTripAnalysisAndroid.registerWith();
      expect(
        DrivekitTripAnalysisPlatform.instance,
        isA<DrivekitTripAnalysisAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      final androidTripAnalysisApi = MockAndroidTripAnalysisApi();
      when(androidTripAnalysisApi.getPlatformName)
          .thenAnswer((_) async => 'Android');

      //test
      final drivekitTripAnalysisAndroid = DrivekitTripAnalysisAndroid(
        androidTripAnalysisApi: androidTripAnalysisApi,
      );
      final name = await drivekitTripAnalysisAndroid.getPlatformName();
      expect(name, 'Android');
    });
  });
}
