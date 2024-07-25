import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDrivekitCorePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DrivekitCorePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final driveKitCore = DriveKitCore();

  group('DrivekitCore', () {
    late DrivekitCorePlatform drivekitCorePlatform;

    setUp(() {
      drivekitCorePlatform = MockDrivekitCorePlatform();
      DrivekitCorePlatform.instance = drivekitCorePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => drivekitCorePlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await driveKitCore.getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });
    });

    group('apiKey', () {
      test('calls setApiKey on platform implementation', () async {
        when(() => drivekitCorePlatform.setApiKey(any()))
            .thenAnswer((_) async {});

        await driveKitCore.setApiKey('api_key');
        verify(() => drivekitCorePlatform.setApiKey('api_key'));
      });

      test('calls getApiKey on platform implementation', () async {
        const mockedApiKey = 'apiKeyTest';
        when(() => drivekitCorePlatform.getApiKey())
            .thenAnswer((_) async => mockedApiKey);

        final actualApiKey = await driveKitCore.getApiKey();
        expect(actualApiKey, equals(mockedApiKey));
      });
    });

    group('userId', () {
      test('calls setUserId on platform implementation', () async {
        when(() => drivekitCorePlatform.setUserId(any()))
            .thenAnswer((_) async {});

        await driveKitCore.setUserId('user_id');
        verify(() => drivekitCorePlatform.setUserId('user_id'));
      });

      test('calls getUserId on platform implementation', () async {
        const mockedUserId = 'userIdTest';
        when(() => drivekitCorePlatform.getUserId())
            .thenAnswer((_) async => mockedUserId);

        final actualUserId = await driveKitCore.getUserId();
        expect(actualUserId, equals(mockedUserId));
      });
    });

    group('reset', () {
      test('calls reset on platform implementation', () async {
        when(() => drivekitCorePlatform.reset()).thenAnswer((_) async {});

        await driveKitCore.reset();
        verify(() => drivekitCorePlatform.reset());
      });
    });

    group('isTokenValid', () {
      test('returns true if token is valid and user is connected', () async {
        const tokenValidity = true;
        when(
          () => drivekitCorePlatform.isTokenValid(),
        ).thenAnswer((_) async => tokenValidity);

        final actualTokenValidity = await driveKitCore.isTokenValid();
        expect(actualTokenValidity, equals(tokenValidity));
      });
    });

    group('delete account', () {
      test('deletes user account', () async {
        when(() => drivekitCorePlatform.deleteAccount())
            .thenAnswer((_) async {});

        await driveKitCore.deleteAccount();
        verify(() => drivekitCorePlatform.deleteAccount());
      });
    });

    group('getApiKey', () {
      test('returns correct api key value when getApiKey is called', () async {
        const mockApiKey = '__mock_api_key__';
        when(
          () => drivekitCorePlatform.setApiKey(mockApiKey),
        ).thenAnswer((_) async => mockApiKey);

        final actualApiKey = await driveKitCore.getApiKey();
        expect(actualApiKey, equals(mockApiKey));
      });
    });
  });
}
