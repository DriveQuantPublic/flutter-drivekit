import 'package:flutter_drivekit_trip_analysis_ios/flutter_drivekit_trip_analysis_ios.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IOSTripAnalysisApi iOSTripAnalysisApi;

  setUp(() {
    iOSTripAnalysisApi = MockIOSTripAnalysisApi();
    DrivekitTripAnalysisPlatform.instance =
        DrivekitTripAnalysisIOS(iosTripAnalysisApi: iOSTripAnalysisApi);
  });

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
      when(iOSTripAnalysisApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final name =
          await DrivekitTripAnalysisPlatform.instance.getPlatformName();
      expect(name, 'iOS');
    });

    test('activateAutoStart calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.activateAutoStart(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.activateAutoStart(true);
      verify(() => iOSTripAnalysisApi.activateAutoStart(true)).called(1);
      verifyNever(() => iOSTripAnalysisApi.activateAutoStart(false));

      await DrivekitTripAnalysisPlatform.instance.activateAutoStart(false);
      verify(() => iOSTripAnalysisApi.activateAutoStart(false)).called(1);
    });

    test(
        'activateCrashDetection calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.activateCrashDetection(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.activateCrashDetection(true);
      verify(() => iOSTripAnalysisApi.activateCrashDetection(true)).called(1);
      verifyNever(() => iOSTripAnalysisApi.activateCrashDetection(false));

      await DrivekitTripAnalysisPlatform.instance.activateCrashDetection(false);
      verify(() => iOSTripAnalysisApi.activateCrashDetection(false)).called(1);
    });

    test('startTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.startTrip();
      verify(() => iOSTripAnalysisApi.startTrip()).called(1);
    });

    test('stopTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.stopTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.stopTrip();
      verify(() => iOSTripAnalysisApi.stopTrip()).called(1);
    });

    test('cancelTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.cancelTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.cancelTrip();
      verify(() => iOSTripAnalysisApi.cancelTrip()).called(1);
    });

    test('isTripRunning returns false if the SDK is in INACTIVE state',
        () async {
      //mocks
      when(iOSTripAnalysisApi.isTripRunning).thenAnswer((_) async => false);

      //test
      final isRunning =
          await DrivekitTripAnalysisPlatform.instance.isTripRunning();
      expect(isRunning, false);
    });

    test('setMonitorPotentialTripStart calls iOS implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.setMonitorPotentialTripStart(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance
          .setMonitorPotentialTripStart(true);
      verify(() => iOSTripAnalysisApi.setMonitorPotentialTripStart(true))
          .called(1);
    });
  });
}
