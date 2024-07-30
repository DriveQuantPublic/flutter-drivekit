import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverRemoveAllListeners extends StatelessWidget {
  const SliverRemoveAllListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DriveKitCore.instance.removeAllDriveKitListeners();
        },
        child: const Text('Remove all listeners'),
      ),
    );
  }
}
