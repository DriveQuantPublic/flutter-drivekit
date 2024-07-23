import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverStopTrip extends StatefulWidget {
  const SliverStopTrip({super.key});

  @override
  State<SliverStopTrip> createState() => _SliverStopTripState();
}

class _SliverStopTripState extends State<SliverStopTrip> {
  @override
  Widget build(BuildContext context) {
    final driveKitTripAnalysis = DrivekitTripAnalysis();
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: driveKitTripAnalysis.stopTrip,
        child: const Text('Stop Trip'),
      ),
    );
  }
}
