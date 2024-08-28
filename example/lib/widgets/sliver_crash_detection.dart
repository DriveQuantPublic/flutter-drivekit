import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverCrashDetection extends StatefulWidget {
  const SliverCrashDetection({super.key});

  @override
  State<SliverCrashDetection> createState() => _SliverCrashDetectionState();
}

class _SliverCrashDetectionState extends State<SliverCrashDetection> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Crash Detection'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DrivekitTripAnalysis.instance.activateCrashDetection(true);
          },
          child: const Text('Activate crash detection'),
        ),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DrivekitTripAnalysis.instance.activateCrashDetection(false);
          },
          child: const Text('Deactivate crash detection'),
        ),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            final isCrashDetectionActivated =
                await DrivekitTripAnalysis.instance.isCrashDetectionActivated();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    'Crash detection activated: $isCrashDetectionActivated',
                  ),
                ),
              );
            }
          },
          child: const Text('Is crash detection activated?'),
        ),
      ],
    );
  }
}
