// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/IOSCoreApi.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FlutterCoreError'),
    dartPackageName: 'pigeon_core_package',
  ),
)
@HostApi()
abstract class IOSCoreApi {
  String getPlatformName();
  void setApiKey(String key);
  void setUserId(String userId);
  String? getUserId();
  void reset();
  bool isTokenValid();
  void deleteAccount({bool instantDeletion = false});
  String? getApiKey();
  void enableLogging({bool showInConsole = true});
  void disableLogging({bool showInConsole = true});
}
