import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTripSharing extends StatelessWidget {
  const SliverTripSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trip Sharing'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            final isAvailable =
                await DriveKitTripAnalysis.instance.isTripSharingAvailable();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    'Trip Sharing available: $isAvailable',
                  ),
                ),
              );
            }
          },
          child: const Text('Feature available?'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.activateCrashDetection(false);
          },
          child: const Text('Create link (1 hour)'),
        ),
      ],
    );
  }
}
