import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverStartTrip extends StatelessWidget {
  const SliverStartTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: DrivekitTripAnalysis.instance.startTrip,
        child: const Text('Start Trip'),
      ),
    );
  }
}
