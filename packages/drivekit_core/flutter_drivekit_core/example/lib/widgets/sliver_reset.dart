import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverReset extends StatefulWidget {
  const SliverReset({super.key});

  @override
  State<SliverReset> createState() => _SliverResetState();
}

class _SliverResetState extends State<SliverReset> {
  @override
  Widget build(BuildContext context) {
    final driveKitCore = DriveKitCore();
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          if (!context.mounted) return;
          try {
            await driveKitCore.reset();
          } catch (error) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).primaryColor,
                content: Text('$error'),
              ),
            );
          }
        },
        child: const Text('Reset'),
      ),
    );
  }
}
