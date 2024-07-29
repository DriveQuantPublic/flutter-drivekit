import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivekitTripAnalysisPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitTripAnalysisPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitTripAnalysis', () {
    late DrivekitTripAnalysisPlatform drivekitTripAnalysisPlatform;

    setUp(() {
      drivekitTripAnalysisPlatform = MockDrivekitTripAnalysisPlatform();
      DrivekitTripAnalysisPlatform.instance = drivekitTripAnalysisPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => drivekitTripAnalysisPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await DrivekitTripAnalysis.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });
    group('activateAutoStart', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateAutoStart(any()))
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.activateAutoStart(true);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateAutoStart(false),
        );
        await DrivekitTripAnalysis.activateAutoStart(false);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(false));
      });
    });

    group('activateCrashDetection', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateCrashDetection(any()))
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.activateCrashDetection(true);
        verify(() => drivekitTripAnalysisPlatform.activateCrashDetection(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateCrashDetection(false),
        );
        await DrivekitTripAnalysis.activateCrashDetection(false);
        verify(() => drivekitTripAnalysisPlatform.activateCrashDetection(false))
            .called(1);
      });
    });

    group('manage trip manually', () {
      test('calls startTrip on platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.startTrip())
            .thenAnswer((_) async {});

        await drivekitTripAnalysisPlatform.startTrip();
        verify(() => drivekitTripAnalysisPlatform.startTrip());
      });

      test('stopTrip calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.stopTrip())
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.stopTrip();
        verify(() => drivekitTripAnalysisPlatform.stopTrip());
      });

      test('cancelTrip calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.cancelTrip())
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.cancelTrip();
        verify(() => drivekitTripAnalysisPlatform.cancelTrip());
      });

      group('isTripRunning', () {
        test('returns false if the SDK is in INACTIVE state', () async {
          const isRunning = false;
          when(
            () => drivekitTripAnalysisPlatform.isTripRunning(),
          ).thenAnswer((_) async => isRunning);

          final actualIsRunningValue =
              await DrivekitTripAnalysis.isTripRunning();
          expect(actualIsRunningValue, equals(isRunning));
        });
      });
    });
  });
}
