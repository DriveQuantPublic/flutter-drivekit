import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverGetApiKey extends StatefulWidget {
  const SliverGetApiKey({super.key});

  @override
  State<SliverGetApiKey> createState() => _SliverGetApiKeyState();
}

class _SliverGetApiKeyState extends State<SliverGetApiKey> {
  @override
  Widget build(BuildContext context) {
    final driveKitCore = DriveKitCore();

    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final apiKey = await driveKitCore.getApiKey();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text('API Key: $apiKey'),
                  ),
                );
              }
            },
            child: const Text('Get API key'),
          ),
        ),
      ],
    );
  }
}
