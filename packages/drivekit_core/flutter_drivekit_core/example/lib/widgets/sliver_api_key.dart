import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverApiKey extends StatefulWidget {
  const SliverApiKey({super.key});

  @override
  State<SliverApiKey> createState() => _SliverApiKeyState();
}

class _SliverApiKeyState extends State<SliverApiKey> {
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
              setApiKey(_apiKeyController.text);
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
