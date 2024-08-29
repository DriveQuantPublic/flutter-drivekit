import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverRemoveAllTripListeners extends StatelessWidget {
  const SliverRemoveAllTripListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DriveKitTripAnalysis.instance.removeAllTripListeners();
        },
        child: const Text('Remove all TripListener'),
      ),
    );
  }
}
