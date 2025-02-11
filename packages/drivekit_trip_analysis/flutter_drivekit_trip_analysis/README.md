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

Then, you can start using the DriveKit Trip Analysis plugin. For example, you can activate the auto start mode with the following code:

```dart
await DriveKitTripAnalysis.instance.activateAutoStart(true);
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

| Method                                                              | Return Type                             | iOS | Android |
| ------------------------------------------------------------------- | --------------------------------------- | :-: | :-----: |
| [isAutoStartActivated()](#isautostartactivated)                     | `Future<bool>`                          | ✅  |   ✅    |
| [activateAutoStart()](#activateautostart)                           | `Future<void>`                          | ✅  |   ✅    |
| [startTrip()](#starttrip)                                           | `Future<void>`                          | ✅  |   ✅    |
| [stopTrip()](#stoptrip)                                             | `Future<void>`                          | ✅  |   ✅    |
| [cancelTrip()](#canceltrip)                                         | `Future<void>`                          | ✅  |   ✅    |
| [isTripRunning()](#istriprunning)                                   | `Future<bool>`                          | ✅  |   ✅    |
| [setCustomTimeOut()](#setcustomtimeout)                             | `Future<void>`                          | ✅  |   ✅    |
| [addTripListener()](#addtriplistener)                               | `Future<void>`                          | ✅  |   ✅    |
| [removeTripListener()](#removetriplistener)                         | `Future<void>`                          | ✅  |   ✅    |
| [removeAllTripListeners()](#removealltriplisteners)                 | `Future<void>`                          | ✅  |   ✅    |
| [isCrashDetectionActivated()](#iscrashdetectionactivated)           | `Future<bool>`                          | ✅  |   ✅    |
| [activateCrashDetection()](#activatecrashdetection)                 | `Future<void>`                          | ✅  |   ✅    |
| [isMonitoringPotentialTripStart()](#ismonitoringpotentialtripstart) | `Future<bool>`                          | ✅  |   ✅    |
| [setMonitorPotentialTripStart()](#setmonitorpotentialtripstart)     | `Future<void>`                          | ✅  |   ✅    |
| [setVehicle()](#setvehicle)                                         | `Future<bool>`                          | ✅  |   ✅    |
| [getTripMetadata()](#gettripmetadata)                               | `Future<Map<String, String>?`           | ✅  |   ✅    |
| [updateTripMetadata()](#updatetripmetadata)                         | `Future<void>`                          | ✅  |   ✅    |
| [deleteTripMetadata()](#deletetripmetadata)                         | `Future<void>`                          | ✅  |   ✅    |
| [deleteAllTripMetadata()](#deletealltripmetadata)                   | `Future<void>`                          | ✅  |   ✅    |
| [getCurrentTripInfo()](#getcurrenttripinfo)                         | `Future<CurrentTripInfo?>`              | ✅  |   ✅    |
| [getLastTripLocation()](#getlasttriplocation)                       | `Future<LastTripLocation?>`             | ✅  |   ✅    |
| [isTripSharingAvailable()](#isTripSharingAvailable)                 | `Future<bool>`                          | ✅  |   ✅    |
| [createTripSharingLink()](#createTripSharingLink)                   | `Future<CreateTripSharingLinkResponse>` | ✅  |   ✅    |
| [getTripSharingLink()](#getTripSharingLink)                         | `Future<GetTripSharingLinkResponse>`    | ✅  |   ✅    |
| [revokeTripSharingLink()](#revokeTripSharingLink)                   | `Future<RevokeTripSharingLinkStatus>`   | ✅  |   ✅    |

### isAutoStartActivated

```dart
Future<bool> isAutoStartActivated();
```

This method returns `true` if you have activated the auto start.

```dart
final isAutoStartActivated = await DriveKitTripAnalysis.instance.isAutoStartActivated();
```

### activateAutoStart

```dart
Future<void> activateAutoStart(bool activate);
```

The automatic mode detects vehicle movements and triggers the trip analysis without driver intervention while the application is in background. The analysis is stopped automatically at the end of the trip.

This feature is recommended to avoid driver distraction and phone handling while driving. The automatic mode has been optimized to limit the battery drain.

By default, auto start is disabled. To enable automatic trip detection mode, call the following method:

```dart
await DriveKitTripAnalysis.instance.activateAutoStart(true);
```

To disable automatic trip detection call the same method with parameter enable set to `false`

```dart
await DriveKitTripAnalysis.instance.activateAutoStart(false);
```

> ⚠️
>
> If a trip is running when automatic trip detection is disabled, the trip will not be canceled. If you want to cancel the trip, you should also call `cancelTrip` method.

### startTrip

```dart
Future<void> startTrip();
```

You can start a trip by calling the following method:

```dart
await DriveKitTripAnalysis.instance.startTrip();
```

> ℹ️
>
> If a trip's already started, calling this method will have no effect.

### stopTrip

```dart
Future<void> stopTrip();
```

You can stop a trip by calling the following method. The trip will be stopped instantly:

```dart
await DriveKitTripAnalysis.instance.stopTrip();
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
await DriveKitTripAnalysis.instance.cancelTrip();
```

### isTripRunning

```dart
Future<bool> isTripRunning();
```

This method returns false if the SDK is in `INACTIVE` state, and no trip is currently running.

```dart
final isTripRunning = await DriveKitTripAnalysis.instance.isTripRunning();
```

### setCustomTimeOut

```dart
Future<void> setStopTimeOut(int timeOut)
```

A trip being analyzed is automatically stopped after a period of inactivity (which begins when the vehicle has stopped). The DriveQuant SDK allows to set the end-of-trip duration.

By default, the trip analysis is stopped after 240 seconds. This value can be tuned according to your need and you can choose any integer values between 120 and 480 seconds by calling the following method:

```dart
await DriveKitTripAnalysis.instance.setStopTimeOut(123);
```

> ℹ️
>
> If a value greater than `480` is set, the value will be forced to `480`.
> If a value lower than `120` is set, the value will be forced to `120`.

### addTripListener

The `TripListener` interface provides useful information and event about trips analyzed by DriveKit.

For example, you can be informed when a trip analysis has started, finished, canceled, when a crash is detected, etc. by using the method:

```dart
void addTripListener(TripListener listener);
```

`TripListener` interface includes several methods to implement:

| Method                            | Description                                                                                                                                                                                                                                                                                                          |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| tripRecordingStarted              | Immediately called when a trip recording starts. This callback is triggered after calling the DriveKit SDK's `startTrip()` method or after automatic trip detection. `DKTripRecordingStartedState` object is described [here](https://docs.drivequant.com/trip-analysis/ios/references#dktriprecordingstartedstate). |
| tripRecordingConfirmed            | Called each time a trip is confirmed. `DKTripRecordingConfirmedState` object is described [here](https://docs.drivequant.com/trip-analysis/ios/references#dktriprecordingconfirmedstate).                                                                                                                            |
| tripRecordingCanceled             | Called when a trip recording is canceled. `DKTripRecordingCanceledState` indicates which event has canceled the trip. `DKTripRecordingCanceledState` object is described [here](https://docs.drivequant.com/trip-analysis/ios/references#dktriprecordingcanceledstate).                                              |
| tripRecordingFinished             | Called when trip recording has ended, before sending trip data to DriveQuant's servers. `DKTripRecordingFinishedState` object is described [here](https://docs.drivequant.com/trip-analysis/ios/references#dktriprecordingfinishedstate).                                                                            |
| tripPoint                         | Called when a trip is started and confirmed, for each GPS point recorded by the SDK.                                                                                                                                                                                                                                 |
| tripSavedForRepost                | Called if at the end of the trip, the trip can be sent to DriveQuant's server for the analysis. The trip is saved locally on the SDK and will be sent later.                                                                                                                                                         |
| tripFinished                      | Called when a trip has been recorded by the SDK and sent to DriveQuant's server to be analyzed. `TripResponseStatus` object contains trip response status details. More about this object [here](https://docs.drivequant.com/trip-analysis/ios/references#tripresponsestatus)                                        |
| potentialTripStart                | Called each time a potential trip is started. `StartMode` indicates which event starts the potential trip.                                                                                                                                                                                                           |
| beaconDetected                    | Called when a beacon sets in the SDK is detected.                                                                                                                                                                                                                                                                    |
| significantLocationChangeDetected | iOS only. Called when a user significant location change is detected.                                                                                                                                                                                                                                                |
| sdkStateChanged                   | Called every time the state of the SDK changed, with the new `State` as parameter                                                                                                                                                                                                                                    |
| crashDetected                     | Called when a crash event is detected. Triggered only if Crash Detection is enabled.                                                                                                                                                                                                                                 |
| crashFeedbackSent                 | Called when crash feedback is enabled and a confirmed crash is detected. Triggered only if Crash Detection is enabled and feedback configured.                                                                                                                                                                       |
| tripStarted (deprecated)          | Called each time a trip is started. `StartMode` indicates which event starts the trip.                                                                                                                                                                                                                               |
| tripCancelled (deprecated)        | Called when a trip is canceled. `CancelTrip` indicates which event cancels the trip.                                                                                                                                                                                                                                 |

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

### isCrashDetectionActivated

```dart
Future<bool> isCrashDetectionActivated();
```

This method returns `true` if you have activated the crash detection.

```dart
final isCrashDetectionActivated = await DriveKitTripAnalysis.instance.isCrashDetectionActivated();
```

### activateCrashDetection

Crash detection features, included into the DriveKit Trip Analysis component, is able to collect and analyse smartphone sensors data to automatically detect when a car accident occurs.

Learn more about the feature [on iOS](https://docs.drivequant.com/trip-analysis/ios/crash-detection) / [on Android](https://docs.drivequant.com/trip-analysis/android/crash-detection)

An input parameter is available in DriveKitTripAnalysis to enable or disable the feature:

```dart
Future<void> activateCrashDetection(bool activate);
```

To activate crash detection, call the method with parameter to `true`

```dart
await DriveKitTripAnalysis.instance.activateCrashDetection(true);
```

To disable crash detection, call the method with parameter to `false`

```dart
await DriveKitTripAnalysis.instance.activateCrashDetection(false);
```

### isMonitoringPotentialTripStart

```dart
Future<bool> isMonitoringPotentialTripStart();
```

Check if the feature is activated or not with the following command:

```dart
final isMonitoringPotentialTripStart = await DriveKitTripAnalysis.instance.isMonitoringPotentialTripStart();
```

### setMonitorPotentialTripStart

```dart
Future<void> setMonitorPotentialTripStart(bool activate);
```

DriveKit's automatic start mode detects a trip and launches its recording immediately. This operating mode may not be appropriate for all use cases.

Your application may require other information or business logic before enabling the trip recording. For example, it may be appropriate to check that:

- A connected device is near to the smartphone.
- The trip recording is acceptable in a given time slot.

In this case, you may want to subscribe to the events that are indicative of the trip start but not necessarily launch the GPS sensor and the trip analysis.

This is why DriveKit allows you to subscribe to trigger events that indicate that a trip has probably started.

Learn more about the feature [on iOS](https://docs.drivequant.com/trip-analysis/ios/tripmanagement#access-the-trip-trigger-events) / [on Android](https://docs.drivequant.com/trip-analysis/android/trip-management#access-the-trip-trigger-events)

By default, the configuration is disabled. Call the following method with parameter to `true` to enable it.

```dart
await DriveKitTripAnalysis.instance.setMonitorPotentialTripStart(true);
```

To disable the feature, call the method with parameter to `false`

```dart
await DriveKitTripAnalysis.instance.setMonitorPotentialTripStart(false);
```

### setVehicle

```dart
Future<void> setVehicle(Vehicle vehicle);
```

To obtain a more precise analysis on driving behaviour, it's recommended to configure the vehicle used by the driver. You can do this by calling the following method:

```dart
await DriveKitTripAnalysis.instance.setVehicle(
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

### getTripMetadata

It is possible to get a copy of configured metadata thanks to the following method on `DriveKitTripAnalysis`.

```dart
Future<Map<String, String>?> getTripMetadata()
```

To do this, call the following method:

```dart
final tripMetadata = await DriveKitTripAnalysis.instance.getTripMetadata();
```

> ℹ️
>
> Any modification on the returned object has no effect on the metadata sent with a trip.

### setTripMetadata

It is possible to add some metadata to your trip.

```dart
Future<void> setTripMetadata(Map<String, String>? metadata)
```

To do this, call the following method:

```dart
const tripMetadata = {
  'key1': 'value1',
  'key2': 'value2',
};
await DriveKitTripAnalysis.instance.setTripMetadata(tripMetadata);
```

The metadata must be represented as a key/value object where the key and value have a String type.
The metadata can be set any time before the end of a trip.

> ℹ️
>
> If metadata is sent, it will also be added to the push data request in the metaData field.

### updateTripMetadata

You can update a value in metadata for a specific key

```dart
Future<void> updateTripMetadata(String key, String? value)
```

To do this, call the following method:

```dart
await DriveKitTripAnalysis.instance.updateTripMetadata('key', 'newValue');
```

### deleteTripMetadata

You can delete a value in metadata for a specific key

```dart
Future<void> deleteTripMetadata(String key)
```

To do this, call the following method:

```dart
await DriveKitTripAnalysis.instance.deleteTripMetadata('key');
```

### deleteAllTripMetadata

You can delete all values in trip metadata

```dart
Future<void> deleteAllTripMetadata()
```

To do this, call the following method:

```dart
await DriveKitTripAnalysis.instance.deleteAllTripMetadata();
```

### getCurrentTripInfo

When a trip analysis is starting, you may need some information about it, like the `StartMode` which triggers the trip recording, a local unique identifier of the trip that has not yet been analyzed by the DriveQuant’s servers, etc.

```dart
Future<CurrentTripInfo?> getCurrentTripInfo()
```

To do this, call the following method:

```dart
await DriveKitTripAnalysis.instance.getCurrentTripInfo();
```

If a trip is not running, the method will return `null`. Otherwise, following data is returned:

| Field       | Type      | Description                                                                                                                                                                                                                    |
| ----------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| localTripId | String    | Local and unique trip identifier generated by DriveKit SDK. ⚠️ It is different from the `itinId` property returned in the `Trip` object. `itinId` corresponds to the unique trip identifier generated after the data analysis. |
| date        | String    | Start date of the trip recording. ⚠️ It is different from the `startDate` property returned in the `Trip` object.                                                                                                              |
| startMode   | StartMode | The StartMode which triggered the trip recording.                                                                                                                                                                              |

### getLastTripLocation

This function returns the location of the end of the last trip recorded by the user.

The location is defined by GPS coordinates (latitude and longitude), along with the end date of the last trip and an accuracy indicator for the GPS reading.

You can use the end-of-trip coordinate for a variety of purposes, for example:

- help the user find his vehicle

- alert the customer that the user has reached a specific destination

- create a geofence to locate the vehicle

> ℹ️
>
> The last trip corresponds to the last trip recorded by the DriveKit SDK, regardless of the mode of transport used.

```dart
Future<LastTripLocation?> getLastTripLocation()
```

To retrieve the location at which the last recorded trip ended, use the following method:

```dart
await DriveKitTripAnalysis.instance.getLastTripLocation();
```

The method can return null if the user is not authenticated, or didn’t make a trip since the authentication, or hasn’t made any valid trips. Otherwise, following data is returned:

| Field         | Type          | Description                                                   |
| ------------- | ------------- | ------------------------------------------------------------- |
| date          | String        | Date of the end of trip.                                      |
| latitude      | double        | Latitude of the end of the trip.                              |
| longitude     | double        | Longitude of the end of the trip.                             |
| accuracymeter | double        | GPS data accuracy value in meters.                            |
| accuracyLevel | AccuracyLevel | GPS data accuracy level. Possible values are described below. |

#### AccuracyLevel

| Name | Description                                   |
| ---- | --------------------------------------------- |
| good | The GPS accuracy is strictly below 10 meters. |
| fair | The GPS accuracy is between 10 and 30 meters. |
| poor | The GPS accuracy is strictly above 30 meters. |

### isTripSharingAvailable

If the trip sharing feature is enabled for your company, your API key carries out the feature access and a trip sharing link can be generated.

```dart
Future<bool> isTripSharingAvailable()
```

To check if the trip sharing feature is available for your API key, you can call the following code:

```dart
final isAvailable = await DriveKitTripAnalysis.instance.isTripSharingAvailable();
```

### createTripSharingLink

```dart
Future<CreateTripSharingLinkResponse> createTripSharingLink(int durationInSeconds)
```

To generate a link to share trips, use the following code:

```dart
const oneHourInSeconds = 1 * 60 * 60;
final response = await DriveKitTripAnalysis.instance.createTripSharingLink(oneHourInSeconds);
```

The method takes a `durationInSeconds` parameter which indicates how long in seconds from now the sharing link will be valid.

#### CreateTripSharingLinkResponse

| Field  | Type                        | Description                                     |
| ------ | --------------------------- | ----------------------------------------------- |
| status | CreateTripSharingLinkStatus | The status of the request                       |
| data   | DKTripSharingLink           | Can be `null`. Data about the trip sharing link |

#### CreateTripSharingLinkStatus

| Field                   | Description                                                                                                                                                |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| success                 | The link has been successfully created. Information is returned in `data`                                                                                  |
| activeLinkAlreadyExists | A link already exists for this user. Information returned in `data` is null. 💡 You have to call the method to retrieve an existing link in your workflow. |
| error                   | An error occurred, for instance when the user has no network. Information returned in `data` is null.                                                      |
| userNotConnected        | The user is not yet connected to DriveKit. Information returned in `data` is null.                                                                         |
| invalidDuration         | An error occurred when trying to create a link. The duration parameter must be strictly greater than 0. Information returned in `data` is null.            |
| unauthenticated         | The user has been disconnected. Information returned in `data` is null.                                                                                    |
| forbidden               | Your API key is not allowed to use the feature. Information returned in `data` is null.                                                                    |

#### DKTripSharingLink

| Field     | Type   | Description                                                   |
| --------- | ------ | ------------------------------------------------------------- |
| code      | String | Unique trip sharing code.                                     |
| url       | String | URL of the map that will display the current trip of the user |
| startDate | String | Link validity start date                                      |
| endDate   | String | Link expiration date                                          |

### getTripSharingLink

```dart
Future<GetTripSharingLinkResponse> getTripSharingLink({
    SynchronizationType synchronizationType = SynchronizationType.defaultSync,
})
```

To retrieve a link to share trips, use the following code:

```dart
final response = await DriveKitTripAnalysis.instance.getTripSharingLink();
```

The method takes a `synchronizationType` parameter. It will retrieve locally stored data if the value is `cache`, otherwise with the `defaultSync` value it will call the DriveQuant’s servers.

#### GetTripSharingLinkResponse

| Field  | Type                     | Description                                     |
| ------ | ------------------------ | ----------------------------------------------- |
| status | GetTripSharingLinkStatus | The status of the request                       |
| link   | DKTripSharingLink        | Can be `null`. Data about the trip sharing link |

#### GetTripSharingLinkStatus

| Field                | Description                                                                                                    |
| -------------------- | -------------------------------------------------------------------------------------------------------------- |
| success              | The link has been successfully retrieved. Information is returned in `data`.                                   |
| failedToGetCacheOnly | An error occurred when trying to retrieve a link. Locally trip sharing link, if exists, is returned in `data`. |
| noActiveLink         | There is no active link for the user. Information returned in data is `null`.                                  |
| userNotConnected     | The user is not yet connected to DriveKit. Information returned in `data` is null.                             |
| unauthenticated      | The user has been disconnected. Information returned in data is `null`.                                        |
| forbidden            | Your API key is not allowed to use the feature. Information returned in `data` is null.                        |

### revokeTripSharingLink

```dart
Future<RevokeTripSharingLinkStatus> revokeTripSharingLink()
```

To revoke a trip sharing link, use the following code:

```dart
final response = await DriveKitTripAnalysis.instance.revokeTripSharingLink()
```

#### RevokeTripSharingLinkStatus

| Field            | Description                                      |
| ---------------- | ------------------------------------------------ |
| success          | The link has been successfully revoked           |
| noActiveLink     | There is no active link for the user             |
| error            | An error occurred when trying to revoke the link |
| userNotConnected | The user is not yet connected to DriveKit        |
| unauthenticated  | The user has been disconnected                   |
| forbidden        | Your API key is not allowed to use the feature   |
