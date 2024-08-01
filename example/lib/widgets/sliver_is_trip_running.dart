import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class SliverIsTripRunning extends StatelessWidget {
  const SliverIsTripRunning({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          final isTripRunning =
              await DrivekitTripAnalysis.instance.isTripRunning();
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
          'Check Trip Running ?',
        ),
      ),
    );
  }
}