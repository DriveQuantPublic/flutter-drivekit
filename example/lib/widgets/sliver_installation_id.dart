import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverInstallationId extends StatefulWidget {
  const SliverInstallationId({super.key});

  @override
  State<SliverInstallationId> createState() => _SliverInstallationIdState();
}

class _SliverInstallationIdState extends State<SliverInstallationId> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('Installation identifier'),
        const SliverGap(16),
        ElevatedButton(
          onPressed: () async {
            final installationId =
                await DriveKitCore.instance.getInstallationId();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    installationId != null
                        ? 'Installation ID: $installationId'
                        : 'No installation ID.',
                  ),
                ),
              );
            }
          },
          child: const Text(
            'Get installation ID',
          ),
        ),
      ],
    );
  }
}
