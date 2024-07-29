import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverStartTrip extends StatefulWidget {
  const SliverStartTrip({super.key});

  @override
  State<SliverStartTrip> createState() => _SliverStartTripState();
}

class _SliverStartTripState extends State<SliverStartTrip> {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: DrivekitTripAnalysis.startTrip,
        child: Text('Start Trip'),
      ),
    );
  }
}
