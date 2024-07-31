import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverRemoveAllDriveKitListeners extends StatelessWidget {
  const SliverRemoveAllDriveKitListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DriveKitCore.instance.removeAllDriveKitListeners();
        },
        child: const Text('Remove all DriveKitListener'),
      ),
    );
  }
}
