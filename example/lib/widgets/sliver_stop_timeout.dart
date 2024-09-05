import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverStopTimeout extends StatefulWidget {
  const SliverStopTimeout({super.key});

  @override
  State<SliverStopTimeout> createState() => _SliverStopTimeoutState();
}

class _SliverStopTimeoutState extends State<SliverStopTimeout> {
  final TextEditingController _setStopTimeoutController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Stop timeout'),
        TextField(
          keyboardType: TextInputType.number,
          controller: _setStopTimeoutController,
          decoration: const InputDecoration(
            labelText: 'Stop timeout',
            hintText: 'Enter the stop timeout in seconds',
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              DriveKitTripAnalysis.instance
                  .setStopTimeOut(int.parse(_setStopTimeoutController.text));
            },
            child: const Text('Set stop timeout'),
          ),
        ),
      ],
    );
  }
}
