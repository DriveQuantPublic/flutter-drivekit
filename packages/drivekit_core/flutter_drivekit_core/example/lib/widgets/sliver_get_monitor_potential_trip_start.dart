import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverGetMonitorPotentialTripStart extends StatefulWidget {
  const SliverGetMonitorPotentialTripStart({super.key});

  @override
  State<SliverGetMonitorPotentialTripStart> createState() =>
      _SliverGetMonitorPotentialTripStartState();
}

class _SliverGetMonitorPotentialTripStartState
    extends State<SliverGetMonitorPotentialTripStart> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final monitorPotentialTripStart =
                  await DrivekitTripAnalysis.getMonitorPotentialTripStart();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text(
                      'monitorPotentialTripStart: $monitorPotentialTripStart',
                    ),
                  ),
                );
              }
            },
            child: const Text('Get monitor potential trip start'),
          ),
        ),
      ],
    );
  }
}
