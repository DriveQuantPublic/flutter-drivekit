import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverLogs extends StatelessWidget {
  const SliverLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Logs'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            if (!context.mounted) return;
            await DriveKitCore.enableLogging(
              // ignore: avoid_redundant_argument_values
              showInConsole: true,
              androidLogPath: '/YouDriveKitFolder',
            );
          },
          child: const Text('Enable logging'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (!context.mounted) return;
            await DriveKitCore.instance.disableLogging();
          },
          child: const Text('Disable logging'),
        ),
        ElevatedButton(
          onPressed: () async {
            final logFile = await DriveKitCore.getLogUriFile();
            String snackBarText;
            if (logFile == null) {
              snackBarText = 'Log file Uri: null';
            } else {
              snackBarText = 'Log file Uri: $logFile';
            }
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(snackBarText),
                ),
              );
            }
          },
          child: const Text('Get Log file uri'),
        ),
      ],
    );
  }
}
