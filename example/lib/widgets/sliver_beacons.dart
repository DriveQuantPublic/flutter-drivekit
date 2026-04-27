import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverBeacons extends StatelessWidget {
  const SliverBeacons({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Beacons'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.setBeacons(
              [
                const BeaconData(
                  proximityUuid: '123e4567-e89b-12d3-a456-426614174000',
                  major: 1,
                  minor: 1,
                ),
                const BeaconData(
                  proximityUuid: '123e4567-e89b-12d3-a456-426614174001',
                  major: 1,
                  minor: 2,
                ),
              ],
            );
          },
          child: const Text('Set beacons'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.setBeaconRequired(true);
          },
          child: const Text('Set beacon required'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.setBeaconRequired(false);
          },
          child: const Text('Set beacon not required'),
        ),
      ],
    );
  }
}
