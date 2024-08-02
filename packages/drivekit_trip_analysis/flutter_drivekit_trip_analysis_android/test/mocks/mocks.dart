import 'package:flutter_drivekit_trip_analysis_android/src/trip_analysis_api.g.dart';
import 'package:mocktail/mocktail.dart';

class MockAndroidTripAnalysisApi extends Mock
    implements AndroidTripAnalysisApi {}

class MockPigeonVehicle extends Mock implements PigeonVehicle {}

final mockPigeonDkCrashInfo = PigeonDKCrashInfo(
  crashId: 'crashId',
  latitude: 0,
  longitude: 0,
  probability: 0,
  velocity: 9,
  date: 2,
  status: PigeonCrashStatus.confirmed,
);

final mockPigeonRoute = PigeonRoute(
  activityValue: [],
  gpsAccuracy: [],
  gpsDate: [],
  gpsVelocity: [],
  longitude: [],
  latitude: [],
  gpsElevation: [],
  gpsHeading: [],
  screenLocked: [],
  roll: [],
  pitch: [],
  yaw: [],
  gyroscopeNormVar: [],
);

final mockPigeonItineraryData = PigeonItineraryData();

final mockPigeonVehicle = PigeonVehicle();

final mockPigeonPost = PigeonPostGeneric(
  route: mockPigeonRoute,
  vehicle: mockPigeonVehicle,
  itineraryData: mockPigeonItineraryData,
);

final mockPigeonResponse = PigeonPostGenericResponse(
  status: true,
  itinId: '',
  comments: [],
);

final mockPigeonTripPoint = PigeonTripPoint(
  latitude: 0,
  longitude: 0,
  speed: 0,
  accuracy: 0,
  elevation: 0,
  distance: 0,
  heading: 0,
  duration: 0,
);
