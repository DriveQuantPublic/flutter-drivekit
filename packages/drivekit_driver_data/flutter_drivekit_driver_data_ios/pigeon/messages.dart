// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/driver_data_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSDriverDataApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterDriverDataError'),
    dartPackageName: 'pigeon_driver_data_package',
  ),
)
@HostApi()
abstract class IOSDriverDataApi {
  String getPlatformName();
  bool deleteTrip(String itinId);
}
