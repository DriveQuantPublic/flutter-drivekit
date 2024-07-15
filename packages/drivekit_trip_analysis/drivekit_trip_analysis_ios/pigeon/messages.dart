// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSTripAnalysisApi.swift',
    swiftOptions: SwiftOptions(),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class IOSTripAnalysisApi {
  String getPlatformName();
}