import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverActivateCrashDetection extends StatefulWidget {
  const SliverActivateCrashDetection({super.key});

  @override
  State<SliverActivateCrashDetection> createState() =>
      _SliverActivateCrashDetectionState();
}

class _SliverActivateCrashDetectionState
    extends State<SliverActivateCrashDetection> {
  // in DriveKit SDK, crash detection configuration defaults to true
  bool _activateCrashDetection = true;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const Text('Activate Crash Detection'),
          const Spacer(),
          Switch(
            value: _activateCrashDetection,
            onChanged: (value) {
              DrivekitTripAnalysis.activateCrashDetection(value);
              setState(() {
                _activateCrashDetection = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
