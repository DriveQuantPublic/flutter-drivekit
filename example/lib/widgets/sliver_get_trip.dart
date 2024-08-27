import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';

class SliverGetTrip extends StatelessWidget {
  const SliverGetTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          const tripId = 'TRIP_ID_HERE';
          final tripSyncResult =
              await DriveKitDriverData.instance.getTrip(tripId);
          final alertMessage = tripSyncResult?.status == TripSyncStatus.success
              ? 'Trip ${tripSyncResult?.trip?.itinId} received with success. '
              : 'Trips not received';
          if (context.mounted) {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Get Trip'),
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
          'Get Trip',
        ),
      ),
    );
  }
}
