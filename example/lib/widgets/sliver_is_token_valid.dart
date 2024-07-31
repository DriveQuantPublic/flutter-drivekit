import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverTokenValidity extends StatelessWidget {
  const SliverTokenValidity({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          final isValid = await DriveKitCore.instance.isTokenValid();
          final alertMessage = isValid
              ? 'Token is valid : user is connected'
              : 'Token is not valid : user is not connected';
          if (context.mounted) {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Token validity'),
                  content: Text(alertMessage),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text(
          'Check token validity',
        ),
      ),
    );
  }
}
