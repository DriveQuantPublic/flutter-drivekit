# DriveKit driver_data plugin

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


## API

| Method                                                                | Return Type                     | iOS | Android |
| --------------------------------------------------------------------- | ------------------------------- | :-: | :-----: |
| [getTripsOrderByDateAsc()](#getTripsOrderByDateAsc)                   | `Future<GetTripsResponse?>`     | ✅  |   ✅    |
| [getTripsOrderByDateDesc()](#getTripsOrderByDateDesc)                 | `Future<GetTripsResponse?>`     | ✅  |   ✅    |
| [getTrip()](#getTrip)                                                 | `Future<GetTripResponse>`       | ✅  |   ✅    |
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
final tripSyncResult = await driveKitDriverData.getTripsOrderByDateAsc();
```

or 

```dart
final tripSyncResult = await driveKitDriverData.getTripsOrderByDateDesc();
```

### getTrip

```dart
Future<GetTripResponse?> getTrip(String itinId);
```


| GetTripResponse | Type             |
| --------------- | ---------------- |
| `status`        | `TripSyncStatus` |
| `trip`          | `Trip?`          |


To get a specific trip, you have to call the following method:

```dart
final result = await driveKitDriverData.getTrip('TRIP_ID_HERE');
```

The itinId parameter is the unique identifier for a trip.



### deleteTrip

To delete a trip, you have to call the following method:

```dart
Future<bool> deleteTrip(String itinId);
```

The itinId parameter is the unique identifier for a trip.



```dart
driveKitDriverData.deleteTrip('TRIP_ID_HERE');
```

