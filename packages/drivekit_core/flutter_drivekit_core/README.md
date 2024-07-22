# DriveKit Core plugin

Flutter interface for DriveKit Core

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add drivekit_core
```

Now, you can import `'package:flutter_drivekit_core/flutter_drivekit_core.dart'` and use `DriveKitCore` in your Dart code.

## Usage

First, you need to initialize DriveKitCore with your `apiKey`, and give a unique `userId` to the user.

```dart
final driveKitCore = DriveKitCore()
 driveKitCore.setApiKey(apiKey)
 driveKitCore.setUserId(userId)
```

We recommend to store the API Key in a secure place, and to choose a unique, universal and anonymous user ID (never email address or phone number). For example, you can generate a globally unique identifier ([GUID](https://www.guidgenerator.com/online-guid-generator.aspx)) for each of your users.

Now, you can configure the Drivekit Core with the options you want, and use other Drivekit plugins to start analysing trips.
