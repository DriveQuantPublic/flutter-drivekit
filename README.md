# DriveKit Flutter SDK

This project presents the Flutter interfaces for the DriveKit SDK on iOS and Android. To use this SDK, please contact [DriveQuant](https://info.drivequant.com/contact/).

It is a Flutter monorepo containing several federated plugins.

The DriveKit SDK for Flutter is available with:
- Android 8.0 (API level 26) and later versions, 
- and iOS 13 and later versions.

This SDK is supported for Flutter `1.20.0` version and above. It is recommended to use a recent version of Flutter.

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

To know how to contribute and understand this project's architecture and tools, please refer to the [CONTRIBUTING.md](./CONTRIBUTING.md) file.

## How to install the DriveKit SDK in your Flutter application?

A Flutter demo app is available on the [repository](/example). It shows DriveQuant's recommendations for correctly integrating DriveKit Flutter SDK.


### ➡️ Step 1: Install the Core module

First you need to install the Core module. 
This module is mandatory and includes methods to configure your API key and to create a user.

To install this module, follow step by step the method described in the [Core documentation](/packages/drivekit_core/flutter_drivekit_core/README.md)

---

### ➡️ Step 2: Install the Trip Analysis module

After installing the Core component, you need to install the Trip Analysis component which manages the trip recording and the automatic mode configuration.

To install this module, follow step by step the method described in the [Trip Analysis documentation](/packages/drivekit_trip_analysis/flutter_drivekit_trip_analysis/README.md)

---

### ➡️ Step 3: Install the Driver Data module

The Driver Data module manages the driver trips (list, details, deletion) and ensures the synchronisation of driver data.

To install this module, follow step by step the method described in the [Driver Data documentation](/packages/drivekit_driver_data/flutter_drivekit_driver_data/README.md)

---

### ➡️ Step 4: Test your implementation with Trip Simulator module

To verify the DriveKit Trip Analysis component integration into your app, it is recommended to perform tests in real conditions. Before carrying out driving tests, it may be useful to validate the implementation of the SDK in your application.

For this purpose, DriveQuant provides the [Trip Simulator](https://docs.drivequant.com/trip-analysis/trip-simulator) component based on recorded GPS data.

To install this module, follow step by step the method described in the [Trip Simulator documentation](/packages/drivekit_trip_simulator/flutter_drivekit_trip_simulator/README.md)

--- 

### ➡️ Step 5: Notify the user about the trip analysis

To inform the user that the trip has been analyzed, finished or cancelled, the DriveKit libraries for Flutter offers listeners so it becomes easy to build notifications on both mobile platforms.

The `TripListener` interface in the Trip Analysis module will provide some useful information about the lifecycle of the trip analysis.
In the main method of your main dart class, you can add a `TripListener` and manage the display of trip notifications according to your needs. See our [demo example code](/example/lib/main.dart) for example.

We recommend [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) library to manage your notifications.

#### Android

To display a notification when the trip is finished, cancelled or saved for a repost even if the app is in background, more steps are necessary to follow, as in the [DriveKit demo application](/example):

- If you don't already have one, create a class that extends `FlutterApplication` and ensure that the `name` value of the `application` node in your [`AndroidManifest`](/example/android/app/src/main/AndroidManifest.xml) file is your `Application` class. On our demo app, we have created [`FlutterDemoApplication`](/example/android/app/src/main/kotlin/com/drivequant/drivekit/flutter/example/FlutterDemoApplication.kt)
- In your Application class, call the following code in the `onCreate()` overridden method:

```
val pathToBundle = FlutterInjector.instance().flutterLoader().findAppBundlePath()
FlutterEngine(this).dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint(pathToBundle, "registerTripListener"))
```

It will run the `registerTripListener` dart entry point method. In our demo app, the method is in the [`main.dart`](/example/lib/maint.dart) file.
