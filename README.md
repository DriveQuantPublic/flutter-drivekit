# DriveKit Flutter SDK

This project presents the Flutter interfaces for the DriveKit SDK on iOS and Android. To use this SDK, please contact [DriveQuant](https://info.drivequant.com/contact/).

It is a Flutter monorepo containing several federated plugins.

The DriveKit SDK for Flutter is available with:
- Android 6.0 (API 23) and later versions, 
- and iOS 11.0 and later versions.

This SDK are supported for Flutter `1.20.0` version and above. It is recommended to use a recent version of Flutter.

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

To know how to contribute and understand this project's architecture and tools, please refer to the [CONTRIBUTING.md](./CONTRIBUTING.md) file.

## How to install the DriveKit SDK in your Flutter application?

### ➡️ Step 1: Install the Core module

First you need to install the Core module. 
This module is mandatory and includes methods to configure your API key and to create a user.

To install this module, follow step by step the method described in the [Core documentation](/packages/drivekit_core/flutter_drivekit_trip_analysis/README.md)

---

### ➡️ Step 2: Install the Trip Analysis module

After installing the Core component, you need to install the Trip Analysis component which manages the trip recording and the automatic mode configuration.

To install this module, follow step by step the method described in the [Trip Analysis documentation](/packages/drivekit_trip_analysis/flutter_drivekit_trip_analysis/README.md)

