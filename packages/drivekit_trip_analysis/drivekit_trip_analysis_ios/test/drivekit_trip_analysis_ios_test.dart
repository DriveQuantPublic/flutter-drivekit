import 'package:drivekit_trip_analysis_ios/drivekit_trip_analysis_ios.dart';
import 'package:drivekit_trip_analysis_platform_interface/drivekit_trip_analysis_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitTripAnalysisIOS', () {
    const kPlatformName = 'iOS';
    late DrivekitTripAnalysisIOS drivekitTripAnalysis;
    late List<MethodCall> log;

    setUp(() async {
      drivekitTripAnalysis = DrivekitTripAnalysisIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(drivekitTripAnalysis.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      DrivekitTripAnalysisIOS.registerWith();
      expect(
        DrivekitTripAnalysisPlatform.instance,
        isA<DrivekitTripAnalysisIOS>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      final name = await drivekitTripAnalysis.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
