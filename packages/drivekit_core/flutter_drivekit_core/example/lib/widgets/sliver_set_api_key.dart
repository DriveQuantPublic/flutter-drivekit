import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverSetApiKey extends StatefulWidget {
  const SliverSetApiKey({super.key});

  @override
  State<SliverSetApiKey> createState() => _SliverSetApiKeyState();
}

class _SliverSetApiKeyState extends State<SliverSetApiKey> {
  final TextEditingController _apiKeyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        TextField(
          controller: _apiKeyController,
          decoration: const InputDecoration(
            labelText: 'API Key',
            hintText: 'Enter your API Key',
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              DriveKitCore.setApiKey(_apiKeyController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('API Key: ${_apiKeyController.text}'),
                ),
              );
            },
            child: const Text('Set API Key'),
          ),
        ),
      ],
    );
  }
}
