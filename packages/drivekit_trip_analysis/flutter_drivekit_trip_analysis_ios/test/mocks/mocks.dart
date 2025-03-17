import 'package:flutter_drivekit_trip_analysis_ios/src/trip_analysis_api.g.dart';
import 'package:mocktail/mocktail.dart';

class MockIOSTripAnalysisApi extends Mock implements IOSTripAnalysisApi {}

class MockPigeonVehicle extends Mock implements PigeonVehicle {}

final mockPigeonDkCrashInfo = PigeonDKCrashInfo(
  crashId: 'crashId',
  latitude: 0,
  longitude: 0,
  probability: 0,
  velocity: 9,
  date: '',
  status: PigeonCrashStatus.confirmed,
  userLocationUrl: 'https://sharedtrip.drivequant.com/v1/MOCK',
);

final mockPigeonVehicle = PigeonVehicle();

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

final mockPigeonTripResponseStatus = PigeonTripResponseStatus(
  status: PigeonTripResponseStatusType.tripError,
  hasSafetyAndEcoDrivingScore: false,
  info: [],
  error: PigeonTripResponseError.noAccountSet,
);

final mockPigeonTripRecordingStartedState = PigeonTripRecordingStartedState(
  localTripId: 'myTripId',
  recordingStartDate: '2025-01-01T00:00:00.000',
  startMode: PigeonStartMode.manual,
);

final mockPigeonTripRecordingConfirmedState = PigeonTripRecordingConfirmedState(
  localTripId: 'myTripId',
  recordingStartDate: '2025-01-01T00:00:00.000',
  startMode: PigeonStartMode.manual,
  recordingConfirmationDate: '2025-01-01T00:00:20.000',
);

final mockPigeonTripRecordingCanceledState = PigeonTripRecordingCanceledState(
  localTripId: 'myTripId',
  recordingStartDate: '2025-01-01T00:00:00.000',
  startMode: PigeonStartMode.manual,
  recordingConfirmationDate: '2025-01-01T00:00:20.000',
  cancelationReason: PigeonTripCancelationReason.user,
);

final mockPigeonTripRecordingFinishedState = PigeonTripRecordingFinishedState(
  localTripId: 'myTripId',
  recordingStartDate: '2025-01-01T00:00:00.000',
  startMode: PigeonStartMode.manual,
  recordingConfirmationDate: '2025-01-01T00:00:20.000',
  recordingEndDate: '2025-01-01T00:36:50.000',
);
