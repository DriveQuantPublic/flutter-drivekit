import 'package:flutter_drivekit_trip_analysis_ios/flutter_drivekit_trip_analysis_ios.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/model_adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IOSTripAnalysisApi iOSTripAnalysisApi;
  late FlutterTripAnalysisApi flutterTripAnalysisApi;

  setUpAll(() {
    registerFallbackValue(MockPigeonVehicle());
    registerFallbackValue(MockPigeonPostGenericResponse());
  });

  setUp(() {
    iOSTripAnalysisApi = MockIOSTripAnalysisApi();
    flutterTripAnalysisApi =
        DriveKitTripAnalysisIOS(iosTripAnalysisApi: iOSTripAnalysisApi);
    DriveKitTripAnalysisPlatform.instance =
        flutterTripAnalysisApi as DriveKitTripAnalysisIOS;
  });

  group('DriveKitTripAnalysisIOS', () {
    test('can be registered', () {
      DriveKitTripAnalysisIOS.registerWith();
      expect(
        DriveKitTripAnalysisPlatform.instance,
        isA<DriveKitTripAnalysisIOS>(),
      );
    });

    test('isAutoStartActivated returns false by default', () async {
      //mocks
      when(iOSTripAnalysisApi.isAutoStartActivated)
          .thenAnswer((_) async => false);

      //test
      final isActivated =
          await DriveKitTripAnalysisPlatform.instance.isAutoStartActivated();
      expect(isActivated, false);
    });

    test('activateAutoStart calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.activateAutoStart(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.activateAutoStart(true);
      verify(() => iOSTripAnalysisApi.activateAutoStart(true)).called(1);
      verifyNever(() => iOSTripAnalysisApi.activateAutoStart(false));

      await DriveKitTripAnalysisPlatform.instance.activateAutoStart(false);
      verify(() => iOSTripAnalysisApi.activateAutoStart(false)).called(1);
    });

    test('isCrashDetectionActivated returns true by default', () async {
      //mocks
      when(iOSTripAnalysisApi.isCrashDetectionActivated)
          .thenAnswer((_) async => true);

      //test
      final isActivated = await DriveKitTripAnalysisPlatform.instance
          .isCrashDetectionActivated();
      expect(isActivated, true);
    });

    test(
        'activateCrashDetection calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.activateCrashDetection(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.activateCrashDetection(true);
      verify(() => iOSTripAnalysisApi.activateCrashDetection(true)).called(1);
      verifyNever(() => iOSTripAnalysisApi.activateCrashDetection(false));

      await DriveKitTripAnalysisPlatform.instance.activateCrashDetection(false);
      verify(() => iOSTripAnalysisApi.activateCrashDetection(false)).called(1);
    });

    test('startTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.startTrip();
      verify(() => iOSTripAnalysisApi.startTrip()).called(1);
    });

    test('stopTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.stopTrip()).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.stopTrip();
      verify(() => iOSTripAnalysisApi.stopTrip()).called(1);
    });

    test('cancelTrip calls ios implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.cancelTrip()).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.cancelTrip();
      verify(() => iOSTripAnalysisApi.cancelTrip()).called(1);
    });

    test('isTripRunning returns false if the SDK is in INACTIVE state',
        () async {
      //mocks
      when(iOSTripAnalysisApi.isTripRunning).thenAnswer((_) async => false);

      //test
      final isRunning =
          await DriveKitTripAnalysisPlatform.instance.isTripRunning();
      expect(isRunning, false);
    });

    test('setStopTimeOut calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.setStopTimeOut(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.setStopTimeOut(222);
      verify(() => iOSTripAnalysisApi.setStopTimeOut(222)).called(1);
      verifyNever(() => iOSTripAnalysisApi.setStopTimeOut(240));
    });

    test('isMonitoringPotentialTripStart calls iOS implementation', () async {
      //mock
      when(iOSTripAnalysisApi.isMonitoringPotentialTripStart)
          .thenAnswer((_) async => false);

      //test
      final isActivated = await DriveKitTripAnalysisPlatform.instance
          .isMonitoringPotentialTripStart();
      verify(() => iOSTripAnalysisApi.isMonitoringPotentialTripStart())
          .called(1);
      expect(isActivated, false);
    });

    test('setMonitorPotentialTripStart calls iOS implementation', () async {
      //mock
      when(() => iOSTripAnalysisApi.setMonitorPotentialTripStart(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance
          .setMonitorPotentialTripStart(true);
      verify(() => iOSTripAnalysisApi.setMonitorPotentialTripStart(true))
          .called(1);
    });

    test('setVehicle calls iOS implementation', () async {
      //mock
      const mockVehicle = Vehicle();
      when(() => iOSTripAnalysisApi.setVehicle(any())).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.setVehicle(mockVehicle);
      verify(
        () => iOSTripAnalysisApi.setVehicle(any()),
      ).called(1);
    });

    test('vehicle toPigeonImplementation includes all attributes', () {
      //mock
      const vehicle = Vehicle(
        carTypeIndex: 0,
        carEngineIndex: 2,
        carPower: 3,
        carMass: 4,
        carGearboxIndex: 5,
        carConsumption: 6.5,
        carAutoGearboxNumber: 1,
        engineDisplacement: 7,
        carPassengers: 2,
        dqIndex: 'dq',
        sra: 'sra',
        frontTireSize: '200/59/13',
        rearTireSize: '215/35/26',
        length: 8.5,
        width: 9.8,
        height: 10.45,
        engineCylinderNb: 11,
        driveWheels: 12,
      );

      //test
      final pigeonVehicle = vehicle.toPigeonImplementation();
      expect(pigeonVehicle.carTypeIndex, vehicle.carTypeIndex);
      expect(pigeonVehicle.carEngineIndex, vehicle.carEngineIndex);
      expect(pigeonVehicle.carPower, vehicle.carPower);
      expect(pigeonVehicle.carMass, vehicle.carMass);
      expect(pigeonVehicle.carGearboxIndex, vehicle.carGearboxIndex);
      expect(pigeonVehicle.carConsumption, vehicle.carConsumption);
      expect(pigeonVehicle.carAutoGearboxNumber, vehicle.carAutoGearboxNumber);
      expect(pigeonVehicle.engineDisplacement, vehicle.engineDisplacement);
      expect(pigeonVehicle.carPassengers, vehicle.carPassengers);
      expect(pigeonVehicle.dqIndex, vehicle.dqIndex);
      expect(pigeonVehicle.sra, vehicle.sra);
      expect(pigeonVehicle.frontTireSize, vehicle.frontTireSize);
      expect(pigeonVehicle.rearTireSize, vehicle.rearTireSize);
      expect(pigeonVehicle.length, vehicle.length);
      expect(pigeonVehicle.width, vehicle.width);
      expect(pigeonVehicle.height, vehicle.height);
      expect(pigeonVehicle.engineCylinderNb, vehicle.engineCylinderNb);
      expect(pigeonVehicle.driveWheels, vehicle.driveWheels);
    });

    test(
        'null vehicle.toPigeonImplementation includes null attributes'
        ' and includes default attributes value if not possible to be null',
        () {
      const vehicle = Vehicle();

      //test
      final pigeonVehicle = vehicle.toPigeonImplementation();
      expect(pigeonVehicle.carTypeIndex, 1);
      expect(pigeonVehicle.carEngineIndex, 1);
      expect(pigeonVehicle.carPower, 150);
      expect(pigeonVehicle.carMass, 1400);
      expect(pigeonVehicle.carGearboxIndex, 2);
      expect(pigeonVehicle.carConsumption, 4.5);
      expect(pigeonVehicle.carAutoGearboxNumber, 0);
      expect(pigeonVehicle.engineDisplacement, 1200);
      expect(pigeonVehicle.carPassengers, 1);
      expect(pigeonVehicle.dqIndex, isNull);
      expect(pigeonVehicle.sra, isNull);
      expect(pigeonVehicle.frontTireSize, isNull);
      expect(pigeonVehicle.rearTireSize, isNull);
      expect(pigeonVehicle.length, 4.5);
      expect(pigeonVehicle.width, 1.8);
      expect(pigeonVehicle.height, 1.45);
      expect(pigeonVehicle.engineCylinderNb, 4);
      expect(pigeonVehicle.driveWheels, 0);
    });

    group('TripListener', () {
      test('can listen several listeners', () async {
        var beaconDetectedCount = 0;
        var crashDetectedCount = 0;
        var crashFeedbackSentCount = 0;
        var sdkStateChangedCount = 0;
        var significantLocationChangeDetectedCount = 0;
        var tripCancelledCount = 0;
        var tripFinishedCount = 0;
        var tripPointCount = 0;
        var tripSavedForRepostCount = 0;
        var tripStartedCount = 0;
        //test
        DriveKitTripAnalysisPlatform.instance.addTripListener(
          TripListener(
            beaconDetected: () => beaconDetectedCount++,
            crashDetected: (crashInfo) => crashDetectedCount++,
            crashFeedbackSent: (crashInfo, feedbackType, severity) =>
                crashFeedbackSentCount++,
            sdkStateChanged: (state) => sdkStateChangedCount++,
            significantLocationChangeDetected: (state) =>
                significantLocationChangeDetectedCount++,
            tripCancelled: (cancelTrip) => tripCancelledCount++,
            tripFinished: (post, response) => tripFinishedCount++,
            tripPoint: (tripPoint) => tripPointCount++,
            tripSavedForRepost: () => tripSavedForRepostCount++,
            tripStarted: (startMode) => tripStartedCount++,
          ),
        );
        flutterTripAnalysisApi.beaconDetected();
        expect(beaconDetectedCount, 1);
        expect(crashDetectedCount, 0);

        flutterTripAnalysisApi.crashDetected(mockPigeonDkCrashInfo);
        expect(crashDetectedCount, 1);

        flutterTripAnalysisApi.crashFeedbackSent(
          mockPigeonDkCrashInfo,
          PigeonDKCrashFeedbackType.crashConfirmed,
          PigeonDKCrashFeedbackSeverity.minor,
        );
        expect(crashFeedbackSentCount, 1);

        flutterTripAnalysisApi.sdkStateChanged(PigeonState.inactive);
        expect(sdkStateChangedCount, 1);

        flutterTripAnalysisApi.tripCancelled(PigeonCancelTrip.beaconNoSpeed);
        expect(tripCancelledCount, 1);

        flutterTripAnalysisApi.tripFinished(mockPigeonPost, mockPigeonResponse);
        expect(tripFinishedCount, 1);

        flutterTripAnalysisApi.tripPoint(mockPigeonTripPoint);
        expect(tripPointCount, 1);

        flutterTripAnalysisApi.tripSavedForRepost();
        expect(tripSavedForRepostCount, 1);

        flutterTripAnalysisApi.tripStarted(PigeonStartMode.bluetooth);
        expect(tripStartedCount, 1);

        flutterTripAnalysisApi.significantLocationChangeDetected(
          PigeonLocation(longitude: 40, latitude: 2),
        );
        expect(significantLocationChangeDetectedCount, 1);

        DriveKitTripAnalysisPlatform.instance.addTripListener(
          TripListener(
            beaconDetected: () => beaconDetectedCount++,
            crashDetected: (crashInfo) => crashDetectedCount++,
            crashFeedbackSent: (crashInfo, feedbackType, severity) =>
                crashFeedbackSentCount++,
            sdkStateChanged: (state) => sdkStateChangedCount++,
            significantLocationChangeDetected: (state) =>
                significantLocationChangeDetectedCount++,
            tripCancelled: (cancelTrip) => tripCancelledCount++,
            tripFinished: (post, response) => tripFinishedCount++,
            tripPoint: (tripPoint) => tripPointCount++,
            tripSavedForRepost: () => tripSavedForRepostCount++,
            tripStarted: (startMode) => tripStartedCount++,
          ),
        );
        flutterTripAnalysisApi.beaconDetected();
        expect(beaconDetectedCount, 3);

        flutterTripAnalysisApi.crashDetected(mockPigeonDkCrashInfo);
        expect(crashDetectedCount, 3);

        flutterTripAnalysisApi.crashFeedbackSent(
          mockPigeonDkCrashInfo,
          PigeonDKCrashFeedbackType.crashConfirmed,
          PigeonDKCrashFeedbackSeverity.minor,
        );
        expect(crashFeedbackSentCount, 3);

        flutterTripAnalysisApi.sdkStateChanged(PigeonState.inactive);
        expect(sdkStateChangedCount, 3);

        flutterTripAnalysisApi.tripCancelled(PigeonCancelTrip.beaconNoSpeed);
        expect(tripCancelledCount, 3);

        flutterTripAnalysisApi.tripFinished(mockPigeonPost, mockPigeonResponse);
        expect(tripFinishedCount, 3);

        flutterTripAnalysisApi.tripPoint(mockPigeonTripPoint);
        expect(tripPointCount, 3);

        flutterTripAnalysisApi.tripSavedForRepost();
        expect(tripSavedForRepostCount, 3);

        flutterTripAnalysisApi.tripStarted(PigeonStartMode.bluetooth);
        expect(tripStartedCount, 3);

        flutterTripAnalysisApi.significantLocationChangeDetected(
          PigeonLocation(longitude: 40, latitude: 2),
        );
        expect(significantLocationChangeDetectedCount, 3);
      });

      test(
        'a trip listener callback is transmitted with the right arguments',
        () async {
          final crashDetectedList = <DKCrashInfo>[];
          //test
          DriveKitTripAnalysisPlatform.instance.addTripListener(
            TripListener(
              crashDetected: crashDetectedList.add,
            ),
          );
          flutterTripAnalysisApi.crashDetected(mockPigeonDkCrashInfo);
          expect(crashDetectedList, hasLength(1));
          expect(
            crashDetectedList.first.crashId,
            mockPigeonDkCrashInfo.crashId,
          );
          expect(
            crashDetectedList.first.latitude,
            mockPigeonDkCrashInfo.latitude,
          );
          expect(
            crashDetectedList.first.longitude,
            mockPigeonDkCrashInfo.longitude,
          );
          expect(
            crashDetectedList.first.probability,
            mockPigeonDkCrashInfo.probability,
          );
          expect(
            crashDetectedList.first.velocity,
            mockPigeonDkCrashInfo.velocity,
          );
          expect(
            crashDetectedList.first.date,
            mockPigeonDkCrashInfo.date,
          );
          expect(
            crashDetectedList.first.status?.name,
            mockPigeonDkCrashInfo.status?.name,
          );
        },
      );

      test('can remove a listener', () async {
        var beaconDetectedCount = 0;
        var crashDetectedCount = 0;
        var crashFeedbackSentCount = 0;
        var sdkStateChangedCount = 0;
        var significantLocationChangeDetectedCount = 0;
        var tripCancelledCount = 0;
        var tripFinishedCount = 0;
        var tripPointCount = 0;
        var tripSavedForRepostCount = 0;
        var tripStartedCount = 0;

        final listener = TripListener(
          beaconDetected: () => beaconDetectedCount++,
          crashDetected: (crashInfo) => crashDetectedCount++,
          crashFeedbackSent: (crashInfo, feedbackType, severity) =>
              crashFeedbackSentCount++,
          sdkStateChanged: (state) => sdkStateChangedCount++,
          significantLocationChangeDetected: (state) =>
              significantLocationChangeDetectedCount++,
          tripCancelled: (cancelTrip) => tripCancelledCount++,
          tripFinished: (post, response) => tripFinishedCount++,
          tripPoint: (tripPoint) => tripPointCount++,
          tripSavedForRepost: () => tripSavedForRepostCount++,
          tripStarted: (startMode) => tripStartedCount++,
        );
        //test
        DriveKitTripAnalysisPlatform.instance.addTripListener(listener);
        DriveKitTripAnalysisPlatform.instance.removeTripListener(listener);

        flutterTripAnalysisApi
          ..beaconDetected()
          ..crashDetected(mockPigeonDkCrashInfo)
          ..crashFeedbackSent(
            mockPigeonDkCrashInfo,
            PigeonDKCrashFeedbackType.crashConfirmed,
            PigeonDKCrashFeedbackSeverity.minor,
          )
          ..sdkStateChanged(PigeonState.inactive)
          ..tripCancelled(PigeonCancelTrip.beaconNoSpeed)
          ..tripFinished(mockPigeonPost, mockPigeonResponse)
          ..tripPoint(mockPigeonTripPoint)
          ..tripSavedForRepost()
          ..tripStarted(PigeonStartMode.bluetooth);

        expect(beaconDetectedCount, 0);
        expect(crashDetectedCount, 0);
        expect(crashFeedbackSentCount, 0);
        expect(sdkStateChangedCount, 0);
        expect(significantLocationChangeDetectedCount, 0);
        expect(tripCancelledCount, 0);
        expect(tripFinishedCount, 0);
        expect(tripPointCount, 0);
        expect(tripSavedForRepostCount, 0);
        expect(tripStartedCount, 0);
      });

      test('can remove all listeners at once', () async {
        var beaconDetectedCount = 0;
        var crashDetectedCount = 0;
        var crashFeedbackSentCount = 0;
        var sdkStateChangedCount = 0;
        var significantLocationChangeDetectedCount = 0;
        var tripCancelledCount = 0;
        var tripFinishedCount = 0;
        var tripPointCount = 0;
        var tripSavedForRepostCount = 0;
        var tripStartedCount = 0;

        final listener = TripListener(
          beaconDetected: () => beaconDetectedCount++,
          crashDetected: (crashInfo) => crashDetectedCount++,
          crashFeedbackSent: (crashInfo, feedbackType, severity) =>
              crashFeedbackSentCount++,
          sdkStateChanged: (state) => sdkStateChangedCount++,
          significantLocationChangeDetected: (state) =>
              significantLocationChangeDetectedCount++,
          tripCancelled: (cancelTrip) => tripCancelledCount++,
          tripFinished: (post, response) => tripFinishedCount++,
          tripPoint: (tripPoint) => tripPointCount++,
          tripSavedForRepost: () => tripSavedForRepostCount++,
          tripStarted: (startMode) => tripStartedCount++,
        );
        DriveKitTripAnalysisPlatform.instance.addTripListener(listener);
        DriveKitTripAnalysisPlatform.instance.addTripListener(listener);
        flutterTripAnalysisApi.beaconDetected();
        DriveKitTripAnalysisPlatform.instance.removeAllTripListeners();

        flutterTripAnalysisApi
          ..beaconDetected()
          ..crashDetected(mockPigeonDkCrashInfo)
          ..crashFeedbackSent(
            mockPigeonDkCrashInfo,
            PigeonDKCrashFeedbackType.crashConfirmed,
            PigeonDKCrashFeedbackSeverity.minor,
          )
          ..sdkStateChanged(PigeonState.inactive)
          ..tripCancelled(PigeonCancelTrip.beaconNoSpeed)
          ..tripFinished(mockPigeonPost, mockPigeonResponse)
          ..tripPoint(mockPigeonTripPoint)
          ..tripSavedForRepost()
          ..tripStarted(PigeonStartMode.bluetooth);

        expect(beaconDetectedCount, 2);
        expect(crashDetectedCount, 0);
        expect(crashFeedbackSentCount, 0);
        expect(sdkStateChangedCount, 0);
        expect(significantLocationChangeDetectedCount, 0);
        expect(tripCancelledCount, 0);
        expect(tripFinishedCount, 0);
        expect(tripPointCount, 0);
        expect(tripSavedForRepostCount, 0);
        expect(tripStartedCount, 0);
      });
    });

    test('Indicates if the analyzed trip is valid or not', () async {
      //mocks
      when(() => iOSTripAnalysisApi.getTripResponseStatus(any()))
          .thenAnswer((_) async => mockPigeonTripResponseStatus);

      //test
      final tripResponseStatus =
          await DriveKitTripAnalysisPlatform.instance.getTripResponseStatus(
        const PostGenericResponse(
          status: false,
          itinId: '',
          comments: [Comment(errorCode: 10, comment: 'no account set')],
        ),
      );
      final expectedResult =
          mockPigeonTripResponseStatus.toModelImplementation();
      expect(
        tripResponseStatus?.error,
        mockPigeonTripResponseStatus.error?.toModelImplementation(),
      );
      expect(
        tripResponseStatus?.hasSafetyAndEcoDrivingScore,
        mockPigeonTripResponseStatus.hasSafetyAndEcoDrivingScore,
      );
      expect(tripResponseStatus?.info, expectedResult.info);
      expect(tripResponseStatus?.status, expectedResult.status);
    });
  });

  group('Trip Metadata', () {
    test('getTripMetadata returns a null map by default', () async {
      //mocks
      when(iOSTripAnalysisApi.getTripMetadata).thenAnswer((_) async => null);

      //test
      final metadata =
          await DriveKitTripAnalysisPlatform.instance.getTripMetadata();
      expect(metadata, null);
    });

    test('getTripMetadata calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.updateTripMetadata(any(), any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance
          .updateTripMetadata('key', 'value');
      verify(() => iOSTripAnalysisApi.updateTripMetadata('key', 'value'))
          .called(1);
    });

    test('setTripMetadata calls ios implementation with correct argument',
        () async {
      //mock
      when(() => iOSTripAnalysisApi.setTripMetadata(any()))
          .thenAnswer((_) async {});

      //test
      const mockedTripMetadata = {
        'key1': 'value1',
        'key2': 'value2',
      };
      await DriveKitTripAnalysisPlatform.instance
          .setTripMetadata(mockedTripMetadata);
      verify(() => iOSTripAnalysisApi.setTripMetadata(mockedTripMetadata))
          .called(1);
    });
  });
}
