import Flutter
import UIKit

public class DrivekitTripAnalysisPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "drivekit_trip_analysis_ios", binaryMessenger: registrar.messenger())
    let instance = DrivekitTripAnalysisPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS")
  }
}
