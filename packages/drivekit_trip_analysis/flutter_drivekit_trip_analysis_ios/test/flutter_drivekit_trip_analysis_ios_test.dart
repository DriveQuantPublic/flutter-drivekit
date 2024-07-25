import 'package:flutter_drivekit_trip_analysis_ios/flutter_drivekit_trip_analysis_ios.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/adapter.dart';
import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IOSTripAnalysisApi iOSTripAnalysisApi;

  setUpAll(() {
    registerFallbackValue(MockPigeonVehicle());
  });

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

    test('setVehicle calls iOS implementation', () async {
      //mock
      const mockVehicle = Vehicle();
      when(() => iOSTripAnalysisApi.setVehicle(any())).thenAnswer((_) async {});

      //test
      await DrivekitTripAnalysisPlatform.instance.setVehicle(mockVehicle);
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
      expect(pigeonVehicle.carTypeIndex, 0);
      expect(pigeonVehicle.carEngineIndex, 2);
      expect(pigeonVehicle.carPower, 3);
      expect(pigeonVehicle.carMass, 4);
      expect(pigeonVehicle.carGearboxIndex, 5);
      expect(pigeonVehicle.carConsumption, 6.5);
      expect(pigeonVehicle.carAutoGearboxNumber, 1);
      expect(pigeonVehicle.engineDisplacement, 7);
      expect(pigeonVehicle.carPassengers, 2);
      expect(pigeonVehicle.dqIndex, 'dq');
      expect(pigeonVehicle.sra, 'sra');
      expect(pigeonVehicle.frontTireSize, '200/59/13');
      expect(pigeonVehicle.rearTireSize, '215/35/26');
      expect(pigeonVehicle.length, 8.5);
      expect(pigeonVehicle.width, 9.8);
      expect(pigeonVehicle.height, 10.45);
      expect(pigeonVehicle.engineCylinderNb, 11);
      expect(pigeonVehicle.driveWheels, 12);
    });
  });
}
