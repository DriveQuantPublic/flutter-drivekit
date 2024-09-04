import 'package:flutter_drivekit_trip_analysis_android/flutter_drivekit_trip_analysis_android.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/model_adapter.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockPigeonVehicle());
    registerFallbackValue(MockPigeonPostGenericResponse());
  });

  group('DriveKitTripAnalysisAndroid', () {
    late AndroidTripAnalysisApi androidTripAnalysisApi;
    late FlutterTripAnalysisApi flutterTripAnalysisApi;

    setUp(() {
      androidTripAnalysisApi = MockAndroidTripAnalysisApi();
      flutterTripAnalysisApi = DriveKitTripAnalysisAndroid(
        androidTripAnalysisApi: androidTripAnalysisApi,
      );
      DriveKitTripAnalysisPlatform.instance =
          flutterTripAnalysisApi as DriveKitTripAnalysisAndroid;
    });
    test('can be registered', () {
      DriveKitTripAnalysisAndroid.registerWith();
      expect(
        DriveKitTripAnalysisPlatform.instance,
        isA<DriveKitTripAnalysisAndroid>(),
      );
    });

    test('isAutoStartActivated returns false by default,', () async {
      //mocks
      when(androidTripAnalysisApi.isAutoStartActivated)
          .thenAnswer((_) async => false);

      //test
      final isActivated =
          await DriveKitTripAnalysisPlatform.instance.isAutoStartActivated();
      expect(isActivated, false);
    });

    test('activateAutoStart calls android implementation with correct argument',
        () async {
      //mock
      when(() => androidTripAnalysisApi.activateAutoStart(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.activateAutoStart(true);
      verify(() => androidTripAnalysisApi.activateAutoStart(true)).called(1);
      verifyNever(() => androidTripAnalysisApi.activateAutoStart(false));

      await DriveKitTripAnalysisPlatform.instance.activateAutoStart(false);
      verify(() => androidTripAnalysisApi.activateAutoStart(false)).called(1);
    });

    test('isCrashDetectionActivated returns true by default,', () async {
      //mocks
      when(androidTripAnalysisApi.isCrashDetectionActivated)
          .thenAnswer((_) async => true);

      //test
      final isActivated = await DriveKitTripAnalysisPlatform.instance
          .isCrashDetectionActivated();
      expect(isActivated, true);
    });

    test('activateCrashDetection calls android implem. with correct argument',
        () async {
      //mock
      when(() => androidTripAnalysisApi.activateCrashDetection(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.activateCrashDetection(true);
      verify(() => androidTripAnalysisApi.activateCrashDetection(true))
          .called(1);
      verifyNever(() => androidTripAnalysisApi.activateCrashDetection(false));

      await DriveKitTripAnalysisPlatform.instance.activateCrashDetection(false);
      verify(() => androidTripAnalysisApi.activateCrashDetection(false))
          .called(1);
    });

    test('startTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.startTrip()).thenAnswer((_) async {});

      await DriveKitTripAnalysisPlatform.instance.startTrip();
      verify(() => androidTripAnalysisApi.startTrip()).called(1);
    });

    test('stopTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.stopTrip()).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.stopTrip();
      verify(() => androidTripAnalysisApi.stopTrip()).called(1);
    });

    test('cancelTrip calls android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.cancelTrip()).thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.cancelTrip();
      verify(() => androidTripAnalysisApi.cancelTrip()).called(1);
    });

    test('isTripRunning returns false if the SDK is in INACTIVE state,',
        () async {
      //mocks
      when(androidTripAnalysisApi.isTripRunning).thenAnswer((_) async => false);

      //test
      final isRunning =
          await DriveKitTripAnalysisPlatform.instance.isTripRunning();
      expect(isRunning, false);
    });

    test('setStopTimeOut calls ios implementation with correct argument',
        () async {
      //mock
      when(() => androidTripAnalysisApi.setStopTimeOut(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.setStopTimeOut(222);
      verify(() => androidTripAnalysisApi.setStopTimeOut(222)).called(1);
      verifyNever(() => androidTripAnalysisApi.setStopTimeOut(240));
    });

    test('isMonitoringPotentialTripStart calls Android implementation,',
        () async {
      //mocks
      when(androidTripAnalysisApi.isMonitoringPotentialTripStart)
          .thenAnswer((_) async => false);

      //test
      final isActivated = await DriveKitTripAnalysisPlatform.instance
          .isMonitoringPotentialTripStart();
      expect(isActivated, false);
    });

    test('setMonitorPotentialTripStart calls Android implementation', () async {
      //mock
      when(() => androidTripAnalysisApi.setMonitorPotentialTripStart(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance
          .setMonitorPotentialTripStart(true);
      verify(() => androidTripAnalysisApi.setMonitorPotentialTripStart(true))
          .called(1);
    });

    test('setVehicle calls android implementation', () async {
      //mock
      const mockVehicle = Vehicle();
      when(() => androidTripAnalysisApi.setVehicle(any()))
          .thenAnswer((_) async {});

      //test
      await DriveKitTripAnalysisPlatform.instance.setVehicle(mockVehicle);
      verify(
        () => androidTripAnalysisApi.setVehicle(any()),
      ).called(1);
    });

    test('vehicle toPigeonImplementation mirrors vehicle properties', () {
      //mock
      const vehicle = Vehicle(
        carTypeIndex: 0,
        carEngineIndex: 2,
        carPower: 3,
        carMass: 4,
        carGearboxIndex: 5,
        carConsumption: 6.5,
        carAutoGearboxNumber: 13,
        engineDisplacement: 7,
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

        flutterTripAnalysisApi.tripStarted(PigeonStartMode.bicycleActivity);
        expect(tripStartedCount, 1);

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

        flutterTripAnalysisApi.tripStarted(PigeonStartMode.bicycleActivity);
        expect(tripStartedCount, 3);

        // significantLocationChangeDetected is not supported on Android
        expect(significantLocationChangeDetectedCount, 0);
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
          ..tripStarted(PigeonStartMode.bicycleActivity);

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
          ..tripStarted(PigeonStartMode.bicycleActivity);

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
    test('Indicates if the analyzed trip is valid or not,', () async {
      //mocks

      when(() => androidTripAnalysisApi.getTripResponseStatus(any()))
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
}
