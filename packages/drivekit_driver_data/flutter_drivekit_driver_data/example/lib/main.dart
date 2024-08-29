import 'package:flutter/material.dart';
import 'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart';

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
      appBar: AppBar(title: const Text('DrivekitDriverData Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                const tripId = 'TRIP_ID_HERE';
                final tripSyncResult =
                    await DriveKitDriverData.instance.getTrip(tripId);
                final alertMessage =
                    tripSyncResult?.status == TripSyncStatus.success
                        ? 'Trip ${tripSyncResult?.trip?.itinId} well received'
                        : 'Trips not received';
                if (context.mounted) {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Get Trip'),
                        content: Text(alertMessage),
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
              child: const Text(
                'Get Trip',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
