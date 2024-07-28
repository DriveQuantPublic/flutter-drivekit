import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverPlatformName extends StatefulWidget {
  const SliverPlatformName({super.key});

  @override
  State<SliverPlatformName> createState() => _SliverPlatformNameState();
}

class _SliverPlatformNameState extends State<SliverPlatformName> {
  String? _platformName;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        if (_platformName != null)
          SliverToBoxAdapter(
            child: Text(
              'Platform Name: $_platformName',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              if (!context.mounted) return;
              try {
                final result = await DriveKitCore.getPlatformName();
                setState(() => _platformName = result);
              } catch (error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text('$error'),
                  ),
                );
              }
            },
            child: const Text('Get Platform Name'),
          ),
        ),
      ],
    );
  }
}
