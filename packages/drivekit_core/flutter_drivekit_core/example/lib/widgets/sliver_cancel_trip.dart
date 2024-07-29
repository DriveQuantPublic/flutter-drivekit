import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverCancelTrip extends StatefulWidget {
  const SliverCancelTrip({super.key});

  @override
  State<SliverCancelTrip> createState() => _SliverCancelTripState();
}

class _SliverCancelTripState extends State<SliverCancelTrip> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: DrivekitTripAnalysis.instance.cancelTrip,
        child: const Text('Cancel Trip'),
      ),
    );
  }
}
