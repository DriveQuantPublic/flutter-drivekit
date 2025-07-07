import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';
import 'package:flutter_drivekit_driver_data_platform_interface/flutter_drivekit_driver_data_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDriveKitDriverDataPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DriveKitDriverDataPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final driveKitDriverData = DriveKitDriverData.instance;

  group('DriveKitDriverData', () {
    late DriveKitDriverDataPlatform drivekitDriverDataPlatform;

    setUp(() {
      drivekitDriverDataPlatform = MockDriveKitDriverDataPlatform();
      DriveKitDriverDataPlatform.instance = drivekitDriverDataPlatform;
    });

    group('Get Trips', () {
      test('Get Trips Ascending', () async {
        when(
          () => drivekitDriverDataPlatform
              .getTripsOrderByDateAsc(transportationModes: []),
        ).thenAnswer(
          (_) async =>
              GetTripsResponse(status: TripSyncStatus.success, trips: []),
        );

        await driveKitDriverData
            .getTripsOrderByDateAsc(transportationModes: []);
        verify(
          () => driveKitDriverData
              .getTripsOrderByDateAsc(transportationModes: []),
        ).called(1);
      });

      test('Get Trips Descending', () async {
        when(
          () => drivekitDriverDataPlatform
              .getTripsOrderByDateDesc(transportationModes: []),
        ).thenAnswer(
          (_) async =>
              GetTripsResponse(status: TripSyncStatus.success, trips: []),
        );

        await driveKitDriverData
            .getTripsOrderByDateDesc(transportationModes: []);
        verify(
          () => driveKitDriverData
              .getTripsOrderByDateDesc(transportationModes: []),
        ).called(1);
      });
    });

    group('getTrip', () {
      test('Get a trip', () async {
        when(
          () => drivekitDriverDataPlatform.getTrip(any()),
        ).thenAnswer(
          (_) async => GetTripResponse(
            trip: null,
            status: TripSyncStatus.success,
          ),
        );

        await driveKitDriverData.getTrip('');
        verify(() => driveKitDriverData.getTrip('')).called(1);
      });
    });

    group('getRoute', () {
      test('Get a route', () async {
        when(
          () => drivekitDriverDataPlatform.getRoute(any()),
        ).thenAnswer(
          (_) async => GetRouteResponse(
            route: null,
            status: RouteSyncStatus.success,
          ),
        );

        await driveKitDriverData.getRoute('');
        verify(() => driveKitDriverData.getRoute('')).called(1);
      });
    });

    group('deleteTrip', () {
      test('Delete a trip', () async {
        const result = false;
        when(
          () => drivekitDriverDataPlatform.deleteTrip(any()),
        ).thenAnswer((_) async => result);

        final actualDeletionResult = await driveKitDriverData.deleteTrip('');
        expect(actualDeletionResult, equals(result));
      });
    });

    group('update driver passenger mode', () {
      test('Declare trip made as passenger', () async {
        when(
          () => drivekitDriverDataPlatform.updateDriverPassengerMode(
            'itinId',
            DriverPassengerMode.passenger,
            'comment',
          ),
        ).thenAnswer((_) async => UpdateDriverPassengerModeStatus.success);

        await driveKitDriverData.updateDriverPassengerMode(
          'itinId',
          DriverPassengerMode.passenger,
          'comment',
        );
        verify(
          () => driveKitDriverData.updateDriverPassengerMode(
            'itinId',
            DriverPassengerMode.passenger,
            'comment',
          ),
        ).called(1);
      });
    });
  });
}
