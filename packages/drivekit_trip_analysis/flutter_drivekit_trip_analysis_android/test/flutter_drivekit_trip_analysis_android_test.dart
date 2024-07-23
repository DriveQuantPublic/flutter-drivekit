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

    test('activateAutoStart calls android implementation with correct argument',
        () async {
      //mock
      when(() => androidTripAnalysisApi.activateAutoStart(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.activateAutoStart(true);
      verify(() => androidTripAnalysisApi.activateAutoStart(true)).called(1);
      verifyNever(() => androidTripAnalysisApi.activateAutoStart(false));

      await DrivekitTripAnalysisPlatform.instance.activateAutoStart(false);
      verify(() => androidTripAnalysisApi.activateAutoStart(false)).called(1);
    });

    test('calls startTrip on platform implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      await DrivekitTripAnalysisPlatform.instance.startTrip();
      verify(() => androidTripAnalysisApi.startTrip()).called(1);
    });
  });
}
