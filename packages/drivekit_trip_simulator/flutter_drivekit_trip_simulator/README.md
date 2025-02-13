# DriveKit trip_simulator plugin

Flutter interface for the DriveKit Trip Simulator

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add flutter_drivekit_trip_simulator
```

Now, you can import `'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart'` and use `DriveKitTripSimulator` in your Dart code.

## Usage

To use this plugin, you need to have an ApiKey from DriveQuant. If you don't have one, please [contact us](https://info.drivequant.com/contact/).
Then, you need to install the flutter_drivekit_core plugin and follow the instructions to specify the ApiKey and the UserId.

Now, you can configure the DriveKit Core with the options you want, and start using the DriveKit Trip Simulator plugin. For example, you can start trip simulator with the following code:

```dart
await DriveKitTripSimulator.instance.start(PresetTrip.shortTrip);
```

| Method                    | Return Type    | iOS | Android |
| ------------------------- | -------------- | :-: | :-----: |
| [startTrip()](#starttrip) | `Future<void>` | ✅  |   ✅    |
| [stopTrip()](#stoptrip)   | `Future<void>` | ✅  |   ✅    |

### startTrip

```dart
Future<void> start(PresetTrip presetTrip)
```

To simulate a trip, call the start method in TripSimulator with a appropriate configuration with the `PresetTrip` parameter.

```dart
await DriveKitTripSimulator.instance.start(PresetTrip.highwayTrip);
```

| PresetTrip                                  | Description
| ------------------------------------------- | ---------------------- |
| `shortTrip`                                 |  Trip too short that does not allow to rate the driver's behavior |
| `mixedTrip`                                 |  A 15-minute mixed trip in urban and suburban areas |
| `cityTrip`                                  |  A 20-minute city trip |
| `suburbanTrip`                              |  A 30-minute trip performed in a suburban environment mostly |
| `highwayTrip`                               |  A 55-minute highway trip |
| `trainTrip`                                 |  Trip recorded in a train to test the alternative transportation modes detection |
| `busTrip`                                   |  Trip recorded in a bus to test the alternative transportation modes detection |
| `boatTrip`                                  |  Trip recorded in a boat to test the alternative transportation modes detection |
| `tripWithCrashConfirmed30KmH`               |  A short trip with a collision at 30 km/h that occurs 137 seconds after the trip begins and that corresponds to a confirmed accident |
| `tripWithCrashConfirmed20KmH`              | A short trip with a collision at 20 km/h that occurs 141 seconds after the trip begins and that corresponds to a confirmed accident |
| `tripWithCrashConfirmed10KmH`             | A short trip with a collision at 10 km/h that occurs 146 seconds after the trip begins and that corresponds to a confirmed accident |
| `tripWithCrashUnconfirmed0KmH`            | A short trip with a collision during a vehicle stop that occurs 159 seconds after the trip begins and that corresponds to an unconfirmed accident |
| `tripWithCrashConfirmed30KmHStillDriving` | A trip to simulate an accident confirmed less than two minutes after the start of the trip, after which the driver continued driving. |



### stopTrip

```dart
Future<void> stop()
```

To stop the trip simulation, call the following method. The trip will be stopped instantly:

```dart
await DriveKitTripSimulator.instance.stop();
```


Please refer to the [DriveKit Trip Simulator documentation](https://docs.drivequant.com/trip-analysis/trip-simulator) for more information about the features we provide.

You can also take a look at the [flutter example](https://github.com/DriveQuantPublic/flutter-drivekit/tree/main/packages/drivekit_core/flutter_drivekit_core/example) for a basic usage of the DriveKit SDK, and the [iOS example app](https://github.com/DriveQuantPublic/drivekit-quickstart-ios) or [android example app](https://github.com/DriveQuantPublic/drivekit-quickstart-android) for a complete demonstration.
