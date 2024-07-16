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
    return Scaffold(
      appBar: AppBar(title: const Text('DrivekitCore Example')),
      body: const CustomScrollView(
        slivers: [
          SliverGap(32),
          SliverPlatformName(),
          SliverGap(32),
        ],
      ),
    );
  }
}
