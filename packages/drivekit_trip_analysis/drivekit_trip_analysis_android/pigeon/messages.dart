// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trip_analysis_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivekit/trip_analysis/TripAnalysisApi.kt',
    kotlinOptions: KotlinOptions(),
    dartPackageName: 'pigeon_trip_analysis_package',
  ),
)
@HostApi()
abstract class AndroidTripAnalysisApi {
  String getPlatformName();
}
