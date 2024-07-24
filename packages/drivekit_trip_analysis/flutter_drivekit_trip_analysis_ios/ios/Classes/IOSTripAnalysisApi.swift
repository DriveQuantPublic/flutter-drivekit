// Autogenerated from Pigeon (v20.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class FlutterTripAnalysisError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "FlutterTripAnalysisError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? FlutterTripAnalysisError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct PigeonVehicle {
  var carTypeIndex: Int64
  var carEngineIndex: Int64
  var carPower: Int64
  var carMass: Int64
  var carGearboxIndex: Int64
  var carConsumption: Double
  var engineDisplacement: Int64
  var frontTireSize: String
  var rearTireSize: String
  var length: Double
  var width: Double
  var height: Double
  var engineCylinderNb: Int64
  var driveWheels: Int64

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> PigeonVehicle? {
    let carTypeIndex = __pigeon_list[0] is Int64 ? __pigeon_list[0] as! Int64 : Int64(__pigeon_list[0] as! Int32)
    let carEngineIndex = __pigeon_list[1] is Int64 ? __pigeon_list[1] as! Int64 : Int64(__pigeon_list[1] as! Int32)
    let carPower = __pigeon_list[2] is Int64 ? __pigeon_list[2] as! Int64 : Int64(__pigeon_list[2] as! Int32)
    let carMass = __pigeon_list[3] is Int64 ? __pigeon_list[3] as! Int64 : Int64(__pigeon_list[3] as! Int32)
    let carGearboxIndex = __pigeon_list[4] is Int64 ? __pigeon_list[4] as! Int64 : Int64(__pigeon_list[4] as! Int32)
    let carConsumption = __pigeon_list[5] as! Double
    let engineDisplacement = __pigeon_list[6] is Int64 ? __pigeon_list[6] as! Int64 : Int64(__pigeon_list[6] as! Int32)
    let frontTireSize = __pigeon_list[7] as! String
    let rearTireSize = __pigeon_list[8] as! String
    let length = __pigeon_list[9] as! Double
    let width = __pigeon_list[10] as! Double
    let height = __pigeon_list[11] as! Double
    let engineCylinderNb = __pigeon_list[12] is Int64 ? __pigeon_list[12] as! Int64 : Int64(__pigeon_list[12] as! Int32)
    let driveWheels = __pigeon_list[13] is Int64 ? __pigeon_list[13] as! Int64 : Int64(__pigeon_list[13] as! Int32)

    return PigeonVehicle(
      carTypeIndex: carTypeIndex,
      carEngineIndex: carEngineIndex,
      carPower: carPower,
      carMass: carMass,
      carGearboxIndex: carGearboxIndex,
      carConsumption: carConsumption,
      engineDisplacement: engineDisplacement,
      frontTireSize: frontTireSize,
      rearTireSize: rearTireSize,
      length: length,
      width: width,
      height: height,
      engineCylinderNb: engineCylinderNb,
      driveWheels: driveWheels
    )
  }
  func toList() -> [Any?] {
    return [
      carTypeIndex,
      carEngineIndex,
      carPower,
      carMass,
      carGearboxIndex,
      carConsumption,
      engineDisplacement,
      frontTireSize,
      rearTireSize,
      length,
      width,
      height,
      engineCylinderNb,
      driveWheels,
    ]
  }
}
private class IOSTripAnalysisApiPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return PigeonVehicle.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class IOSTripAnalysisApiPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? PigeonVehicle {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class IOSTripAnalysisApiPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return IOSTripAnalysisApiPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return IOSTripAnalysisApiPigeonCodecWriter(data: data)
  }
}

class IOSTripAnalysisApiPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = IOSTripAnalysisApiPigeonCodec(readerWriter: IOSTripAnalysisApiPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol IOSTripAnalysisApi {
  func getPlatformName() throws -> String
  func activateAutoStart(activate: Bool) throws
  func activateCrashDetection(activate: Bool) throws
  func startTrip() throws
  func stopTrip() throws
  func cancelTrip() throws
  func isTripRunning() throws -> Bool
  func setVehicle(vehicle: PigeonVehicle) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IOSTripAnalysisApiSetup {
  static var codec: FlutterStandardMessageCodec { IOSTripAnalysisApiPigeonCodec.shared }
  /// Sets up an instance of `IOSTripAnalysisApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: IOSTripAnalysisApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let getPlatformNameChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.getPlatformName\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getPlatformNameChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getPlatformName()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getPlatformNameChannel.setMessageHandler(nil)
    }
    let activateAutoStartChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.activateAutoStart\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      activateAutoStartChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let activateArg = args[0] as! Bool
        do {
          try api.activateAutoStart(activate: activateArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      activateAutoStartChannel.setMessageHandler(nil)
    }
    let activateCrashDetectionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.activateCrashDetection\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      activateCrashDetectionChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let activateArg = args[0] as! Bool
        do {
          try api.activateCrashDetection(activate: activateArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      activateCrashDetectionChannel.setMessageHandler(nil)
    }
    let startTripChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.startTrip\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startTripChannel.setMessageHandler { _, reply in
        do {
          try api.startTrip()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startTripChannel.setMessageHandler(nil)
    }
    let stopTripChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.stopTrip\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      stopTripChannel.setMessageHandler { _, reply in
        do {
          try api.stopTrip()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      stopTripChannel.setMessageHandler(nil)
    }
    let cancelTripChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.cancelTrip\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      cancelTripChannel.setMessageHandler { _, reply in
        do {
          try api.cancelTrip()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      cancelTripChannel.setMessageHandler(nil)
    }
    let isTripRunningChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.isTripRunning\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      isTripRunningChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isTripRunning()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isTripRunningChannel.setMessageHandler(nil)
    }
    let setVehicleChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_trip_analysis_package.IOSTripAnalysisApi.setVehicle\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setVehicleChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let vehicleArg = args[0] as! PigeonVehicle
        do {
          try api.setVehicle(vehicle: vehicleArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setVehicleChannel.setMessageHandler(nil)
    }
  }
}
