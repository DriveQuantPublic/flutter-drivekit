import 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart';

export 'package:flutter_drivekit_trip_analysis_platform_interface/flutter_drivekit_trip_analysis_platform_interface.dart'
    show
        PostGenericResponse,
        TripListener,
        TripResponseError,
        TripResponseInfo,
        TripResponseStatus,
        TripResponseStatusType,
        Vehicle;

DriveKitTripAnalysisPlatform get _platform =>
    DriveKitTripAnalysisPlatform.instance;

/// The main class of the plugin.
/// This class provides methods to interact with the DriveKit Trip Analysis SDK.
class DriveKitTripAnalysis {
  DriveKitTripAnalysis._() {
    _platform.initializePlatform();
  }

  /// unique instance of the DriveKitTripAnalysis
  static DriveKitTripAnalysis get instance => _instance;
  static final DriveKitTripAnalysis _instance = DriveKitTripAnalysis._();

  /// Returns true if the auto start is activated
  Future<bool> isAutoStartActivated() async {
    return _platform.isAutoStartActivated();
  }

  /// The automatic mode detects vehicle movements and triggers the trip
  /// analysis without driver intervention while the application is in
  /// background. The analysis is stopped automatically at the end of the trip.
  /// This feature is recommended to avoid driver distraction and phone handling
  /// while driving. The automatic mode has been optimised to limit the battery
  /// drain.
  ///
  /// By default, automatic trip detection is disabled, but you can enable it by
  /// calling the following method with the enable parameter to true
  Future<void> activateAutoStart(bool activate) async {
    await _platform.activateAutoStart(activate);
  }

  /// Returns true if the crash detection is activated
  Future<bool> isCrashDetectionActivated() async {
    return _platform.isCrashDetectionActivated();
  }

  /// Crash detection features, included into the DriveKit Trip Analysis
  /// component, is able to collect and analyse smartphone sensors data to
  /// automatically detect when a car accident occurs.
  ///
  /// DriveKit Trip Analysis analyzes signals from the GPS sensor and also
  /// from the motion sensors (accelerometer, gyrometer and magnetometer).
  ///
  /// You can activate the feature by calling the following method with the
  /// activate parameter to true
  Future<void> activateCrashDetection(bool activate) async {
    await _platform.activateCrashDetection(activate);
  }

  /// You can start a trip by calling startTrip method
  Future<void> startTrip() async {
    await _platform.startTrip();
  }

  /// If a trip is currently being analyzed, calling this method will
  /// immediately end the trip and it will be sent to DriveQuant's backend to be
  /// analyzed.
  /// If no trip is currently being analyzed, calling this method has no effect.
  Future<void> stopTrip() async {
    await _platform.stopTrip();
  }

  /// If a trip is currently being analyzed, calling this method will
  /// immediately end the trip and it will not be analyzed by DriveQuant's
  /// backend.
  /// If no trip is currently being analyzed, calling this method has no effect.
  Future<void> cancelTrip() async {
    await _platform.cancelTrip();
  }

  /// This method returns false if the SDK is in INACTIVE state,
  /// and no trip is currently running.
  Future<bool> isTripRunning() async {
    return _platform.isTripRunning();
  }

  /// Returns true if the monitor potential trip start is activated
  static Future<bool> isMonitoringPotentialTripStart() async {
    return _platform.isMonitoringPotentialTripStart();
  }

  /// DriveKit's automatic start mode detects a trip and launches its recording
  /// immediately. This operating mode may not be appropriate for all use cases.
  /// Your application may require other information or business logic before
  ///  enabling the trip recording. For example, it may be appropriate to check
  /// that:
  ///
  /// A connected device is near to the smartphone.
  ///
  /// The trip recording is acceptable in a given time slot.
  ///
  /// In this case, you may want to subscribe to the events that are indicative
  /// of the trip start but not necessarily launch the GPS sensor and the trip
  /// analysis.
  ///
  /// This is why DriveKit allows you to subscribe to trigger events that
  /// indicates a trip has probably started.
  ///
  /// If this method is called with parameter to true and autostart is disable,
  /// you will be able to listen for trip start trigger events, and the trip
  /// analysis will not be started automatically.
  static Future<void> setMonitorPotentialTripStart(bool activate) async {
    return _platform.setMonitorPotentialTripStart(activate);
  }

  /// To obtain a more precise analysis on driving behavior,
  /// it's recommended to configure the vehicle used by the driver.
  /// You can do this by calling the setVehicle method with the driver's vehicle
  ///
  /// Otherwise, the analysis will be based on this default vehicle:
  ///   carTypeIndex = 1,
  ///   carEngineIndex = 1,
  ///   carPower = 150,
  ///   carMass = 1400,
  ///   carGearboxIndex = 2,
  ///   carConsumption = 4.5,
  ///   engineDisplacement = 1200,
  ///   frontTireSize = "205/55/16",
  ///   rearTireSize = "205/55/16",
  ///   length = 4.5,
  ///   width = 1.8,
  ///   height = 1.45,
  ///   engineCylinderNb = 4,
  ///   driveWheels = 0
  Future<void> setVehicle(Vehicle vehicle) async {
    await _platform.setVehicle(vehicle);
  }

  /// Add a listener to be notified of trip events
  void addTripListener(TripListener listener) {
    _platform.addTripListener(listener);
  }

  /// Remove a trip listener
  void removeTripListener(TripListener listener) {
    _platform.removeTripListener(listener);
  }

  /// Remove all trip listeners
  void removeAllTripListeners() {
    _platform.removeAllTripListeners();
  }

  /// Indicates if the analyzed trip is valid or not
  Future<TripResponseStatus?> getTripResponseStatus(
    PostGenericResponse tripResponse,
  ) async {
    return _platform.getTripResponseStatus(tripResponse);
  }
}
