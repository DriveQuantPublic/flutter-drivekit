import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverSetUserId extends StatefulWidget {
  const SliverSetUserId({super.key});

  @override
  State<SliverSetUserId> createState() => _SliverSetUserIdState();
}

class _SliverSetUserIdState extends State<SliverSetUserId> {
  final TextEditingController _userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final driveKitCore = DriveKitCore();

    return MultiSliver(
      children: [
        TextField(
          controller: _userIdController,
          decoration: const InputDecoration(
            labelText: 'user ID',
            hintText: 'Enter the user ID',
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              driveKitCore.setUserId(_userIdController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('user ID: ${_userIdController.text}'),
                ),
              );
            },
            child: const Text('Set user ID'),
          ),
        ),
      ],
    );
  }
}
