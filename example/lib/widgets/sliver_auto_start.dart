import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverAutoStart extends StatefulWidget {
  const SliverAutoStart({super.key});

  @override
  State<SliverAutoStart> createState() => _SliverAutoStartState();
}

class _SliverAutoStartState extends State<SliverAutoStart> {
  // in DriveKit SDK, autoStart defaults to false
  bool _autoStart = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const Text('Auto Start'),
          const Spacer(),
          Switch(
            value: _autoStart,
            onChanged: (value) {
              DrivekitTripAnalysis.instance.activateAutoStart(value);
              setState(() {
                _autoStart = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
