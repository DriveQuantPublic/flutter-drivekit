import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mocks/mocks.dart';

class MockDrivekitTripAnalysisPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitTripAnalysisPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockTripListener());
  });

  group('DrivekitTripAnalysis', () {
    late DrivekitTripAnalysisPlatform drivekitTripAnalysisPlatform;

    setUp(() {
      drivekitTripAnalysisPlatform = MockDrivekitTripAnalysisPlatform();
      DrivekitTripAnalysisPlatform.instance = drivekitTripAnalysisPlatform;
    });

    group('activateAutoStart', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateAutoStart(any()))
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.instance.activateAutoStart(true);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateAutoStart(false),
        );
        await DrivekitTripAnalysis.instance.activateAutoStart(false);
        verify(() => drivekitTripAnalysisPlatform.activateAutoStart(false));
      });
    });

    group('activateCrashDetection', () {
      test('calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.activateCrashDetection(any()))
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.instance.activateCrashDetection(true);
        verify(() => drivekitTripAnalysisPlatform.activateCrashDetection(true));
        verifyNever(
          () => drivekitTripAnalysisPlatform.activateCrashDetection(false),
        );
        await DrivekitTripAnalysis.instance.activateCrashDetection(false);
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

        await DrivekitTripAnalysis.instance.stopTrip();
        verify(() => drivekitTripAnalysisPlatform.stopTrip());
      });

      test('cancelTrip calls platform implementation', () async {
        when(() => drivekitTripAnalysisPlatform.cancelTrip())
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.instance.cancelTrip();
        verify(() => drivekitTripAnalysisPlatform.cancelTrip());
      });

      group('isTripRunning', () {
        test('returns false if the SDK is in INACTIVE state', () async {
          const isRunning = false;
          when(
            () => drivekitTripAnalysisPlatform.isTripRunning(),
          ).thenAnswer((_) async => isRunning);

          final actualIsRunningValue =
              await DrivekitTripAnalysis.instance.isTripRunning();
          expect(actualIsRunningValue, equals(isRunning));
        });
      });

      group('monitorPotentialTripStart', () {
        test('setMonitorPotentialTripStart calls platform implementation',
            () async {
          when(
            () =>
                drivekitTripAnalysisPlatform.setMonitorPotentialTripStart(true),
          ).thenAnswer((_) async {});

          await DrivekitTripAnalysis.setMonitorPotentialTripStart(true);
          verify(
            () =>
                drivekitTripAnalysisPlatform.setMonitorPotentialTripStart(true),
          );
        });

        test('getMonitorPotentialTripStart calls platform implementatio',
            () async {
          const isActivated = false;
          when(
            () => drivekitTripAnalysisPlatform.getMonitorPotentialTripStart(),
          ).thenAnswer((_) async => isActivated);

          final actualIsActivated =
              await DrivekitTripAnalysis.getMonitorPotentialTripStart();
          expect(actualIsActivated, equals(isActivated));
        });
      });
    });

    group('setVehicle', () {
      test('calls platform implementation', () async {
        const vehicle = Vehicle();

        when(() => drivekitTripAnalysisPlatform.setVehicle(vehicle))
            .thenAnswer((_) async {});

        await DrivekitTripAnalysis.instance.setVehicle(vehicle);
        verify(() => drivekitTripAnalysisPlatform.setVehicle(vehicle));
      });
    });

    group('listener', () {
      test('addListener', () async {
        final listener = TripListener(beaconDetected: () {});
        when(() => drivekitTripAnalysisPlatform.addTripListener(any()))
            .thenAnswer((_) async {});
        DrivekitTripAnalysis.instance.addTripListener(listener);
        verify(() => drivekitTripAnalysisPlatform.addTripListener(listener))
            .called(1);
      });
      test('removeListener', () async {
        final listener = TripListener(
          beaconDetected: () {},
        );
        when(() => drivekitTripAnalysisPlatform.removeTripListener(any()))
            .thenAnswer((_) async {});
        DrivekitTripAnalysis.instance.removeTripListener(listener);
        verify(() => drivekitTripAnalysisPlatform.removeTripListener(listener))
            .called(1);
      });
      test('removeAllListeners', () async {
        when(() => drivekitTripAnalysisPlatform.removeAllTripListeners())
            .thenAnswer((_) async {});
        DrivekitTripAnalysis.instance.removeAllTripListeners();
        verify(() => drivekitTripAnalysisPlatform.removeAllTripListeners())
            .called(1);
      });
    });
  });
}
