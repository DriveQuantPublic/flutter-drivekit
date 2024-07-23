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
    final driveKitTripAnalysis = DrivekitTripAnalysis();
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

        final actualPlatformName = await driveKitTripAnalysis.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });
    group('activateAutoStart', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateAutoStart(any()))
            .thenAnswer((_) async {});

        await driveKitTripAnalysis.activateAutoStart(true);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateAutoStart(false),
        );
        await driveKitTripAnalysis.activateAutoStart(false);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(false));
      });
    });

    group('activateCrashDetection', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateCrashDetection(any()))
            .thenAnswer((_) async {});

        await driveKitTripAnalysis.activateCrashDetection(true);
        verify(() => drivekitTripAnalysisPlatform.activateCrashDetection(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateCrashDetection(false),
        );
        await driveKitTripAnalysis.activateCrashDetection(false);
        verify(() => drivekitTripAnalysisPlatform.activateCrashDetection(false))
            .called(1);
      });
    });

    group('startTrip', () {
      test('calls startTrip on platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.startTrip())
            .thenAnswer((_) async {});

        await drivekitTripAnalysisPlatform.startTrip();
        verify(() => drivekitTripAnalysisPlatform.startTrip());
      });
    });
  });
}
