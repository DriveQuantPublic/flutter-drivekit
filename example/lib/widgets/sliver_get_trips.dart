import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';

class SliverGetTrips extends StatelessWidget {
  const SliverGetTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          final tripSyncResult =
              await DriveKitDriverData.instance.getTripsOrderByDateAsc();
          final alertMessage = tripSyncResult?.status == TripSyncStatus.noError
              ? 'Trips synchronized with success. '
                  'You have ${tripSyncResult!.trips.length} trips.'
              : 'Trips synchronization returned an error. '
                  'You have ${tripSyncResult?.trips.length} old trips.';
          if (context.mounted) {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Get Trips'),
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
          'Synchronize trips',
        ),
      ),
    );
  }
}
