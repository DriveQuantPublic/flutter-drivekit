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
        ignoreBatteryOptimizationsStatus = status;
      });
    });
    Permission.activityRecognition.status.then((status) {
      setState(() {
        activityRecognitionStatus = status;
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
            const Gap(16),
            Text(
              'Background location status : '
              '${switch (backgroundLocationStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(16),
            Text(
              'Activity recognition status : '
              '${switch (activityRecognitionStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(16),
            Text(
              'Ignore battery optimizations status : '
              '${switch (ignoreBatteryOptimizationsStatus) {
                PermissionStatus.granted => '✅',
                PermissionStatus.permanentlyDenied => 'permanently denied',
                _ => '❌',
              }}',
            ),
            const Gap(16),
            Row(
              children: [
                const Gap(16),
                Expanded(
                  child: switch ((
                    locationWhenInUseStatus,
                    backgroundLocationStatus,
                    activityRecognitionStatus,
                    ignoreBatteryOptimizationsStatus,
                  )) {
                    (_, PermissionStatus.permanentlyDenied, _, _) =>
                      ElevatedButton(
                        onPressed: openSettings,
                        child: const Text('open settings'),
                      ),
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                    ) =>
                      const ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'well done! 🎉',
                        ),
                      ),
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      _
                    ) =>
                      ElevatedButton(
                        onPressed: requestBatteryPermission,
                        child: const Text(
                          'ask for ignore battery permission',
                        ),
                      ),
                    (
                      PermissionStatus.granted,
                      PermissionStatus.granted,
                      _,
                      _
                    ) =>
                      ElevatedButton(
                        onPressed: requestActivityRecognitionPermission,
                        child: const Text(
                          'ask for activity recognition permission',
                        ),
                      ),
                    (PermissionStatus.granted, _, _, _) => ElevatedButton(
                        onPressed: requestBackgroundPermission,
                        child: const Text(
                          'ask for background location permission',
                        ),
                      ),
                    _ => ElevatedButton(
                        onPressed: requestLocationWhenInUsePermission,
                        child: const Text(
                          'ask for location when in use permission',
                        ),
                      ),
                  },
                ),
                const Gap(16),
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
    final status = await Permission.locationAlways.status;
    setState(() {
      backgroundLocationStatus = status;
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
    final status = await Permission.activityRecognition.request();
    setState(() {
      activityRecognitionStatus = status;
    });
  }

  Future<void> requestLocationWhenInUsePermission() async {
    final status = await Permission.locationWhenInUse.request();
    setState(() {
      locationWhenInUseStatus = status;
    });
  }
}
