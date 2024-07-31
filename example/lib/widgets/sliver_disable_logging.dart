import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverDisableLogging extends StatelessWidget {
  const SliverDisableLogging({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          if (!context.mounted) return;
          await DriveKitCore.instance.disableLogging();
        },
        child: const Text('Disable logging'),
      ),
    );
  }
}
