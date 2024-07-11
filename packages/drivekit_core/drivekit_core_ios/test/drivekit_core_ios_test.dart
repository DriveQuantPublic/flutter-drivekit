import 'package:drivekit_core_ios/drivekit_core_ios.dart';
import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitCoreIOS', () {
    const kPlatformName = 'iOS';
    late DrivekitCoreIOS drivekitCore;
    late List<MethodCall> log;

    setUp(() async {
      drivekitCore = DrivekitCoreIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(drivekitCore.methodChannel,
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
      DrivekitCoreIOS.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await drivekitCore.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
