import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mocks/mocks.dart';

class MockDriveKitTripAnalysisPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DriveKitTripAnalysisPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockTripListener());
  });

  group('DriveKitTripAnalysis', () {
    late DriveKitTripAnalysisPlatform driveKitTripAnalysisPlatform;

    setUp(() {
      driveKitTripAnalysisPlatform = MockDriveKitTripAnalysisPlatform();
      DriveKitTripAnalysisPlatform.instance = driveKitTripAnalysisPlatform;
    });

    group('activateAutoStart', () {
      test('isAutoStartActivated returns false by default', () async {
        const isActivated = false;
        when(
          () => driveKitTripAnalysisPlatform.isAutoStartActivated(),
        ).thenAnswer((_) async => isActivated);

        final actualIsAutoStartActivatedValue =
            await DriveKitTripAnalysis.instance.isAutoStartActivated();
        expect(actualIsAutoStartActivatedValue, equals(isActivated));
      });

      test('calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.activateAutoStart(any()))
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.activateAutoStart(true);
        verify(() => driveKitTripAnalysisPlatform.activateAutoStart(true));
        verifyNever(
          () => driveKitTripAnalysisPlatform.activateAutoStart(false),
        );
        await DriveKitTripAnalysis.instance.activateAutoStart(false);
        verify(() => driveKitTripAnalysisPlatform.activateAutoStart(false));
      });
    });

    group('activateCrashDetection', () {
      test('isCrashDetectionActivated returns true by default', () async {
        const isActivated = true;
        when(
          () => driveKitTripAnalysisPlatform.isCrashDetectionActivated(),
        ).thenAnswer((_) async => isActivated);

        final actualIsAutoStartActivatedValue =
            await DriveKitTripAnalysis.instance.isCrashDetectionActivated();
        expect(actualIsAutoStartActivatedValue, equals(isActivated));
      });

      test('calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.activateCrashDetection(any()))
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.activateCrashDetection(true);
        verify(() => driveKitTripAnalysisPlatform.activateCrashDetection(true));
        verifyNever(
          () => driveKitTripAnalysisPlatform.activateCrashDetection(false),
        );
        await DriveKitTripAnalysis.instance.activateCrashDetection(false);
        verify(() => driveKitTripAnalysisPlatform.activateCrashDetection(false))
            .called(1);
      });
    });

    group('manage trip manually', () {
      test('calls startTrip on platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.startTrip())
            .thenAnswer((_) async {
          return;
        });

        await driveKitTripAnalysisPlatform.startTrip();
        verify(() => driveKitTripAnalysisPlatform.startTrip());
      });

      test('stopTrip calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.stopTrip())
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.stopTrip();
        verify(() => driveKitTripAnalysisPlatform.stopTrip());
      });

      test('cancelTrip calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.cancelTrip())
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.cancelTrip();
        verify(() => driveKitTripAnalysisPlatform.cancelTrip());
      });

      group('isTripRunning', () {
        test('returns false if the SDK is in INACTIVE state', () async {
          const isRunning = false;
          when(
            () => driveKitTripAnalysisPlatform.isTripRunning(),
          ).thenAnswer((_) async => isRunning);

          final actualIsRunningValue =
              await DriveKitTripAnalysis.instance.isTripRunning();
          expect(actualIsRunningValue, equals(isRunning));
        });
      });

      test('setStopTimeOut calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.setStopTimeOut(any()))
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.setStopTimeOut(234);
        verify(() => driveKitTripAnalysisPlatform.setStopTimeOut(234))
            .called(1);
        verifyNever(() => driveKitTripAnalysisPlatform.setStopTimeOut(240));
      });

      group('monitorPotentialTripStart', () {
        test('isMonitoringPotentialTripStart calls platform implementatio',
            () async {
          const isActivated = false;
          when(
            () => driveKitTripAnalysisPlatform.isMonitoringPotentialTripStart(),
          ).thenAnswer((_) async => isActivated);

          final actualIsActivated = await DriveKitTripAnalysis.instance
              .isMonitoringPotentialTripStart();
          expect(actualIsActivated, equals(isActivated));
        });

        test('setMonitorPotentialTripStart calls platform implementation',
            () async {
          when(
            () =>
                driveKitTripAnalysisPlatform.setMonitorPotentialTripStart(true),
          ).thenAnswer((_) async {
            return;
          });

          await DriveKitTripAnalysis.instance
              .setMonitorPotentialTripStart(true);
          verify(
            () =>
                driveKitTripAnalysisPlatform.setMonitorPotentialTripStart(true),
          );
        });
      });
    });

    group('setVehicle', () {
      test('calls platform implementation', () async {
        const vehicle = Vehicle();

        when(() => driveKitTripAnalysisPlatform.setVehicle(vehicle))
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.setVehicle(vehicle);
        verify(() => driveKitTripAnalysisPlatform.setVehicle(vehicle));
      });
    });

    group('listener', () {
      test('addListener', () async {
        final listener = TripListener(beaconDetected: () {});
        when(() => driveKitTripAnalysisPlatform.addTripListener(any()))
            .thenAnswer((_) async {
          return;
        });
        DriveKitTripAnalysis.instance.addTripListener(listener);
        verify(() => driveKitTripAnalysisPlatform.addTripListener(listener))
            .called(1);
      });
      test('removeListener', () async {
        final listener = TripListener(
          beaconDetected: () {},
        );
        when(() => driveKitTripAnalysisPlatform.removeTripListener(any()))
            .thenAnswer((_) async {
          return;
        });
        DriveKitTripAnalysis.instance.removeTripListener(listener);
        verify(() => driveKitTripAnalysisPlatform.removeTripListener(listener))
            .called(1);
      });
      test('removeAllListeners', () async {
        when(() => driveKitTripAnalysisPlatform.removeAllTripListeners())
            .thenAnswer((_) async {
          return;
        });
        DriveKitTripAnalysis.instance.removeAllTripListeners();
        verify(() => driveKitTripAnalysisPlatform.removeAllTripListeners())
            .called(1);
      });
    });

    group('Trip metadata', () {
      test('getTripMetadata calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.getTripMetadata())
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.getTripMetadata();
        verify(() => driveKitTripAnalysisPlatform.getTripMetadata()).called(1);
      });

      test('updateTripMetadata calls platform implementation', () async {
        when(
          () => driveKitTripAnalysisPlatform.updateTripMetadata(any(), any()),
        ).thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.updateTripMetadata('key', 'value');
        verify(
          () => driveKitTripAnalysisPlatform.updateTripMetadata('key', 'value'),
        ).called(1);
      });

      test('setTripMetadata calls platform implementation', () async {
        when(
          () => driveKitTripAnalysisPlatform.setTripMetadata(any()),
        ).thenAnswer((_) async {
          return;
        });

        const mockedTripMetadata = {
          'key1': 'value1',
          'key2': 'value2',
        };
        await DriveKitTripAnalysis.instance.setTripMetadata(mockedTripMetadata);
        verify(
          () =>
              driveKitTripAnalysisPlatform.setTripMetadata(mockedTripMetadata),
        ).called(1);
      });
    });

    group('CurrentTripInfo', () {
      test('getCurrentTripInfo calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.getCurrentTripInfo())
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.getCurrentTripInfo();
        verify(() => driveKitTripAnalysisPlatform.getCurrentTripInfo())
            .called(1);
      });
    });

    group('LastTripLocation', () {
      test('getLastTripLocation calls platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.getLastTripLocation())
            .thenAnswer((_) async {
          return;
        });

        await DriveKitTripAnalysis.instance.getLastTripLocation();
        verify(() => driveKitTripAnalysisPlatform.getLastTripLocation())
            .called(1);
      });
    });

    group('Trip Sharing', () {
      test('isTripSharingAvailable returns true by default', () async {
        const isAvailable = true;
        when(
          () => driveKitTripAnalysisPlatform.isTripSharingAvailable(),
        ).thenAnswer((_) async => isAvailable);

        final actualIsTripSharingAvailable =
            await DriveKitTripAnalysis.instance.isTripSharingAvailable();
        expect(actualIsTripSharingAvailable, equals(isAvailable));
      });

      test('calls createTripSharingLink on platform implementation', () async {
        const mockedValue = 60;
        final mockedCreateTripSharingLinkResponse =
            CreateTripSharingLinkResponse(
          status: CreateTripSharingLinkStatus.success,
          data: DKTripSharingLink(
            code: 'myCode',
            url: 'myUrl',
            startDate: 'startDate',
            endDate: 'endDate',
          ),
        );
        when(
          () => driveKitTripAnalysisPlatform.createTripSharingLink(mockedValue),
        ).thenAnswer((_) async => mockedCreateTripSharingLinkResponse);
        await DriveKitTripAnalysis.instance.createTripSharingLink(mockedValue);
        verify(
          () => driveKitTripAnalysisPlatform.createTripSharingLink(mockedValue),
        ).called(1);
      });

      test('calls getTripSharingLink on platform implementation', () async {
        when(() => driveKitTripAnalysisPlatform.getTripSharingLink())
            .thenAnswer(
          (_) async => GetTripSharingLinkResponse(
            status: GetTripSharingLinkStatus.success,
            data: DKTripSharingLink(
              code: 'myCode',
              url: 'myUrl',
              startDate: 'startDate',
              endDate: 'endDate',
            ),
          ),
        );

        final mockedTripSharingLink = DKTripSharingLink(
          code: 'myCode',
          url: 'myUrl',
          startDate: 'startDate',
          endDate: 'endDate',
        );

        final actualTripSharingResponse =
            await DriveKitTripAnalysis.instance.getTripSharingLink();
        expect(
          actualTripSharingResponse.status,
          GetTripSharingLinkStatus.success,
        );
        expect(
          actualTripSharingResponse.data?.code,
          mockedTripSharingLink.code,
        );
        expect(
          actualTripSharingResponse.data?.url,
          mockedTripSharingLink.url,
        );
        expect(
          actualTripSharingResponse.data?.startDate,
          mockedTripSharingLink.startDate,
        );
        expect(
          actualTripSharingResponse.data?.endDate,
          mockedTripSharingLink.endDate,
        );
      });

      test('calls revokeTripSharingLink on platform implementation', () async {
        const mockedRevokeTripSharingLinkStatus =
            RevokeTripSharingLinkStatus.success;
        when(() => driveKitTripAnalysisPlatform.revokeTripSharingLink())
            .thenAnswer((_) async => mockedRevokeTripSharingLinkStatus);

        final actualRevokeTripSharingLinkStatus =
            await DriveKitTripAnalysis.instance.revokeTripSharingLink();
        expect(
          actualRevokeTripSharingLinkStatus,
          equals(
            mockedRevokeTripSharingLinkStatus,
          ),
        );
      });
    });
  });
}
