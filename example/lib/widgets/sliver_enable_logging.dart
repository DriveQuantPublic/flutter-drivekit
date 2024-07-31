import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverEnableLogging extends StatelessWidget {
  const SliverEnableLogging({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          await DriveKitCore.enableLogging(
            // ignore: avoid_redundant_argument_values
            showInConsole: true,
            androidLogPath: '/YouDriveKitFolder',
          );
        },
        child: const Text(
          'Enable logging',
        ),
      ),
    );
  }
}
