import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverStopTrip extends StatelessWidget {
  const SliverStopTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: DrivekitTripAnalysis.instance.stopTrip,
        child: const Text('Stop Trip'),
      ),
    );
  }
}
