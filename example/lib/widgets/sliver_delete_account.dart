import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverDeleteAccount extends StatefulWidget {
  const SliverDeleteAccount({super.key});

  @override
  State<SliverDeleteAccount> createState() => _SliverDeleteAccountState();
}

class _SliverDeleteAccountState extends State<SliverDeleteAccount> {
  bool _instantDeletion = false;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Text(
            'Delete account',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        CheckboxListTile(
          value: _instantDeletion,
          onChanged: (bool? value) {
            if (value != null) {
              setState(() {
                _instantDeletion = value;
              });
            }
          },
          title: const Text('instant deletion ?'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              await DriveKitCore.instance.deleteAccount(
                instantDeletion: _instantDeletion,
              );
            },
            child: const Text(
              'Delete account',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
