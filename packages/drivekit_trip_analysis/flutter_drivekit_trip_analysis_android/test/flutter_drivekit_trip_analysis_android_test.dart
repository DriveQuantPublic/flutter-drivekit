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

    test('activateCrashDetection calls android implem. with correct argument',
        () async {
      //mock
      when(() => androidTripAnalysisApi.activateCrashDetection(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.activateCrashDetection(true);
      verify(() => androidTripAnalysisApi.activateCrashDetection(true))
          .called(1);
      verifyNever(() => androidTripAnalysisApi.activateCrashDetection(false));

      await DrivekitTripAnalysisPlatform.instance.activateCrashDetection(false);
      verify(() => androidTripAnalysisApi.activateCrashDetection(false))
          .called(1);
    });

    test('startTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      await DrivekitTripAnalysisPlatform.instance.startTrip();
      verify(() => androidTripAnalysisApi.startTrip()).called(1);
    });

    test('stopTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.stopTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.stopTrip();
      verify(() => androidTripAnalysisApi.stopTrip()).called(1);
    });

    test('cancelTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.cancelTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.cancelTrip();
      verify(() => androidTripAnalysisApi.cancelTrip()).called(1);
    });

    test('isTripRunning returns false if the SDK is in INACTIVE state,',
        () async {
      //mocks
      when(androidTripAnalysisApi.isTripRunning).thenAnswer((_) async => false);

      //test
      final isRunning =
          await DrivekitTripAnalysisPlatform.instance.isTripRunning();
      expect(isRunning, false);
    });

    test('setMonitorPotentialTripStart calls Android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.setMonitorPotentialTripStart(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance
          .setMonitorPotentialTripStart(true);
      verify(() => androidTripAnalysisApi.setMonitorPotentialTripStart(true))
          .called(1);
    });
  });
}
