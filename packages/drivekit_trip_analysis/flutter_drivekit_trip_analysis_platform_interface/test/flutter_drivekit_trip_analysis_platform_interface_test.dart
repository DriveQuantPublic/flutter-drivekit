import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class DrivekitTripAnalysisMock extends DrivekitTripAnalysisPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DrivekitTripAnalysisPlatformInterface', () {
    late DrivekitTripAnalysisPlatform drivekitTripAnalysisPlatform;

    setUp(() {
      drivekitTripAnalysisPlatform = DrivekitTripAnalysisMock();
      DrivekitTripAnalysisPlatform.instance = drivekitTripAnalysisPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await DrivekitTripAnalysisPlatform.instance.getPlatformName(),
          equals(DrivekitTripAnalysisMock.mockPlatformName),
        );
      });
    });
  });
}
