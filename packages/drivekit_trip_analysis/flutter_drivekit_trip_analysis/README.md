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

## Manual initialization

If you have disabled the DriveKit auto-initialization:

- On Android project, call `initialize` method of `DriveKitTripAnalysis` class inside your `MainApplication` class.

```kotlin
// MainApplication.kt

// …
override fun onCreate() {
    super.onCreate()
    DriveKit.initialize()

    val tripNotification: TripNotification = ...
    DriveKitTripAnalysis.initialize(tripNotification)

    // Initialize every other DriveKit modules you use:
    // DriveKitDriverData.initialize()
    // etc.
}
```

- On iOS project, call `initialize` method inside your `AppDelegate`.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    DriveKit.shared.initialize()
    DriveKitTripAnalysis.shared.initialize(appLaunchOptions: launchOptions)
    (…)
}
```


## API

| Method                                                                | Return Type                     | iOS | Android |
| --------------------------------------------------------------------- | ------------------------------- | :-: | :-----: |
| [activateAutoStart()](#activateautostart)                             | `Future<void>`                  | ✅  |   ✅    |
| [startTrip()](#starttrip)                                             | `Future<void>`                  | ✅  |   ✅    |
| [stopTrip()](#stoptrip)                                               | `Future<void>`                  | ✅  |   ✅    |
| [cancelTrip()](#canceltrip)                                           | `Future<void>`                  | ✅  |   ✅    |
| [isTripRunning()](#istriprunning)                                     | `Future<bool>`                  | ✅  |   ✅    |
| [addTripListener()](#addtriplistener)                                 | `Future<void>`                  | ✅  |   ✅    |
| [removeTripListener()](#removetriplistener)                           | `Future<void>`                  | ✅  |   ✅    |
| [removeAllTripListeners()](#removealltriplisteners)                   | `Future<void>`                  | ✅  |   ✅    |
| [activateCrashDetection()](#activatecrashdetection)                   | `Future<void>`                  | ✅  |   ✅    |
| [setMonitorPotentialTripStart()](#setmonitorpotentialtripstart)       | `Future<void>`                  | ✅  |   ✅    |
| [getMonitorPotentialTripStart()](#getmonitorpotentialtripstart)       | `Future<bool>`                  | ✅  |   ✅    |
| [setVehicle()](#setvehicle)                                           | `Future<bool>`                  | ✅  |   ✅    |


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

### addTripListener

The `TripListener` interface provides useful information and event about trips analyzed by DriveKit.

For example, you can be informed when a trip analysis has started, finished, cancelled, when a crash is detected, etc. by using the method:

```dart
void addTripListener(TripListener listener);
```

`TripListener` interface includes several methods to implement:

 | Method                            | Description                                                                                                                                                                                                                                               |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| tripStarted                       | Called each time a trip is started. `StartMode` indicates which event starts the trip.                                                                                                                                                                    |
| tripPoint                         | Called when a trip is started and confirmed, for each GPS point recorded by the SDK.                                                                                                                                                                      |
| tripSavedForRepost                | Called if at the end of the trip, the trip can be sent to DriveQuant's server for the analysis. The trip is saved locally on the SDK and will be sent later.                                                                                              |
| tripFinished                      | Called when a trip has been recorded by the SDK and sent to DriveQuant's server to be analyzed.  `PostGeneric` object contains raw data sent to DriveQuant's server, `PostGenericResponse` object contains the trip analysis made on DriveQuant's server. |
| tripCancelled                     | Called when a trip is cancelled. `CancelTrip` indicates which event cancels the trip.                                                                                                                                                                     |
| potentialTripStart                | Called each time a potential trip is started. `StartMode` indicates which event starts the potential trip.                                                                                                                                                |
| beaconDetected                    | Called when a beacon sets in the SDK is detected.                                                                                                                                                                                                         |
| significantLocationChangeDetected | iOS only. Called when a user significant location change is detected.                                                                                                                                                                                     |
| sdkStateChanged                   | Called every time the state of the SDK changed, with the new `State` as parameter                                                                                                                                                                         |
| crashDetected                     | Called when a crash event is detected. Triggered only if Crash Detection is enabled.                                                                                                                                                                      |
| crashFeedbackSent                 | Called when crash feedback is enabled and a confirmed crash is detected. Triggered only if Crash Detection is enabled and feedback configured.                                                                                                            |

Read more on every possible values on the native documentation : [Android](https://docs.drivequant.com/trip-analysis/android/triplistener) / [iOS](https://docs.drivequant.com/trip-analysis/ios/triplistener)

### removeTripListener

You can remove a specific `TripListener` using the following method:

```dart
void removeTripListener(TripListener listener);
```

### removeAllTripListeners

You can remove all registered `TripListener` using the following method:
```dart
void removeAllTripListeners();
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

### setMonitorPotentialTripStart

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

### getMonitorPotentialTripStart

```dart
Future<bool> getMonitorPotentialTripStart();
```

Check if the feature is activated or not with the following command:

```dart
final monitorPotentialTripStart = await DrivekitTripAnalysis.getMonitorPotentialTripStart();
```

### setVehicle

```dart
Future<void> setVehicle(Vehicle vehicle);
```

To obtain a more precise analysis on driving behaviour, it's recommended to configure the vehicle used by the driver. You can do this by calling the following method:

```dart
DrivekitTripAnalysis.instance.setVehicle(
  const Vehicle(
    carTypeIndex: 2,
    carEngineIndex: 2,
    carPower: 200,
    carMass: 1500,
    carGearboxIndex: 3,
    carConsumption: 6.5,
    carAutoGearboxNumber: 1,
    engineDisplacement: 1500,
    carPassengers: 2,
    length: 4.7,
    width: 1.9,
    height: 1.5,
    engineCylinderNb: 6,
    driveWheels: 1,
  ),
);
```

A detailed description of vehicle parameter is available [here](https://docs.drivequant.com/trip-analysis/ios/references#tripvehicle).

> ℹ️
>
> If no vehicle is configured a default vehicle will be configured with following parameters:
>
> carTypeIndex = 1
>
> carEngineIndex = 1
>
> carPower = 150
>
> carMass = 1400
>
> carGearboxIndex = 2
>
> carConsumption = 4.5
>
> engineDisplacement = 1200
>
> frontTireSize = "205/55/16"
>
> rearTireSize = "205/55/16"
>
> length = 4.5
>
> width = 1.8
>
> height = 1.45
>
> engineCylinderNb = 4
>
> driveWheels = 0
