import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';

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
  bool _autoStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DriveKitTripAnalysis Example')),
      body: Center(
        child: Row(
          children: [
            const Text('Auto Start'),
            const Spacer(),
            Switch(
              value: _autoStart,
              onChanged: (value) {
                DriveKitTripAnalysis.instance.activateAutoStart(value);
                setState(() {
                  _autoStart = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
