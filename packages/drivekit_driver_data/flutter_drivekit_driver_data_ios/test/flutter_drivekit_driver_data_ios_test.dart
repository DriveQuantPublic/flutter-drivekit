import 'package:flutter_drivekit_driver_data_ios/flutter_drivekit_driver_data_ios.dart';
import 'package:flutter_drivekit_driver_data_ios/src/driver_data_api.g.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mocks.dart';

void main() {
  group('DriveKitDriverDataIOS', () {
    late IOSDriverDataApi iosDriverDataApi;

    setUp(() {
      iosDriverDataApi = MockIOSDriverDataApi();
      DriveKitDriverDataPlatform.instance =
          DriveKitDriverDataIOS(iosDriverDataApi: iosDriverDataApi);
    });

    test('can be registered', () {
      DriveKitDriverDataIOS.registerWith();
      expect(
        DriveKitDriverDataPlatform.instance,
        isA<DriveKitDriverDataIOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      //mocks
      when(iosDriverDataApi.getPlatformName).thenAnswer((_) async => 'iOS');

      //test
      final name = await DriveKitDriverDataPlatform.instance.getPlatformName();
      expect(name, 'iOS');
    });

    test('Get Trips Ascending', () async {
      //mock
      when(
        () => iosDriverDataApi.getTripsOrderByDateAsc(transportationModes: []),
      ).thenAnswer(
        (_) async => PigeonGetTripsResponse(
          status: PigeonTripSyncStatus.success,
          trips: [],
        ),
      );

      //test
      await DriveKitDriverDataPlatform.instance
          .getTripsOrderByDateAsc(transportationModes: []);
      verify(
        () => iosDriverDataApi.getTripsOrderByDateAsc(transportationModes: []),
      ).called(1);
    });

    test('Get Trips Descending', () async {
      //mock
      when(
        () => iosDriverDataApi.getTripsOrderByDateDesc(transportationModes: []),
      ).thenAnswer(
        (_) async => PigeonGetTripsResponse(
          status: PigeonTripSyncStatus.success,
          trips: [],
        ),
      );

      //test
      await DriveKitDriverDataPlatform.instance
          .getTripsOrderByDateDesc(transportationModes: []);
      verify(
        () => iosDriverDataApi.getTripsOrderByDateDesc(transportationModes: []),
      ).called(1);
    });

    test('Get a Trip', () async {
      //mock
      when(() => iosDriverDataApi.getTrip(any())).thenAnswer(
        (_) async => PigeonGetTripResponse(
          status: PigeonTripSyncStatus.success,
        ),
      );

      //test
      await DriveKitDriverDataPlatform.instance.getTrip('');
      verify(() => iosDriverDataApi.getTrip('')).called(1);
    });

    test('Get a Route', () async {
      //mock
      when(() => iosDriverDataApi.getRoute(any())).thenAnswer(
        (_) async => PigeonGetRouteResponse(
          status: PigeonRouteSyncStatus.success,
        ),
      );

      //test
      await DriveKitDriverDataPlatform.instance.getRoute('');
      verify(() => iosDriverDataApi.getRoute('')).called(1);
    });

    test('Delete a trip', () async {
      //mocks
      when(() => iosDriverDataApi.deleteTrip(''))
          .thenAnswer((_) async => false);

      //test
      final name = await DriveKitDriverDataPlatform.instance.deleteTrip('');
      expect(name, false);
    });
  });
}
