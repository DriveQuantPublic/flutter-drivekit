import 'package:flutter_drivekit_trip_analysis_platform_interface/src/default_drivekit_trip_analysis.dart';
import 'package:flutter_drivekit_trip_analysis_platform_interface/src/model.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_drivekit_trip_analysis_platform_interface/src/model.dart';

/// The interface that implementations of drivekit_trip_analysis must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DriveKitTripAnalysis`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly
/// added [DriveKitTripAnalysisPlatform] methods.
abstract class DriveKitTripAnalysisPlatform extends PlatformInterface {
  /// Constructs a DriveKitTripAnalysisPlatform.
  DriveKitTripAnalysisPlatform() : super(token: _token);

  static final Object _token = Object();

  static DriveKitTripAnalysisPlatform _instance = DefaultDriveKitTripAnalysis();

  /// The default instance of [DriveKitTripAnalysisPlatform] to use.
  ///
  /// Defaults to [DefaultDriveKitTripAnalysis].
  static DriveKitTripAnalysisPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DriveKitTripAnalysisPlatform]
  /// when they register themselves.
  static set instance(DriveKitTripAnalysisPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Initialize the platform.
  void initializePlatform();

  /// Returns true if the autostart is activated.
  Future<bool> isAutoStartActivated();

  /// Activate autostart mode.
  Future<void> activateAutoStart(bool activate);

  /// Returns true if the Crash Detection is activated.
  Future<bool> isCrashDetectionActivated();

  /// Activate crash detection.
  Future<void> activateCrashDetection(bool activate);

  /// Manually start a trip
  Future<void> startTrip();

  /// Manually stop the trip.
  Future<void> stopTrip();

  /// Cancel the trip.
  Future<void> cancelTrip();

  /// This method returns false if the SDK is in INACTIVE state,
  /// and no trip is currently running.
  Future<bool> isTripRunning();

  /// Returns true if the monitor potential trip is activated.
  Future<bool> isMonitoringPotentialTripStart();

  /// If this method is called with parameter to true and autostart is disable,
  /// you will be able to listen for trip start trigger events, and the trip
  /// analysis will not be started automatically.
  Future<void> setMonitorPotentialTripStart(bool activate);

  /// Set the user's vehicle.
  Future<void> setVehicle(Vehicle vehicle);

  /// Add a listener to receive events concerning trips.
  void addTripListener(TripListener listener);

  /// Remove a trip listener
  void removeTripListener(TripListener listener);

  /// Remove all trip listeners
  void removeAllTripListeners();

  /// Indicates if the analyzed trip is valid or not
  Future<TripResponseStatus?> getTripResponseStatus(
    PostGenericResponse tripResponse,
  );
}
