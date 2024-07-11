import 'package:drivekit_core_android/drivekit_core_android.dart';
import 'package:drivekit_core_platform_interface/drivekit_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DrivekitCoreAndroid', () {
    const kPlatformName = 'Android';
    late DrivekitCoreAndroid drivekitCore;
    late List<MethodCall> log;

    setUp(() async {
      drivekitCore = DrivekitCoreAndroid();

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
      DrivekitCoreAndroid.registerWith();
      expect(DrivekitCorePlatform.instance, isA<DrivekitCoreAndroid>());
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
