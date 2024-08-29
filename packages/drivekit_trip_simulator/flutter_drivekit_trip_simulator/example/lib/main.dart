import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart';

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
      appBar: AppBar(title: const Text('DrivekitTripSimulator Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DriveKitTripSimulator.start(PresetTrip.shortTrip);
              },
              child: const Text('Start Simulation (shortTrip)'),
            ),
          ],
        ),
      ),
    );
  }
}
