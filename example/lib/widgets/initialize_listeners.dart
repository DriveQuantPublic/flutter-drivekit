import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class InitializeListeners extends StatefulWidget {
  const InitializeListeners({required this.child, super.key});

  final Widget child;

  @override
  State<InitializeListeners> createState() => _InitializeListenersState();
}

class _InitializeListenersState extends State<InitializeListeners> {
  @override
  void initState() {
    super.initState();
    DriveKitCore.instance.addDriveKitListener(
      DriveKitListener(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
