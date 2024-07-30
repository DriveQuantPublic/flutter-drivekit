import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class InitializeListeners extends StatefulWidget {
  const InitializeListeners({required this.child, super.key});

  final Widget child;

  @override
  State<InitializeListeners> createState() => _InitializeListenersState();
}

class _InitializeListenersState extends State<InitializeListeners> {
  late final DriveKitListener _listener;
  @override
  void initState() {
    super.initState();
    _listener = DriveKitListener(
      onConnected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('DriveKit connected'),
            ),
          );
        }
      },
      onDisconnected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('DriveKit disconnected'),
            ),
          );
        }
      },
      userIdUpdateStatus: (status, userId) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User ID update status: $status'),
            ),
          );
        }
      },
      onAuthenticationError: (errorType) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Authentication error: $errorType'),
            ),
          );
        }
      },
      onAccountDeleted: (status) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account deletion status: $status'),
            ),
          );
        }
      },
      onBackgroundFetchStatusChanged: (status) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Background fetch status: $status'),
            ),
          );
        }
      },
    );
    DriveKitCore.instance.addDriveKitListener(_listener);
  }

  @override
  void dispose() {
    DriveKitCore.instance.removeDriveKitListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
