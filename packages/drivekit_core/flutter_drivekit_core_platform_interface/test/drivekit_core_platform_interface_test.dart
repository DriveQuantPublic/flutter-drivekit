import 'package:flutter_drivekit_core_platform_interface/flutter_drivekit_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class DrivekitCoreMock extends DrivekitCorePlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DrivekitCorePlatformInterface', () {
    late DrivekitCorePlatform drivekitCorePlatform;

    setUp(() {
      drivekitCorePlatform = DrivekitCoreMock();
      DrivekitCorePlatform.instance = drivekitCorePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await DrivekitCorePlatform.instance.getPlatformName(),
          equals(DrivekitCoreMock.mockPlatformName),
        );
      });
    });
  });
}
