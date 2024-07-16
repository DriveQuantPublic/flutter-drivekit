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
final class PigeonError: Error {
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
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
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
private class IOSTripAnalysisApiPigeonCodecReader: FlutterStandardReader {
}

private class IOSTripAnalysisApiPigeonCodecWriter: FlutterStandardWriter {
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
  }
}