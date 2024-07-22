import 'package:flutter_drivekit_trip_analysis_android/flutter_drivekit_trip_analysis_android.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitTripAnalysisAndroid', () {
    late AndroidTripAnalysisApi androidTripAnalysisApi;

    setUp(() {
      androidTripAnalysisApi = MockAndroidTripAnalysisApi();
      DrivekitTripAnalysisPlatform.instance = DrivekitTripAnalysisAndroid(
        androidTripAnalysisApi: androidTripAnalysisApi,
      );
    });
    test('can be registered', () {
      DrivekitTripAnalysisAndroid.registerWith();
      expect(
        DrivekitTripAnalysisPlatform.instance,
        isA<DrivekitTripAnalysisAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      when(androidTripAnalysisApi.getPlatformName)
          .thenAnswer((_) async => 'Android');

      //tes
      final name =
          await DrivekitTripAnalysisPlatform.instance.getPlatformName();
      expect(name, 'Android');
    });
  });
}
