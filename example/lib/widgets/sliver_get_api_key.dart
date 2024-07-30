import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverGetApiKey extends StatelessWidget {
  const SliverGetApiKey({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final apiKey = await DriveKitCore.instance.getApiKey();
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
