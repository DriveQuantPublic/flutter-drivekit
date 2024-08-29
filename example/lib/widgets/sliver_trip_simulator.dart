import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTripSimulation extends StatelessWidget {
  const SliverTripSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trip Simulator'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DriveKitTripSimulator.instance.start(PresetTrip.shortTrip);
          },
          child: const Text('Start Simulation (shortTrip)'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripSimulator.instance.start(PresetTrip.mixedTrip);
          },
          child: const Text('Start Simulation (mixedTrip)'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripSimulator.instance.stop();
          },
          child: const Text('Stop trip simulation'),
        ),
      ],
    );
  }
}
