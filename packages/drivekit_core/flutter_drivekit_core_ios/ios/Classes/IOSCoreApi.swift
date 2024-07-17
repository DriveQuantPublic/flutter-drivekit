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
final class FlutterCoreError: Error {
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
      "FlutterCoreError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? FlutterCoreError {
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
private class IOSCoreApiPigeonCodecReader: FlutterStandardReader {
}

private class IOSCoreApiPigeonCodecWriter: FlutterStandardWriter {
}

private class IOSCoreApiPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return IOSCoreApiPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return IOSCoreApiPigeonCodecWriter(data: data)
  }
}

class IOSCoreApiPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = IOSCoreApiPigeonCodec(readerWriter: IOSCoreApiPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol IOSCoreApi {
  func getPlatformName() throws -> String
  func setApiKey(key: String) throws
  func setUserId(userId: String) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IOSCoreApiSetup {
  static var codec: FlutterStandardMessageCodec { IOSCoreApiPigeonCodec.shared }
  /// Sets up an instance of `IOSCoreApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: IOSCoreApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let getPlatformNameChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getPlatformName\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
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
    let setApiKeyChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.setApiKey\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setApiKeyChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        do {
          try api.setApiKey(key: keyArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setApiKeyChannel.setMessageHandler(nil)
    }
    let setUserIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.setUserId\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setUserIdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userIdArg = args[0] as! String
        do {
          try api.setUserId(userId: userIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setUserIdChannel.setMessageHandler(nil)
    }
  }
}
