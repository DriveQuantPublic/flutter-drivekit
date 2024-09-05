import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTripMetadata extends StatefulWidget {
  const SliverTripMetadata({super.key});

  @override
  State<SliverTripMetadata> createState() => _SliverTripMetadataState();
}

class _SliverTripMetadataState extends State<SliverTripMetadata> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trip Metadata'),
        ElevatedButton(
          onPressed: () async {
            final tripMetadata =
                await DriveKitTripAnalysis.instance.getTripMetadata();
            final alertMessage = tripMetadata == null
                ? 'No trip metadata'
                : tripMetadata.toString();

            if (context.mounted) {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Get trip metadata'),
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
            'Get trip metadata',
          ),
        ),
      ],
    );
  }
}
