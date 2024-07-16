import 'package:flutter/services.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/src/method_channel_drivekit_trip_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelDrivekitTripAnalysis', () {
    late MethodChannelDrivekitTripAnalysis methodChannelDrivekitTripAnalysis;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelDrivekitTripAnalysis = MethodChannelDrivekitTripAnalysis();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelDrivekitTripAnalysis.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName =
          await methodChannelDrivekitTripAnalysis.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
