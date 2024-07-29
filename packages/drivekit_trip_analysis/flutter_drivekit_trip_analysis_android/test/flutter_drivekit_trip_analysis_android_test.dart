import 'package:flutter_drivekit_trip_analysis_android/flutter_drivekit_trip_analysis_android.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockPigeonVehicle());
  });

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

    test('getMonitorPotentialTripStart calls Android implementation,',
        () async {
      //mocks
      when(androidTripAnalysisApi.getMonitorPotentialTripStart)
          .thenAnswer((_) async => false);

      //test
      final isActivated = await DrivekitTripAnalysisPlatform.instance
          .getMonitorPotentialTripStart();
      expect(isActivated, false);
    test('setVehicle calls android implementation', () async {
      //mock
      const mockVehicle = Vehicle();
      when(() => androidTripAnalysisApi.setVehicle(any()))
          .thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.setVehicle(mockVehicle);
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
  });
}
