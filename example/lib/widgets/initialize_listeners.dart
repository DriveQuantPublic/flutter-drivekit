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
  late final DKDeviceConfigurationListener _deviceConfigurationListener;
  late final TripListener _tripListener;

  @override
  void initState() {
    super.initState();
    const defaultTripListenerDuration = Duration(milliseconds: 1000);
    _tripListener = TripListener(
      beaconDetected: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip: beaconDetected'),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      crashDetected: (crashInfo) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip: crashDetected.\ncrashInfo: $crashInfo'),
            ),
          );
        }
      },
      crashFeedbackSent: (crashInfo, feedbackType, severity) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip: crashFeedbackSent.\ncrashInfo: $crashInfo, '
                  'feedbackType: $feedbackType, severity: $severity'),
            ),
          );
        }
      },
      sdkStateChanged: (state) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip: sdkStateChanged.\nstate: $state'),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      significantLocationChangeDetected: (state) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Trip: significantLocationChangeDetected.\nstate: $state',
              ),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      tripCancelled: (cancelTrip) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip: tripCancelled.\ncancelTrip: $cancelTrip'),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      tripFinished: (post, response) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip: tripFinished.'),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      tripPoint: (tripPoint) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip: tripPoint.'),
              duration: Duration(milliseconds: 400),
            ),
          );
        }
      },
      tripSavedForRepost: () {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Trip: tripSavedForRepost.'),
              duration: defaultTripListenerDuration,
            ),
          );
        }
      },
      tripStarted: (startMode) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trip: tripStarted.\nstartMode: $startMode'),
              duration: defaultTripListenerDuration,
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

    _deviceConfigurationListener = DKDeviceConfigurationListener(
      onDeviceConfigurationChanged: (event) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Device Configuration change detected: ${event.name}'),
            ),
          );
        }
      },
    );

    DriveKitCore.instance.addDriveKitListener(_driveKitListener);
    DriveKitCore.instance
        .addDeviceConfigurationListener(_deviceConfigurationListener);
    DriveKitTripAnalysis.instance.addTripListener(_tripListener);
  }

  @override
  void dispose() {
    DriveKitCore.instance.removeDriveKitListener(_driveKitListener);
    DriveKitCore.instance
        .removeDeviceConfigurationListener(_deviceConfigurationListener);
    DriveKitTripAnalysis.instance.removeTripListener(_tripListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
