import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTripLifecycle extends StatelessWidget {
  const SliverTripLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trip lifecycle'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.startTrip();
          },
          child: const Text('Start trip'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.stopTrip();
          },
          child: const Text('Stop trip'),
        ),
        ElevatedButton(
          onPressed: () {
            DriveKitTripAnalysis.instance.cancelTrip();
          },
          child: const Text('Cancel trip'),
        ),
        ElevatedButton(
          onPressed: () async {
            final isTripRunning =
                await DriveKitTripAnalysis.instance.isTripRunning();
            final alertMessage =
                isTripRunning ? 'Trip is running' : 'Trip is not running';
            if (context.mounted) {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Trip'),
                    content: Text(alertMessage),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            'Is trip running ?',
          ),
        ),
      ],
    );
  }
}
