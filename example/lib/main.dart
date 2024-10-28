import 'dart:io';
import 'package:drivekit_example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  // Configure notifications.
  WidgetsFlutterBinding.ensureInitialized();

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/drivekit_notif_icon');
  const initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  final tripListener = TripListener(
    tripStarted: (startMode) {
      if (Platform.isIOS) {
        const title = 'Start of trip';
        final message = 'A trip is recording (startMode = ${startMode.name})';
        _showTripNotification(title, message);
      }
    },
    tripFinished: (response) async {
      final String message;
      switch (response.status) {
        case TripResponseStatusType.tripError:
          final error = response.error ?? TripResponseError.unknownError;
          message = 'Failed to analyze trip: ${error.name}';
        case TripResponseStatusType.tripValid:
          message = 'A new trip has been analyzed'
              ' (has score = ${response.hasSafetyAndEcoDrivingScore})';
      }
      await _showTripNotification(null, message);
    },
    tripCancelled: (cancelTrip) {
      _showTripNotification(null, 'Trip cancelled: ${cancelTrip.name}');
    },
    tripSavedForRepost: () => {
      _showTripNotification(
        null,
        'The trip could not be analyzed because your phone is not connected'
        ' to the mobile network. It will be analyzed later',
      ),
    },
  );
  DriveKitTripAnalysis.instance.addTripListener(tripListener);

  // Setup widget.
  runApp(const MyApp());
}

Future<void> _showTripNotification(String? title, String message) async {
  const androidNotificationDetails = AndroidNotificationDetails(
    'trip',
    'Trip',
  );
  const notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    12345,
    title ?? 'Trip Analysis',
    message,
    notificationDetails,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
