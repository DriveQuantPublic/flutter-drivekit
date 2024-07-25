// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/core_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/drivequant/drivekit/flutter/core/CoreApi.kt',
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
  String? getUserId();
  void reset();
  bool isTokenValid();
  void deleteAccount({bool instantDeletion = false});
  String? getApiKey();
  void disableLogging({bool showInConsole = true});
}

@FlutterApi()
abstract class FlutterCoreApi {
  void pigeonOnAuthenticationError(PigeonRequestError errorType);
  void pigeonOnAccountDeleted(PigeonDeleteAccountStatus status);
  void pigeonOnConnected();
  void pigeonOnDisconnected();
  void pigeonUserIdUpdateStatus(
      PigeonUpdateUserIdStatus status,
      String? userId,
      );
}

enum PigeonDeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum PigeonRequestError {
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  unknownError,
  limitReached;
}

enum PigeonUpdateUserIdStatus {
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
}
