import 'package:flutter/material.dart';
import 'package:flutter_drivekit_core/flutter_drivekit_core.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverUserInfo extends StatefulWidget {
  const SliverUserInfo({super.key});

  @override
  State<SliverUserInfo> createState() => _SliverUserInfoState();
}

class _SliverUserInfoState extends State<SliverUserInfo> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const Text('User info'),
        TextField(
          controller: _firstnameController,
          decoration: const InputDecoration(
            labelText: 'Firstname',
            hintText: 'Enter the desired firstname',
          ),
        ),
        const SliverGap(4),
        TextField(
          controller: _lastnameController,
          decoration: const InputDecoration(
            labelText: 'Lastname',
            hintText: 'Enter the desired lastname',
          ),
        ),
        const SliverGap(4),
        TextField(
          controller: _pseudoController,
          decoration: const InputDecoration(
            labelText: 'Pseudo',
            hintText: 'Enter the desired pseudo',
          ),
        ),
        const SliverGap(4),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final userInfo = UserInfo(
                firstname: _firstnameController.text,
                lastname: _lastnameController.text,
                pseudo: _pseudoController.text,
              );
              final success =
                  await DriveKitCore.instance.updateUserInfo(userInfo);

              if (context.mounted) {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Update user info status'),
                      content: Text('Update userInfo status: $success'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Update user info'),
          ),
        ),
        const SliverGap(4),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () async {
              final response = await DriveKitCore.instance.getUserInfo();
              final message = response.userInfo == null
                  ? 'userInfo is null'
                  // ignore: prefer_interpolation_to_compose_strings
                  : 'firstname: ${response.userInfo?.firstname}'
                      '\nlastname: ${response.userInfo?.lastname}'
                      '\npseudo: ${response.userInfo?.pseudo}';
              if (context.mounted) {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Get user info'),
                      content: Text(
                        'Get userInfo status: ${response.status}\n$message',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Get user info'),
          ),
        ),
      ],
    );
  }
}
