import 'package:flutter_drivekit_driver_data_android/flutter_drivekit_driver_data_android.dart';
import 'package:flutter_drivekit_driver_data_android/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DrivekitDriverDataAndroid', () {
    late AndroidDriverDataApi androidDriverDataApi;

    setUp(() {
      androidDriverDataApi = MockAndroidDriverDataApi();
      DrivekitDriverDataPlatform.instance = DrivekitDriverDataAndroid(
        androidDriverDataApi: androidDriverDataApi,
      );
    });

    test('can be registered', () {
      DrivekitDriverDataAndroid.registerWith();
      expect(
        DrivekitDriverDataPlatform.instance,
        isA<DrivekitDriverDataAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mock
      when(androidDriverDataApi.getPlatformName)
          .thenAnswer((_) async => 'Android');

      //test
      final name = await DrivekitDriverDataPlatform.instance.getPlatformName();
      expect(name, 'Android');
    });

    test('Get Trips Ascending', () async {
      //mock
      when(
        () => androidDriverDataApi
            .getTripsOrderByDateAsc(transportationModes: []),
      ).thenAnswer(
        (_) async => PigeonGetTripsResponse(
          status: PigeonTripSyncStatus.success,
          trips: [],
        ),
      );

      //test
      await DrivekitDriverDataPlatform.instance
          .getTripsOrderByDateAsc(transportationModes: []);
      verify(
        () => androidDriverDataApi
            .getTripsOrderByDateAsc(transportationModes: []),
      ).called(1);
    });

    test('Get Trips Descending', () async {
      //mock
      when(
        () => androidDriverDataApi
            .getTripsOrderByDateDesc(transportationModes: []),
      ).thenAnswer(
        (_) async => PigeonGetTripsResponse(
          status: PigeonTripSyncStatus.success,
          trips: [],
        ),
      );

      //test
      await DrivekitDriverDataPlatform.instance
          .getTripsOrderByDateDesc(transportationModes: []);
      verify(
        () => androidDriverDataApi
            .getTripsOrderByDateDesc(transportationModes: []),
      ).called(1);
    });

    test('Get a Trip', () async {
      //mock
      when(() => androidDriverDataApi.getTrip(any())).thenAnswer(
        (_) async => PigeonGetTripResponse(
          status: PigeonTripSyncStatus.success,
        ),
      );

      //test
      await DrivekitDriverDataPlatform.instance.getTrip('');
      verify(() => androidDriverDataApi.getTrip('')).called(1);
    });

    test('Get a Route', () async {
      //mock
      when(() => androidDriverDataApi.getRoute(any())).thenAnswer(
        (_) async => PigeonGetRouteResponse(
          status: PigeonRouteSyncStatus.success,
        ),
      );

      //test
      await DrivekitDriverDataPlatform.instance.getRoute('');
      verify(() => androidDriverDataApi.getRoute('')).called(1);
    });

    test('Delete a trip', () async {
      //mock
      when(() => androidDriverDataApi.deleteTrip('')).thenAnswer(
        (_) async => false,
      );

      //test
      final deletionResult =
          await DrivekitDriverDataPlatform.instance.deleteTrip('');
      expect(deletionResult, false);
    });
  });
}
