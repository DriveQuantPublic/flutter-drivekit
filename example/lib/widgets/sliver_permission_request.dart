import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

class SliverPermissionRequest extends StatefulWidget {
  const SliverPermissionRequest({super.key});

  @override
  State<SliverPermissionRequest> createState() =>
      _SliverPermissionRequestState();
}

class _SliverPermissionRequestState extends State<SliverPermissionRequest> {
  PermissionStatus locationWhenInUseStatus = PermissionStatus.denied;
  PermissionStatus backgroundLocationStatus = PermissionStatus.denied;
  PermissionStatus ignoreBatteryOptimizationsStatus = PermissionStatus.denied;
  PermissionStatus activityRecognitionStatus = PermissionStatus.denied;
  PermissionStatus notificationStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    Permission.locationWhenInUse.status.then((status) {
      setState(() {
        locationWhenInUseStatus = status;
      });
    });
    Permission.locationAlways.status.then((status) {
      setState(() {
        backgroundLocationStatus = status;
      });
    });
    Permission.ignoreBatteryOptimizations.status.then((status) {
      setState(() {
        if (Platform.isAndroid) {
          ignoreBatteryOptimizationsStatus = status;
        } else {
          ignoreBatteryOptimizationsStatus = PermissionStatus.granted;
        }
      });
    });
    Permission.activityRecognition.status.then((status) {
      setState(() {
        if (Platform.isAndroid) {
          activityRecognitionStatus = status;
        }
      });
    });
    Permission.sensors.status.then((status) {
      setState(() {
        if (Platform.isIOS) {
          activityRecognitionStatus = status;
        }
      });
    });
    Permission.notification.status.then((status) {
      setState(() {
        notificationStatus = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(16),
            Text(
              'Location when in use permission status : '
              '${locationWhenInUseStatus.isGranted ? '✅' : '❌'}',
            ),
            const Gap(4),
            Text(
              'Background location status : '
              '${switch (backgroundLocationStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(4),
            Text(
              'Activity recognition status : '
              '${switch (activityRecognitionStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(4),
            Text(
              'Notification permission status : '
              '${switch (notificationStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'denied',
                _ => '❌',
              }}',
            ),
            const Gap(4),
            Text(
              'Ignore battery optimizations status : '
              '${switch (ignoreBatteryOptimizationsStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(4),
            Row(
              children: [
                const Gap(16),
                Expanded(
                  child: switch ((
                    locationWhenInUseStatus,
                    backgroundLocationStatus,
                    activityRecognitionStatus,
                    notificationStatus,
                    ignoreBatteryOptimizationsStatus,
                  )) {
                    // Background location is permanently denied
                    (_, PermissionStatus.permanentlyDenied, _, _, _) =>
                      ElevatedButton(
                        onPressed: openSettings,
                        child: const Text(
                          'Open settings to always allow location access',
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // Activity recognition is permanently denied
                    (_, _, PermissionStatus.permanentlyDenied, _, _) =>
                      ElevatedButton(
                        onPressed: openSettings,
                        child: const Text(
                          'Open settings to allow activity recognition',
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // All OK, display well done message
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                    ) =>
                      const ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Well done! 🎉',
                        ),
                      ),

                    // All OK except ignore battery optimisation,
                    // so ask for battery optimisation setting
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      _
                    ) =>
                      ElevatedButton(
                        onPressed: requestBatteryPermission,
                        child: const Text(
                          'Ask for ignore battery permission',
                        ),
                      ),

                    // Missing notification and ignore battery
                    // optimisation so ask for notification.
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      _,
                      _,
                    ) =>
                      ElevatedButton(
                        onPressed: requestNotificationPermission,
                        child: const Text(
                          'Ask for notification permission',
                        ),
                      ),

                    // Missing activity, notification, and ignore battery
                    // optimisation so ask for activity recognition.
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      _,
                      _,
                      _,
                    ) =>
                      ElevatedButton(
                        onPressed: requestActivityRecognitionPermission,
                        child: const Text(
                          'Ask for activity recognition permission',
                        ),
                      ),

                    // Missing background location, activity, notification,
                    // and ignore battery optimisation
                    // so ask for background location permission.
                    (
                      PermissionStatus.granted,
                      _,
                      _,
                      _,
                      _,
                    ) =>
                      ElevatedButton(
                        onPressed: requestBackgroundPermission,
                        child: const Text(
                          'Ask for background location permission',
                        ),
                      ),
                    _ => ElevatedButton(
                        onPressed: requestLocationWhenInUsePermission,
                        child: const Text(
                          'Ask for location when in use permission',
                        ),
                      ),
                  },
                ),
                const Gap(4),
              ],
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }

  Future<void> openSettings() async {
    await openAppSettings();
    final newBackgroundLocationStatus = await Permission.locationAlways.status;
    final PermissionStatus newActivityRecognitionStatus;
    if (Platform.isAndroid) {
      newActivityRecognitionStatus =
          await Permission.activityRecognition.status;
    } else if (Platform.isIOS) {
      newActivityRecognitionStatus = await Permission.sensors.status;
    } else {
      newActivityRecognitionStatus = PermissionStatus.granted;
    }
    final newNotificationStatus = await Permission.notification.status;
    setState(() {
      backgroundLocationStatus = newBackgroundLocationStatus;
      activityRecognitionStatus = newActivityRecognitionStatus;
      notificationStatus = newNotificationStatus;
    });
  }

  Future<void> requestBackgroundPermission() async {
    final status = await Permission.locationAlways.request();
    setState(() {
      backgroundLocationStatus = status;
    });
  }

  Future<void> requestBatteryPermission() async {
    final status = await Permission.ignoreBatteryOptimizations.request();
    setState(() {
      ignoreBatteryOptimizationsStatus = status;
    });
  }

  Future<void> requestActivityRecognitionPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.activityRecognition.request();
      setState(() {
        activityRecognitionStatus = status;
      });
    } else if (Platform.isIOS) {
      final status = await Permission.sensors.request();
      setState(() {
        activityRecognitionStatus = status;
      });
    }
  }

  Future<void> requestLocationWhenInUsePermission() async {
    final status = await Permission.locationWhenInUse.request();
    setState(() {
      locationWhenInUseStatus = status;
    });
  }

  Future<void> requestNotificationPermission() async {
    if (notificationStatus == PermissionStatus.denied) {
      final status = await Permission.notification.request();
      setState(() {
        notificationStatus = status;
      });
    } else {
      await openSettings();
    }
  }
}
