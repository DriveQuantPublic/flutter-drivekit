import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverTripSharing extends StatelessWidget {
  const SliverTripSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Trip Sharing'),
        const SliverGap(4),
        ElevatedButton(
          onPressed: () async {
            final isAvailable =
                await DriveKitTripAnalysis.instance.isTripSharingAvailable();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    'Trip Sharing available: $isAvailable',
                  ),
                ),
              );
            }
          },
          child: const Text('Is feature available?'),
        ),
        ElevatedButton(
          onPressed: () async {
            const oneHourInSeconds = 1 * 60 * 60;
            final response = await DriveKitTripAnalysis.instance
                .createTripSharingLink(oneHourInSeconds);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('Trip Sharing creation: ${response.status.name}'
                      '\ncode: ${response.data?.code}'
                      '\nurl: ${response.data?.url}'
                      '\nstartDate: ${response.data?.startDate}'
                      '\nendDate: ${response.data?.endDate}'),
                ),
              );
            }
          },
          child: const Text('Create link (1 hour)'),
        ),
        ElevatedButton(
          onPressed: () async {
            final response =
                await DriveKitTripAnalysis.instance.getTripSharingLink();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content:
                      Text('Trip Sharing retrieval: ${response.status.name}'
                          '\ncode: ${response.data?.code}'
                          '\nurl: ${response.data?.url}'
                          '\nstartDate: ${response.data?.startDate}'
                          '\nendDate: ${response.data?.endDate}'),
                ),
              );
            }
          },
          child: const Text('Get link (SyncType DEFAULT)'),
        ),
        ElevatedButton(
          onPressed: () async {
            final response =
                await DriveKitTripAnalysis.instance.getTripSharingLink(
              synchronizationType: SynchronizationType.cache,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content:
                      Text('Trip Sharing retrieval: ${response.status.name}'
                          '\ncode: ${response.data?.code}'
                          '\nurl: ${response.data?.url}'
                          '\nstartDate: ${response.data?.startDate}'
                          '\nendDate: ${response.data?.endDate}'),
                ),
              );
            }
          },
          child: const Text('Get link (SyncType CACHE)'),
        ),
        ElevatedButton(
          onPressed: () async {
            final response =
                await DriveKitTripAnalysis.instance.revokeTripSharingLink();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('Trip Sharing revokation: ${response.name}'),
                ),
              );
            }
          },
          child: const Text('Revoke link'),
        ),
      ],
    );
  }
}
