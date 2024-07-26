import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverSetMonitorPotentialTripStart extends StatefulWidget {
  const SliverSetMonitorPotentialTripStart({super.key});

  @override
  State<SliverSetMonitorPotentialTripStart> createState() =>
      _SliverSetMonitorPotentialTripStartState();
}

class _SliverSetMonitorPotentialTripStartState
    extends State<SliverSetMonitorPotentialTripStart> {
  // in DriveKit SDK, monitorPotentialTripStart defaults to false
  bool _monitorPotentialTripStart = false;

  @override
  Widget build(BuildContext context) {
    final driveKitTripAnalysis = DrivekitTripAnalysis();
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const Text('Monitor Potential Trip Start'),
          const Spacer(),
          Switch(
            value: _monitorPotentialTripStart,
            onChanged: (value) {
              driveKitTripAnalysis.setMonitorPotentialTripStart(value);
              setState(() {
                _monitorPotentialTripStart = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
