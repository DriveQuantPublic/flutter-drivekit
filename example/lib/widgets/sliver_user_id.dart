import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverUserId extends StatefulWidget {
  const SliverUserId({super.key});

  @override
  State<SliverUserId> createState() => _SliverUserIdState();
}

class _SliverUserIdState extends State<SliverUserId> {
  final TextEditingController _setUserIdController = TextEditingController();
  final TextEditingController _updateUserIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('User identifier'),
        TextField(
          controller: _setUserIdController,
          decoration: const InputDecoration(
            labelText: 'Set the userId',
            hintText: 'Enter the user ID to set',
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              DriveKitCore.instance.setUserId(_setUserIdController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('user ID: ${_setUserIdController.text}'),
                ),
              );
            },
            child: const Text('Set user ID'),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final userId = await DriveKitCore.instance.getUserId();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    userId != null ? 'User ID: $userId' : 'No user ID set.',
                  ),
                ),
              );
            }
          },
          child: const Text(
            'Get user ID',
          ),
        ),
        TextField(
          controller: _updateUserIdController,
          decoration: const InputDecoration(
            labelText: 'Update the userId',
            hintText: 'Enter the user ID to update',
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {
              DriveKitCore.instance.updateUserId(_updateUserIdController.text);
            },
            child: const Text('Update user ID'),
          ),
        ),
      ],
    );
  }
}
