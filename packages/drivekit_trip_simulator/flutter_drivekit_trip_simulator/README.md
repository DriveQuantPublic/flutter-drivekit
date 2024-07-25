# DriveKit trip_simulator plugin

Flutter interface for the DriveKit Trip Simulator

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add drivekit_trip_simulator
```

Now, you can import `'package:flutter_drivekit_trip_simulator/flutter_drivekit_trip_simulator.dart'` and use `DriveKitTripSimulator` in your Dart code.

## Usage

To use this plugin, you need to have an ApiKey from DriveQuant. If you don't have one, please [contact us](https://info.drivequant.com/contact/).
Then, you need to install the flutter_drivekit_core plugin and follow the instructions to specify the ApiKey and the UserId.

Now, you can configure the Drivekit Core with the options you want, and start using the Drivekit Trip Simulator plugin. For example, you can start trip analysis with the following code:

```dart
final driveKitTripSimulator = DriveKitTripSimulator();
//TODO
```

Please refer to the [DriveKit Trip Simulator documentation](https://docs.drivequant.com/trip-analysis/trip-simulator) for more information about the features we provide.

You can also take a look at the [flutter example](https://github.com/DriveQuantPublic/flutter-drivekit/tree/main/packages/drivekit_core/flutter_drivekit_core/example) for a basic usage of the Drivekit SDK, and the [iOS example app](https://github.com/DriveQuantPublic/drivekit-quickstart-ios) or [android example app](https://github.com/DriveQuantPublic/drivekit-quickstart-android) for a complete demonstration.
