// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/src/main/kotlin/com/drivequant/drivekit/flutter/core/CoreApi.kt',
    kotlinOptions: KotlinOptions(
        errorClassName: 'FlutterCoreError',
        package: 'com.drivequant.drivekit.flutter.core',
    ),
    dartPackageName: 'pigeon_core_package',
  ),
)
@HostApi()
abstract class AndroidCoreApi {
  String getPlatformName();
  void setApiKey(String key);
  void setUserId(String userId);
}
