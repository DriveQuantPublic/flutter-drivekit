import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverGetCurrentTripInfo extends StatelessWidget {
  const SliverGetCurrentTripInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DriveKitTripAnalysis.instance.getCurrentTripInfo();
        },
        child: const Text('Get CurrentTripInfo'),
      ),
    );
  }
}
