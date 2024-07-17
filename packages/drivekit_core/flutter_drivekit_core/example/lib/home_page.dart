import 'package:drivekit_core_example/widgets/sliver_api_key.dart';
import 'package:drivekit_core_example/widgets/sliver_auto_start.dart';
import 'package:drivekit_core_example/widgets/sliver_platform_name.dart';
import 'package:drivekit_core_example/widgets/sliver_set_user_id.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('DriveKit Core Example'),
            pinned: true,
          ),
          SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverPlatformName(),
          ),
          SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverApiKey(),
          ),
          SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverSetUserId(),
          ),
          SliverGap(32),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverAutoStart(),
          ),
          SliverGap(32),
        ],
      ),
    );
  }
}
