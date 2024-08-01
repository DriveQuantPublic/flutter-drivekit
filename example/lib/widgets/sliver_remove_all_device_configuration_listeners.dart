import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';

class SliverRemoveAllDeviceConfigurationListeners extends StatelessWidget {
  const SliverRemoveAllDeviceConfigurationListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {
          DriveKitCore.instance.removeALlDeviceConfigurationListeners();
        },
        child: const Text('Remove all DKDeviceConfigurationListener'),
      ),
    );
  }
}
