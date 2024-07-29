/// Listener on DriveKit core.
class DriveKitListener {
  /// creates a [DriveKitListener]
  DriveKitListener({
    this.onConnected,
    this.onDisconnected,
    this.userIdUpdateStatus,
    this.onAuthenticationError,
    this.onAccountDeleted,

    /// iOS only
    this.onBackgroundFetchStatusChanged,
  });

  /// The user has been successfully logged
  void Function()? onConnected;

  /// The user has been disconnected (manual logout or the account is disabled/deleted)
  void Function()? onDisconnected;

  /// The update userId request has been processed
  /// with a [UpdateUserIdStatus] state value
  void Function(
    UpdateUserIdStatus status,
    String? userId,
  )? userIdUpdateStatus;

  /// The login has failed due to a [RequestError]
  void Function(RequestError errorType)? onAuthenticationError;

  /// The delete account request has been processed
  /// with a [DeleteAccountStatus] state value
  void Function(DeleteAccountStatus status)? onAccountDeleted;

  /// iOS only.
  /// The background fetch status has changed
  void Function(BackgroundFetchStatus status)? onBackgroundFetchStatusChanged;
}

/// Describes the deletion status
enum DeleteAccountStatus {
  /// Account deleted successfully.
  success,

  /// Account not deleted, an error has occurred.
  failedToDelete,

  /// Account deletion not activated for this team.
  forbidden;
}

/// Describes the error type of a DriveKit request.
enum RequestError {
  /// the url is invalid
  wrongUrl,

  /// The user has no connection or a bad one during the request.
  noNetwork,

  /// A request has been launched but the user is not logged (401 error).
  unauthenticated,

  /// A 403 error occurred. You might don't have access to call that service.
  /// Please contact the DriveQuant to learn more.
  forbidden,

  /// Drivequant's backend responds with a 500 server error.
  serverError,

  /// Drivequant's backend responds with a 400 error different than
  /// [unauthenticated], [forbidden] and [limitReached]
  clientError,

  /// The DriveKit API key has reached the accounts number limit.
  /// Please contact the Drivequant team.
  limitReached,

  /// An unknown error occurred, please contact the Drivequant
  /// team to investigate the issue.
  unknownError;
}

/// Explains the request status after a userId has asked to be changed.
enum UpdateUserIdStatus {
  /// The userId has been successfully updated
  updated,

  /// Occurs when DriveKit is not configured yet or if the
  /// new userId is the same as the old one
  failedToUpdate,

  /// Error returned when the new userId is blank
  invalidUserId,

  /// The new userId is already taken by another user
  alreadyUsed,

  /// The request failed but a retry will be done
  savedForRepost;
}

/// Describes the status of a background fetch.
enum BackgroundFetchStatus {
  /// The background fetch has started.
  started,

  /// The background fetch has been completed.
  completed;
}
