// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/driver_data_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/driverdata/DriverDataApi.kt',
    kotlinOptions: KotlinOptions(
      errorClassName: 'FlutterCoreError',
      package: 'com.drivequant.drivekit.flutter.driverdata',
    ),
    dartPackageName: 'pigeon_driver_data_package',
  ),
)
@HostApi()
abstract class AndroidDriverDataApi {
  String getPlatformName();
  bool deleteTrip(String itinId);
}
