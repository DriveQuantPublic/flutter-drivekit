import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTrips extends StatelessWidget {
  const SliverTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trips'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            final tripSyncResult =
                await DriveKitDriverData.instance.getTripsOrderByDateAsc();
            final alertMessage =
                tripSyncResult?.status == TripSyncStatus.success
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
        ElevatedButton(
          onPressed: () async {
            const tripId = 'TRIP_ID_HERE';
            final tripSyncResult =
                await DriveKitDriverData.instance.getTrip(tripId);
            final alertMessage = tripSyncResult?.status ==
                    TripSyncStatus.success
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
        ElevatedButton(
          onPressed: () async {
            const tripId = 'TRIP_ID_HERE';
            final routeSyncResult =
                await DriveKitDriverData.instance.getRoute(tripId);
            final alertMessage = routeSyncResult?.status ==
                    RouteSyncStatus.success
                ? 'Route received for itinId: ${routeSyncResult?.route?.itinId}'
                : 'Route not received';
            if (context.mounted) {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Get Route'),
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
            'Get route',
          ),
        ),
      ],
    );
  }
}
