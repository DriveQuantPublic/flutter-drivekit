import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverMonitorPotentialTripStart extends StatelessWidget {
  const SliverMonitorPotentialTripStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Monitor Potential Trip Start'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.setMonitorPotentialTripStart(true);
          },
          child: const Text('Activate monitorPotentialTripStart'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.setMonitorPotentialTripStart(false);
          },
          child: const Text('Deactivate monitorPotentialTripStart'),
        ),
        ElevatedButton(
          onPressed: () async {
            final isMonitoringPotentialTripStart = await DriveKitTripAnalysis
                .instance
                .isMonitoringPotentialTripStart();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('is monitoring potentialTripStart:'
                      ' $isMonitoringPotentialTripStart'),
                ),
              );
            }
          },
          child: const Text('Is monitoring potential trip start ?'),
        ),
      ],
    );
  }
}
