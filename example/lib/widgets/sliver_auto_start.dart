import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverAutoStart extends StatelessWidget {
  const SliverAutoStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Auto Start'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.activateAutoStart(true);
          },
          child: const Text('Activate auto start'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.activateAutoStart(false);
          },
          child: const Text('Deactivate auto start'),
        ),
        ElevatedButton(
          onPressed: () async {
            final isAutoStartActivated =
                await DriveKitTripAnalysis.instance.isAutoStartActivated();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('Auto start activated: $isAutoStartActivated'),
                ),
              );
            }
          },
          child: const Text('Is auto start activated?'),
        ),
      ],
    );
  }
}
