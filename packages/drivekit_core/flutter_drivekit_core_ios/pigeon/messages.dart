// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSCoreApi.swift',
    swiftOptions: SwiftOptions(),
    dartPackageName: 'pigeon_core_package',
  ),
)
@HostApi()
abstract class IOSCoreApi {
  String getPlatformName();
}
