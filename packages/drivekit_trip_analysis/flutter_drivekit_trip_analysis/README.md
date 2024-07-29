# DriveKit Trip Analysis plugin

Flutter interface for the DriveKit Trip Analysis

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add drivekit_trip_analysis
```

Now, you can import `'package:flutter_drivekit_trip_analysis/flutter_drivekit_trip_analysis.dart'` and use `DriveKitTripAnalysis` in your Dart code.

## Usage

You need to install the flutter_drivekit_core plugin and follow the instructions to specify the API key and the user identifier.

Then, you can start using the Drivekit Trip Analysis plugin. For example, you can activate the auto start mode with the following code:

```dart
final tripAnalysis = DriveKitTripAnalysis()
tripAnalysis.activateAutoStart(true);
```

Please refer to the [DriveKit Trip Analysis documentation](https://docs.drivequant.com/trip-analysis/introduction) for more information about the features we provide.

## API

| Method                                                                | Return Type                     | iOS | Android |
| --------------------------------------------------------------------- | ------------------------------- | :-: | :-----: |
| [activateAutoStart()](#activateautostart)                             | `Future<void>`                  | ✅  |   ✅    |
| [startTrip()](#starttrip)                                             | `Future<void>`                  | ✅  |   ✅    |
| [stopTrip()](#stoptrip)                                               | `Future<void>`                  | ✅  |   ✅    |
| [cancelTrip()](#canceltrip)                                           | `Future<void>`                  | ✅  |   ✅    |
| [isTripRunning()](#istriprunning)                                     | `Future<bool>`                  | ✅  |   ✅    |
| [activateCrashDetection()](#activatecrashdetection)                   | `Future<void>`                  | ✅  |   ✅    |
| [setMonitorPotentialTripStart()](#setmonitorpotentialtripstart)       | `Future<void>`                  | ✅  |   ✅    |
| [getMonitorPotentialTripStart()](#getmonitorpotentialtripstart)       | `Future<bool>`                  | ✅  |   ✅    |

### activateAutoStart

```dart
Future<void> activateAutoStart(bool activate);
```

The automatic mode detects vehicle movements and triggers the trip analysis without driver intervention while the application is in background. The analysis is stopped automatically at the end of the trip.

This feature is recommended to avoid driver distraction and phone handling while driving. The automatic mode has been optimized to limit the battery drain.

By default, auto start is disabled. To enable automatic trip detection mode, call the following method:

```dart
driveKitTripAnalysis.activateAutoStart(true);
```

To disable automatic trip detection call the same method with parameter enable set to `false`

```dart
driveKitTripAnalysis.activateAutoStart(false);
```

> ⚠️
>
> If a trip is running when automatic trip detection is disabled, the trip will not be cancelled. If you want to cancel the trip, you should also call `cancelTrip` method.

### startTrip

```dart
Future<void> startTrip();
```

You can start a trip by calling the following method:

```dart
driveKitTripAnalysis.startTrip
```

> ℹ️
>
> If a trip's already started, calling this method will have no effect.
>

### stopTrip

```dart
Future<void> stopTrip();
```

You can stop a trip by calling the following method. The trip will be stopped instantly:

```typescript
driveKitTripAnalysis.stopTrip
```

> ℹ️
>
> If a vehicle stops longer than the [timeout configured](https://docs.drivequant.com/trip-analysis/ios/advanced-configuration#custom-stop-timeout), the trip will be stopped automatically.

> ℹ️
>
> If there is no running trip, calling this method will have no effect.

### cancelTrip

```dart
Future<void> cancelTrip();
```

If you want to cancel a trip, you can call this method:

```dart
driveKitTripAnalysis.cancelTrip
```

### isTripRunning

```dart
Future<bool> isTripRunning();
```

This method returns false if the SDK is in `INACTIVE` state, and no trip is currently running.

```dart
final isTripRunning = await driveKitTripAnalysis.isTripRunning();
```

### activateCrashDetection

```dart
activateCrashDetection(enable: boolean): Promise<void>
```

Crash detection features, included into the DriveKit Trip Analysis component, is able to collect and analyse smartphone sensors data to automatically detect when a car accident occurs.

Learn more about the feature [on iOS](https://docs.drivequant.com/trip-analysis/ios/crash-detection) / [on Android](https://docs.drivequant.com/trip-analysis/android/crash-detection)

An input parameter is available in DriveKitTripAnalysis to enable or disable the feature:

```dart
Future<void> activateCrashDetection(bool activate);
```

To disable crash detection, call the method with parameter to `false`

```dart
driveKitTripAnalysis.activateCrashDetection(false);
```

### setmonitorpotentialtripstart

```dart
Future<void> setMonitorPotentialTripStart(bool activate);
```

DriveKit's automatic start mode detects a trip and launches its recording immediately. This operating mode may not be appropriate for all use cases.

Your application may require other information or business logic before enabling the trip recording. For example, it may be appropriate to check that:

* A connected device is near to the smartphone.
* The trip recording is acceptable in a given time slot.

In this case, you may want to subscribe to the events that are indicative of the trip start but not necessarily launch the GPS sensor and the trip analysis.

This is why DriveKit allows you to subscribe to trigger events that indicate that a trip has probably started.

Learn more about the feature [on iOS](https://docs.drivequant.com/trip-analysis/ios/tripmanagement#access-the-trip-trigger-events) / [on Android](https://docs.drivequant.com/trip-analysis/android/trip-management#access-the-trip-trigger-events)

By default, the configuration is disabled. Call the following method with parameter to `true` to enable it.

```dart
DrivekitTripAnalysis.setMonitorPotentialTripStart(true);
```

To disable the feature, call the method with parameter to `false`

```dart
DrivekitTripAnalysis.setMonitorPotentialTripStart(false);
```

### getmonitorpotentialtripstart

```dart
Future<bool> getMonitorPotentialTripStart();
```

Check if the feature is activated or not with the following command:

```dart
final monitorPotentialTripStart = await DrivekitTripAnalysis.getMonitorPotentialTripStart();
```