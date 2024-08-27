import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';

class SliverGetRoute extends StatelessWidget {
  const SliverGetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () async {
          const tripId = 'TRIP_ID_HERE';
          final routeSyncResult =
              await DriveKitDriverData.instance.getRoute(tripId);
          final alertMessage =
              routeSyncResult?.status == RouteSyncStatus.noError
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
    );
  }
}
