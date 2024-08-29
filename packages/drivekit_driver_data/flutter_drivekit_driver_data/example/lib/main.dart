import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('DriveKitDriverData Example')),
      body: const Column(
        children: [
          Text('Please refer to the main flutter example SDK'),
          Text(
            'https://github.com/DriveQuantPublic/flutter-drivekit/tree/main/example',
          ),
        ],
      ),
    );
  }
}
