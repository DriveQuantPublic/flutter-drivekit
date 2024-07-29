import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverGetLogFileUri extends StatefulWidget {
  const SliverGetLogFileUri({super.key});

  @override
  State<SliverGetLogFileUri> createState() => _SliverGetLogFileUriState();
}

class _SliverGetLogFileUriState extends State<SliverGetLogFileUri> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final logFile = await DriveKitCore.getLogUriFile();
              String snackBarText;
              if (logFile == null) {
                snackBarText = 'Log file Uri: null';
              } else {
                snackBarText =
                    '${logFile.platform} Log file Uri: ${logFile.uri}';
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
        ),
      ],
    );
  }
}
