import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverEnableLogging extends StatefulWidget {
  const SliverEnableLogging({super.key});

  @override
  State<SliverEnableLogging> createState() => _SliverEnableLoggingState();
}

class _SliverEnableLoggingState extends State<SliverEnableLogging> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          await DriveKitCore.enableLogging(
            androidLogPath: '/YouDriveKitFolder',
            // ignore: avoid_redundant_argument_values
            showInConsole: true,
          );
        },
        child: const Text(
          'Enable logging',
        ),
      ),
    );
  }
}
