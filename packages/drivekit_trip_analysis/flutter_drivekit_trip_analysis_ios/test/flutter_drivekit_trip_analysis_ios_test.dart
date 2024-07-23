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

    test('activateAutoStart calls android implementation with correct argument',
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

    test('calls startTrip on platform implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.startTrip();
      verify(() => iOSTripAnalysisApi.startTrip()).called(1);
    });
  });
}
