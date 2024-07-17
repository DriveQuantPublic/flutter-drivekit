import 'package:drivekit_core_example/widgets/sliver_api_key.dart';
import 'package:drivekit_core_example/widgets/sliver_platform_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        ],
      ),
    );
  }
}
