import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverSetBeacons extends StatelessWidget {
  const SliverSetBeacons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
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
    );
  }
}
