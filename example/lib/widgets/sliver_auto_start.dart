import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverAutoStart extends StatefulWidget {
  const SliverAutoStart({super.key});

  @override
  State<SliverAutoStart> createState() => _SliverAutoStartState();
}

class _SliverAutoStartState extends State<SliverAutoStart> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Auto Start'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DrivekitTripAnalysis.instance.activateAutoStart(true);
          },
          child: const Text('Activate auto start'),
        ),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DrivekitTripAnalysis.instance.activateAutoStart(false);
          },
          child: const Text('Deactivate auto start'),
        ),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            final isAutoStartActivated =
                await DrivekitTripAnalysis.instance.isAutoStartActivated();
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
