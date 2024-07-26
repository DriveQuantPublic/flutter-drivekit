import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverDisableLogging extends StatefulWidget {
  const SliverDisableLogging({super.key});

  @override
  State<SliverDisableLogging> createState() => _SliverDisableLoggingState();
}

class _SliverDisableLoggingState extends State<SliverDisableLogging> {
  @override
  Widget build(BuildContext context) {
    final driveKitCore = DriveKitCore();
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          if (!context.mounted) return;
          await driveKitCore.disableLogging();
        },
        child: const Text('Disable logging'),
      ),
    );
  }
}
