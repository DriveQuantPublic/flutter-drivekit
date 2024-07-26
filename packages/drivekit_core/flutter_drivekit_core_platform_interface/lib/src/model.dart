/// Listener on DriveKit core.
class DriveKitListener {
  /// creates a [DriveKitListener]
  DriveKitListener({this.onConnected});

  /// callback triggered when the user is connected
  void Function()? onConnected;
}
