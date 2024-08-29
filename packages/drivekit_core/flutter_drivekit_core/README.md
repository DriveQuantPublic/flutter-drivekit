# DriveKit Core plugin

Flutter interface for DriveKit Core

To learn more about DriveKit, please visit our [DriveKit documentation](https://docs.drivequant.com/)

## Installation

To use this plugin, run this command in your project

```
flutter pub add drivekit_core
```

Now, you can import `'package:flutter_drivekit_core/flutter_drivekit_core.dart'` and use `DriveKitCore` in your Dart code.

### Permissions

Our recommandation is to use [permission_handler](https://pub.dev/packages/permission_handler). You can find an implementation example in the [demo application inside this repository](/example/lib/widgets/sliver_permission_request.dart).

#### Bluetooth authorization

Even if your app do not use Bluetooth, you **MUST** include usage description on iOS side. For more details, please take a look inside the [native documentation](https://docs.drivequant.com/get-started-drivekit/ios#project-configuration)

## Manual initialization

If you have disabled the DriveKit auto-initialization:

- On Android project, call `initialize` method inside your `MainApplication` class.

```kotlin
// MainApplication.kt
    // …

    override fun onCreate() {
        super.onCreate()
        DriveKit.initialize(this)
        // …
    }
```

- On iOS project, call `initialize` method inside your `AppDelegate`.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    DriveKit.shared.initialize()
    (…)
}
```

## Usage

To finish the module's initialization, you need to :

1. Specify your API key;
2. Identify the driver with a unique ID.

```dart
await DriveKitCore.instance.setApiKey(apiKey)
await DriveKitCore.instance.setUserId(userId)
```

Now, you can configure the DriveKit Core with the options you want, and use other DriveKit plugins to start analysing trips.

## API

| Method                                                                            | Return Type       | iOS | Android |
| --------------------------------------------------------------------------------- | ----------------- | :-: | :-----: |
| [getApiKey()](#getapikey)                                                         | `Future<String?>` | ✅  |   ✅    |
| [setApiKey()](#setapikey)                                                         | `Future<void>`    | ✅  |   ✅    |
| [getUserId()](#getuserid)                                                         | `Future<String?>` | ✅  |   ✅    |
| [setUserId()](#setuserid)                                                         | `Future<void>`    | ✅  |   ✅    |
| [addDriveKitListener()](#adddrivekitlistener)                                     | `Future<void>`    | ✅  |   ✅    |
| [removeDriveKitListener()](#removedrivekitlistener)                               | `Future<void>`    | ✅  |   ✅    |
| [removeAllDriveKitListener()](#removealldrivekitlisteners)                        | `Future<void>`    | ✅  |   ✅    |
| [addDeviceConfigurationListener()](#adddeviceconfigurationlistener)               | `Future<void>`    | ✅  |   ✅    |
| [removeDeviceConfigurationListener()](#removedeviceconfigurationlistener)         | `Future<void>`    | ✅  |   ✅    |
| [removeAllDeviceConfigurationListeners()](#removealldeviceconfigurationlisteners) | `Future<void>`    | ✅  |   ✅    |
| [deleteAccount()](#deleteaccount)                                                 | `Future<void>`    | ✅  |   ✅    |
| [enableLogging()](#logging)                                                       | `Future<void>`    | ✅  |   ✅    |
| [disableLogging()](#logging)                                                      | `Future<void>`    | ✅  |   ✅    |
| [getLogUriFile()](#getlogurifile)                                                 | `Futur<Uri?>`     | ✅  |   ✅    |
| [isTokenValid()](#istokenvalid)                                                   | `Futur<bool>`     | ✅  |   ✅    |
| [reset()](#reset)                                                                 | `Future<void>`    | ✅  |   ✅    |

### getApiKey

```dart
Future<String?> getApiKey()
```

This method can be useful to check which DriveKit API Key you have set in the SDK.

```dart
final apiKey = await DriveKitCore.instance.getApiKey();
```

### setApiKey

```dart
Future<void> setApiKey()
```

To use DriveKit modules, you have to obtain an API Key from DriveQuant. If you don't have an API key, please contact [DriveQuant](mailto:contact@drivequant.com).

Once you've stored your API key in a secure way in your app, you can configure DriveKit by calling the following method:

```dart
await DriveKitCore.instance.setApiKey('MyAPIKey');
```

### getUserId

```dart
Future<String?> getUserId()
```

This method can be useful to retrieve the current userId.

```dart
final userId = await DriveKitCore.instance.getUserId();
```

### setUserId

```dart
Future<void> setUserId()
```

Each driver must be identified with a unique identifier. Once you have this identifier, configure DriveKit by calling the following method:

```dart
await DriveKitCore.instance.setUserId('MyUniqueUserId);
```

> ℹ️
>
> You can call these 2 configuration methods anywhere in the code. DriveKit will save the value locally. If the app is killed and relaunched, DriveKit will be reconfigured automatically.

> ⚠️
>
> We recommend never using an email address or phone number to define the unique user ID. It is recommended that you set up a unique, universal and anonymous user ID. For example, you can generate a globally unique identifier (GUID) for each of your users.

> ⚠️
>
> DriveKit SDK will not work until you set the API key and the userId.

### addDriveKitListener

```dart
void addDriveKitListener(DriveKitListener listener)
```

`DriveKitListener` is an interface that gives useful events about the user lifecycle. You can register to this listener by calling the following code:

```dart
    DriveKitCore.instance.addDriveKitListener(
      DriveKitListener(
        onConnected: () {
          (…)
        },
        onDisconnected: () {
          (…)
        },
        userIdUpdateStatus: (status, userId) {
          (…)
        },
        onAuthenticationError: (errorType) {
          (…)
        },
        onAccountDeleted: (status) {
          (…)
        },
        onBackgroundFetchStatusChanged: (status) {
          (…)
        },
      ),
    );
```

| Method                         | Description                                                                             |
|--------------------------------|-----------------------------------------------------------------------------------------|
| onConnected                    | The user has been successfully logged.                                                  |
| onDisconnected                 | The user has been disconnected (manual logout or the account is disabled/deleted).      |
| userIdUpdateStatus             | The update userId request has been processed with a  `UpdateUserIdStatus` state value.  |
| onAuthenticationError          |  The login has failed due to a `RequestError`.                                          |
| onAccountDeleted               | The delete account request has been processed with a `DeleteAccountStatus` state value. |
| onBackgroundFetchStatusChanged | The background fetch status has changed with a `BackgroundFetchStatus` state value.     |


### removeDriveKitListener

```dart
void removeDriveKitListener(DriveKitListener listener)
```

You can remove a specific `DriveKitListener` by calling the following method:

```dart
DriveKitCore.instance.removeDriveKitListener(listener);
```

### removeAllDriveKitListeners

```dart
void removeAllDriveKitListeners()
```

You can remove all `DriveKitListener` by calling the following method:

```dart
DriveKitCore.instance.removeAllDriveKitListeners();
```

### addDeviceConfigurationListener

`DKDeviceConfigurationListener` is the interface used to get callbacks when device configuration changes are detected. To add a listener and get informed for device configuration events, you can call the following method:

```dart
    DriveKitCore.instance.addDeviceConfigurationListener(
      DKDeviceConfigurationListener(
        onDeviceConfigurationChanged: (event) => {
          // …
        },
      ),
    );
```

| Method                         | Description                                                            |
| ------------------------------ | ---------------------------------------------------------------------- |
| locationPermissionValid        | Location permission status changed and is granted.                     |
| locationPermissionInvalid      | Location permission status changed and is revoked.                     |
| activityPermissionValid        | Activity permission status changed and is granted.                     |
| activityPermissionInvalid      | Activity permission status changed and is revoked.                     |
| notificationPermissionValid    | Notification permission status changed and is granted.                 |
| notificationPermissionInvalid  | Notification permission status changed and is revoked.                 |
| appBatteryOptimisationValid    | Android only. App battery optimisation setting changed and is valid.   |
| appBatteryOptimisationInvalid  | Android only. App battery optimisation setting changed and is invalid. |
| lowPowerModeValid              | iOS only. Low power mode setting changed and is valid.                 |
| lowPowerModeInvalid            | iOS only. Low power mode setting changed and is invalid.               |
| autoResetPermissionValid       | Android only. Auto reset setting status changed and is granted.        |
| autoResetPermissionInvalid     | Android only. Auto reset setting status changed and is revoked.        |
| nearbyDevicesPermissionValid   | Android only. Nearby devices permission status changed and is granted. |
| nearbyDevicesPermissionInvalid | Android only. Nearby devices permission status changed and is revoked. |
| bluetoothPermissionValid       | iOS only. Bluetooth permission status changed and is granted.          |
| bluetoothPermissionInvalid     | iOS only. Bluetooth permission status changed and is revoked.          |
| locationSensorValid            | Location sensor status changed and is turned ON.                       |
| locationSensorInvalid          | Location sensor status changed and is turned OFF.                      |
| bluetoothSensorValid           | Bluetooth sensor status changed and is turned ON.                      |
| bluetoothSensorInvalid         | Bluetooth sensor status changed and is turned OFF.                     |

### removeDeviceConfigurationListener

```dart
void removeDeviceConfigurationListener(DKDeviceConfigurationListener listener)
```

You can remove a specific `DKDeviceConfigurationListener` by calling the following method:

```dart
DriveKitCore.instance.removeDeviceConfigurationListener(listener);
```

### removeAllDeviceConfigurationListeners

```dart
void removeAllDeviceConfigurationListeners()
```

You can remove all `DKDeviceConfigurationListener` by calling the following method:

```dart
DriveKitCore.instance.removeAllDeviceConfigurationListeners();
```

### deleteAccount

```dart
Future<void> deleteAccount({bool instantDeletion = false});
```

You can delete a driver's account in DriveKit. This action deletes all the data related to the account.

The deletion can be done instantly or with delay.

- In the first case, when the method is called, the account is instantly deleted.
- In the second case, the driver has 30 days to log back into the application and reactivate his account.

To delete a driver's account, use the following method:

```dart
await DriveKitCore.instance.deleteAccount(instantDeletion: true);
```

`instantDeletion` can have 2 values:

- `false` : **Default value**, allows the user to recover the deleted account by logging-in again with the same credentials. Users have 30 days starting from the day when the account was deleted.
- `true` : Allows to delete an account instantly. The account and all the related data will be immediately deleted and no rollback is possible.

> ℹ️
>
> Your team needs to have the deletion feature activated to use this method. Please contact DriveQuant if you need it.

> ℹ️
>
> To be able to check whenever the account deletion is complete, you have to use the `DriveKitListener` interface.

> ⚠️
>
> You should restore the DriveKit API key in the `onAccountDeleted()` callback only when the status value is SUCCESS.

### Logging

```dart
  Future<void> enableLogging({
    String androidLogPath = '/DriveKit',
    bool showInConsole = true,
  });

  Future<void> disableLogging({bool showInConsole = true});
```

| Option                    | Default Value | Description                                                               |
| ------------------------- | ------------- | ------------------------------------------------------------------------- |
| `bool showInConsole`      | `true`        | set to `false` if you don't want your logs to be displayed in the console |
| `String androidLogPath`   | `'/DriveKit'` | **android only** - path where the log files will be saved                 |

DriveKit comes with a logging feature that is enabled by default. This feature allows you to quickly identify the cause of a problem. We recommend leaving the log enabled as it does not consume memory space and is useful in the support phase. However, if you don't want to use it, it can be disabled.

> ⚠️ **Android**
>
> If your device version is on Android 10 or below, you can directly find the log file in Android/data/<your-app-package-name>/files/<path-to-my-log-directory>

> ℹ️ **iOS**
>
> Log will be written in app directory. One log file per month will be written with the name log-\<YEAR\>-\<MONTH\>.txt (example: `log-2019-8.txt`). All DriveKit modules log in this file.
>
> You can make files of your application (including DriveKit log files) available in the iOS Files app by adding these 2 keys to your project's Info.plist file: UIFileSharingEnabled and LSSupportsOpeningDocumentsInPlace, setting them both to true.

> ⚠️ **iOS**
>
> To write log files on user smartphone, you must add the following entry in your info.plist file `UIFileSharingEnabled` and `LSSupportsOpeningDocumentsInPlace` set to true.

Disable logging by calling:

```dart
await DriveKitCore.instance.disableLogging();
```

To enable logging, call the following method specifying the path of the log directory.

```dart
await DriveKitCore.instance.enableLogging(showInConsole: true, androidLogPath: '/YourDriveKitFolder');
```

### getLogUriFile

```dart
Future<Uri?> getLogUriFile();
```

You can retrieve the Uri log file by calling the following method:

```dart
final logFile = await DriveKitCore.instance.getLogUriFile();
```

### isTokenValid

```dart
Future<bool> isTokenValid();
```

Once you are connected to the SDK with your key and a user ID, you can check the validity of the generated token by calling:

```dart
final isTokenValid = await DriveKitCore.instance.isTokenValid();
```

### reset

```dart
Future<void> reset();
```

If you need to reset DriveKit configuration (user logout for example), you can call the following method:

```dart
await DriveKitCore.instance.reset();
```
