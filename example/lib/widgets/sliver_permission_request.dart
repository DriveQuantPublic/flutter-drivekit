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
            Row(
              children: [
                const Gap(16),
                Expanded(
                  child: switch ((
                    locationWhenInUseStatus,
                    backgroundLocationStatus
                  )) {
                    (_, PermissionStatus.permanentlyDenied) => ElevatedButton(
                        onPressed: openSettings,
                        child: const Text('open settings'),
                      ),
                    (PermissionStatus.granted, PermissionStatus.granted) =>
                      const ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'well done! 🎉',
                        ),
                      ),
                    (PermissionStatus.granted, _) => ElevatedButton(
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

  Future<void> requestLocationWhenInUsePermission() async {
    final status = await Permission.locationWhenInUse.request();
    setState(() {
      locationWhenInUseStatus = status;
    });
  }
}
