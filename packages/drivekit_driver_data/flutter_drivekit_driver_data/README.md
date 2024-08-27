# DriveKit DriverData plugin

Flutter interface for the DriveKit Driver Data

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add drivekit_driver_data
```

Now, you can import `'package:flutter_drivekit_driver_data/flutter_drivekit_driver_data.dart'` and use `DriveKitDriverData` in your Dart code.

## Usage

To use this plugin, you need to have an ApiKey from DriveQuant. If you don't have one, please [contact us](https://info.drivequant.com/contact/).
Then, you need to install the flutter_drivekit_core plugin and follow the instructions to specify the ApiKey and the UserId.

Now, you can configure the Drivekit Core with the options you want, and start using the Drivekit Driver Data plugin. 


Please refer to the [DriveKit Driver Data documentation](https://docs.drivequant.com/driver-data) for more information about the features we provide.

You can also take a look at the [flutter example](https://github.com/DriveQuantPublic/flutter-drivekit/tree/main/example) for a basic usage of the Drivekit SDK, and the [iOS example app](https://github.com/DriveQuantPublic/drivekit-quickstart-ios) or [android example app](https://github.com/DriveQuantPublic/drivekit-quickstart-android) for a complete demonstration.


## Manual initialization

If you have disabled the DriveKit auto-initialization:

- On Android project, call `initialize` method of `DriveKitDriverData` class inside your `MainApplication` class.

```kotlin
// MainApplication.kt

// …
override fun onCreate() {
    super.onCreate()

    DriveKit.initialize()
    DriveKitTripAnalysis.initialize(…)
    DriveKitDriverData.initialize()
    (…)
}
```

- On iOS project, call `initialize` method inside your `AppDelegate`.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    DriveKit.shared.initialize()
    DriveKitTripAnalysis.shared.initialize(appLaunchOptions: launchOptions)
    DriveKitDriverData.shared.initialize()
    (…)
}
```

## API

| Method                                                                | Return Type                     | iOS | Android |
| --------------------------------------------------------------------- | ------------------------------- | :-: | :-----: |
| [getTripsOrderByDateAsc()](#getTripsOrderByDateAsc)                   | `Future<GetTripsResponse?>`     | ✅  |   ✅    |
| [getTripsOrderByDateDesc()](#getTripsOrderByDateDesc)                 | `Future<GetTripsResponse?>`     | ✅  |   ✅    |
| [getTrip()](#getTrip)                                                 | `Future<GetTripResponse>`       | ✅  |   ✅    |
| [getRoute()](#getRoute)                                               | `Future<GetRouteResponse>`      | ✅  |   ✅    |
| [deleteTrip()](#deleteTrip)                                           | `Future<bool>`                  | ✅  |   ✅    |


### getTripsOrderByDateAsc

### getTripsOrderByDateDesc

```dart
  Future<GetTripsResponse?> getTripsOrderByDateAsc(
        SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const [
      TransportationMode.unknown,
      TransportationMode.car,
      TransportationMode.moto,
      TransportationMode.truck,
    ],
  );
```

or

```dart
  Future<GetTripsResponse?> getTripsOrderByDateDesc(
        SynchronizationType synchronizationType = SynchronizationType.defaultSync,
    List<TransportationMode> transportationModes = const [
      TransportationMode.unknown,
      TransportationMode.car,
      TransportationMode.moto,
      TransportationMode.truck,
    ],
  );
```

| GetTripsResponse | Type             |
| ---------------- | ---------------- |
| `status`         | `TripSyncStatus` |
| `trips`          | `[Trip]`         |

To get driver's trips, you have to call the following method:

```dart
final tripSyncResult = await DriveKitDriverData.instance.getTripsOrderByDateAsc();
```

or 

```dart
final tripSyncResult = await DriveKitDriverData.instance.getTripsOrderByDateDesc();
```

### getTrip

The `itinId` parameter is the unique identifier for a trip.

```dart
Future<GetTripResponse?> getTrip(String itinId);
```

| GetTripResponse | Type             |
| --------------- | ---------------- |
| `status`        | `TripSyncStatus` |
| `trip`          | `Trip?`          |

To get a specific trip, you have to call the following method:

```dart
final result = await DriveKitDriverData.instance.getTrip('TRIP_ID_HERE');
```

The itinId parameter is the unique identifier for a trip.


### getRoute

```dart
Future<GetRouteResponse?> getRoute(String itinId);
```


| GetRouteResponse | Type             |
| --------------- | ----------------- |
| `status`        | `RouteSyncStatus` |
| `route`         | `Route?`          |


To get a specific route, you have to call the following method:

```dart
final result = await DriveKitDriverData.instance.getRoute('TRIP_ID_HERE');
```

### deleteTrip

The `itinId` parameter is the unique identifier for a trip.

```dart
Future<bool> deleteTrip(String itinId);
```

To delete a trip, you have to call the following method:

```dart
final result = await DriveKitDriverData.instance.deleteTrip('TRIP_ID_HERE');
```

