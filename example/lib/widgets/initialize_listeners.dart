import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

class InitializeListeners extends StatefulWidget {
  const InitializeListeners({required this.child, super.key});

  final Widget child;

  @override
  State<InitializeListeners> createState() => _InitializeListenersState();
}

class _InitializeListenersState extends State<InitializeListeners> {
  late final DriveKitListener _driveKitListener;
  late final TripListener _tripListener;

  @override
  void initState() {
    super.initState();
    _tripListener = TripListener(
      beaconDetected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip : beaconDetected'),
            ),
          );
        }
      },
      crashDetected: (crashInfo) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip : crashDetected. crashInfo : $crashInfo'),
            ),
          );
        }
      },
      crashFeedbackSent: (crashInfo, feedbackType, severity) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Trip : crashFeedbackSent.\n crashInfo : $crashInfo, '
                      'feedbackType : $feedbackType, severity: $severity'),
            ),
          );
        }
      },
      sdkStateChanged: (state) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip : sdkStateChanged.\n state : $state'),
            ),
          );
        }
      },
      significantLocationChangeDetected: (state) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Trip : significantLocationChangeDetected.\n state : $state',
              ),
            ),
          );
        }
      },
      tripCancelled: (cancelTrip) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip : tripCancelled.\n cancelTrip : $cancelTrip'),
            ),
          );
        }
      },
      tripFinished: (post, response) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip : tripFinished.'),
            ),
          );
        }
      },
      tripPoint: (tripPoint) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip : tripPoint.'),
            ),
          );
        }
      },
      tripSavedForRepost: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip : tripSavedForRepost.'),
            ),
          );
        }
      },
      tripStarted: (startMode) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip : tripStarted.\n startMode : $startMode'),
            ),
          );
        }
      },
    );
    _driveKitListener = DriveKitListener(
      onConnected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('DriveKit connected'),
            ),
          );
        }
      },
      onDisconnected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('DriveKit disconnected'),
            ),
          );
        }
      },
      userIdUpdateStatus: (status, userId) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User ID update status: $status'),
            ),
          );
        }
      },
      onAuthenticationError: (errorType) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Authentication error: $errorType'),
            ),
          );
        }
      },
      onAccountDeleted: (status) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account deletion status: $status'),
            ),
          );
        }
      },
      onBackgroundFetchStatusChanged: (status) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Background fetch status: $status'),
            ),
          );
        }
      },
    );
    DriveKitCore.instance.addDriveKitListener(_driveKitListener);
    DrivekitTripAnalysis.instance.addTripListener(_tripListener);
  }

  @override
  void dispose() {
    DriveKitCore.instance.removeDriveKitListener(_driveKitListener);
    DrivekitTripAnalysis.instance.removeTripListener(_tripListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
