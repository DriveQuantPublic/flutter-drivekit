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
final class FlutterDriverDataError: Error {
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
      "FlutterDriverDataError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? FlutterDriverDataError {
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
private class IOSDriverDataApiPigeonCodecReader: FlutterStandardReader {
}

private class IOSDriverDataApiPigeonCodecWriter: FlutterStandardWriter {
}

private class IOSDriverDataApiPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return IOSDriverDataApiPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return IOSDriverDataApiPigeonCodecWriter(data: data)
  }
}

class IOSDriverDataApiPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = IOSDriverDataApiPigeonCodec(readerWriter: IOSDriverDataApiPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol IOSDriverDataApi {
  func getPlatformName() throws -> String
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IOSDriverDataApiSetup {
  static var codec: FlutterStandardMessageCodec { IOSDriverDataApiPigeonCodec.shared }
  /// Sets up an instance of `IOSDriverDataApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: IOSDriverDataApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let getPlatformNameChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_driver_data_package.IOSDriverDataApi.getPlatformName\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
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
  }
}
