// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_simulator_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSTripSimulatorApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterTripSimulatorError'),
    dartPackageName: 'pigeon_trip_simulator_package',
  ),
)
@HostApi()
abstract class IOSTripSimulatorApi {
  String getPlatformName();
}