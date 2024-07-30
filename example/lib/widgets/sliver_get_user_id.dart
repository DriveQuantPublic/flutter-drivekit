import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverGetUserId extends StatelessWidget {
  const SliverGetUserId({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          final userId = await DriveKitCore.instance.getUserId();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).primaryColor,
                content: Text(
                  userId != null ? 'User ID: $userId' : 'No user ID set.',
                ),
              ),
            );
          }
        },
        child: const Text(
          'Get user ID',
        ),
      ),
    );
  }
}
