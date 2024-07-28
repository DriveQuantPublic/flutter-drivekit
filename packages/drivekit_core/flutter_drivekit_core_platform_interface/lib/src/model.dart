/// Listener on DriveKit core.
class DriveKitListener {
  /// creates a [DriveKitListener]
  DriveKitListener({
    this.onConnected,
    this.onDisconnected,
    this.userIdUpdateStatus,
    this.onAuthenticationError,
    this.onAccountDeleted,
    this.onBackgroundFetchStatusChanged,
  });

  /// callback triggered when the user is connected
  void Function()? onConnected;
  void Function()? onDisconnected;
  void Function(
    UpdateUserIdStatus status,
    String? userId,
  )? userIdUpdateStatus;
  void Function(RequestError errorType)? onAuthenticationError;
  void Function(DeleteAccountStatus status)? onAccountDeleted;

  /// iOS only
  void Function(BackgroundFetchStatus status)? onBackgroundFetchStatusChanged;
}

enum DeleteAccountStatus {
  success,
  failedToDelete,
  forbidden;
}

enum RequestError {
  wrongUrl,
  noNetwork,
  unauthenticated,
  forbidden,
  serverError,
  clientError,
  limitReached,
  unknownError;
}

enum UpdateUserIdStatus {
  updated,
  failedToUpdate,
  invalidUserId,
  alreadyUsed,
  savedForRepost;
}

enum BackgroundFetchStatus {
  started,
  completed;
}
