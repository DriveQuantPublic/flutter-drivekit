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

private func createConnectionError(withChannelName channelName: String) -> FlutterCoreError {
  return FlutterCoreError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum PigeonDeleteAccountStatus: Int {
  case success = 0
  case failedToDelete = 1
  case forbidden = 2
}

enum PigeonRequestError: Int {
  case wrongUrl = 0
  case noNetwork = 1
  case unauthenticated = 2
  case forbidden = 3
  case serverError = 4
  case clientError = 5
  case limitReached = 6
  case unknownError = 7
}

enum PigeonUpdateUserIdStatus: Int {
  case updated = 0
  case failedToUpdate = 1
  case invalidUserId = 2
  case alreadyUsed = 3
  case savedForRepost = 4
}

enum PigeonBackgroundFetchStatus: Int {
  case started = 0
  case completed = 1
}

enum PigeonDeviceConfigurationEvent: Int {
  case locationSensorValid = 0
  case locationSensorInvalid = 1
  case bluetoothSensorValid = 2
  case bluetoothSensorInvalid = 3
  case locationPermissionValid = 4
  case locationPermissionInvalid = 5
  case activityPermissionValid = 6
  case activityPermissionInvalid = 7
  case notificationPermissionValid = 8
  case notificationPermissionInvalid = 9
  case bluetoothPermissionValid = 10
  case bluetoothPermissionInvalid = 11
  case lowPowerModeValid = 12
  case lowPowerModeInvalid = 13
}

/// Trip Synchronization Type
enum PigeonSynchronizationType: Int {
  /// synchronize by calling the DriveQuant servers
  case defaultSync = 0
  /// retrieve already synchronized items in the local database
  case cache = 1
}

/// User info synchronization status enum
enum PigeonUserInfoSyncStatus: Int {
  /// Synchronization has been successfully performed
  case success = 0
  /// SynchronizationType has been set to cache.
  case cacheDataOnly = 1
  /// Synchronization has failed,
  /// only user info previously synchronized is returned
  case failedToSyncTripsCacheOnly = 2
}

/// User Info
///
/// Generated class from Pigeon that represents data sent in messages.
struct PigeonUserInfo {
  var firstname: String? = nil
  var lastname: String? = nil
  var pseudo: String? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> PigeonUserInfo? {
    let firstname: String? = nilOrValue(__pigeon_list[0])
    let lastname: String? = nilOrValue(__pigeon_list[1])
    let pseudo: String? = nilOrValue(__pigeon_list[2])

    return PigeonUserInfo(
      firstname: firstname,
      lastname: lastname,
      pseudo: pseudo
    )
  }
  func toList() -> [Any?] {
    return [
      firstname,
      lastname,
      pseudo,
    ]
  }
}

/// the response returned when getting user info
///
/// Generated class from Pigeon that represents data sent in messages.
struct PigeonGetUserInfoResponse {
  /// user info sync status
  /// final PigeonUserInfoSyncStatus status
  var status: PigeonUserInfoSyncStatus
  /// user info data
  var userInfo: PigeonGetUserInfo? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> PigeonGetUserInfoResponse? {
    let status = __pigeon_list[0] as! PigeonUserInfoSyncStatus
    let userInfo: PigeonGetUserInfo? = nilOrValue(__pigeon_list[1])

    return PigeonGetUserInfoResponse(
      status: status,
      userInfo: userInfo
    )
  }
  func toList() -> [Any?] {
    return [
      status,
      userInfo,
    ]
  }
}

/// UserInfo class
///
/// Generated class from Pigeon that represents data sent in messages.
struct PigeonGetUserInfo {
  /// the retrieval status
  var status: PigeonUserInfoSyncStatus
  /// the user info data
  var userInfo: PigeonUserInfo? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> PigeonGetUserInfo? {
    let status = __pigeon_list[0] as! PigeonUserInfoSyncStatus
    let userInfo: PigeonUserInfo? = nilOrValue(__pigeon_list[1])

    return PigeonGetUserInfo(
      status: status,
      userInfo: userInfo
    )
  }
  func toList() -> [Any?] {
    return [
      status,
      userInfo,
    ]
  }
}
private class IOSCoreApiPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return PigeonUserInfo.fromList(self.readValue() as! [Any?])
    case 130:
      return PigeonGetUserInfoResponse.fromList(self.readValue() as! [Any?])
    case 131:
      return PigeonGetUserInfo.fromList(self.readValue() as! [Any?])
    case 132:
      var enumResult: PigeonDeleteAccountStatus? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonDeleteAccountStatus(rawValue: enumResultAsInt)
      }
      return enumResult
    case 133:
      var enumResult: PigeonRequestError? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonRequestError(rawValue: enumResultAsInt)
      }
      return enumResult
    case 134:
      var enumResult: PigeonUpdateUserIdStatus? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonUpdateUserIdStatus(rawValue: enumResultAsInt)
      }
      return enumResult
    case 135:
      var enumResult: PigeonBackgroundFetchStatus? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonBackgroundFetchStatus(rawValue: enumResultAsInt)
      }
      return enumResult
    case 136:
      var enumResult: PigeonDeviceConfigurationEvent? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonDeviceConfigurationEvent(rawValue: enumResultAsInt)
      }
      return enumResult
    case 137:
      var enumResult: PigeonSynchronizationType? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonSynchronizationType(rawValue: enumResultAsInt)
      }
      return enumResult
    case 138:
      var enumResult: PigeonUserInfoSyncStatus? = nil
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as? Int)
      if let enumResultAsInt = enumResultAsInt {
        enumResult = PigeonUserInfoSyncStatus(rawValue: enumResultAsInt)
      }
      return enumResult
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class IOSCoreApiPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? PigeonUserInfo {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? PigeonGetUserInfoResponse {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else if let value = value as? PigeonGetUserInfo {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else if let value = value as? PigeonDeleteAccountStatus {
      super.writeByte(132)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonRequestError {
      super.writeByte(133)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonUpdateUserIdStatus {
      super.writeByte(134)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonBackgroundFetchStatus {
      super.writeByte(135)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonDeviceConfigurationEvent {
      super.writeByte(136)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonSynchronizationType {
      super.writeByte(137)
      super.writeValue(value.rawValue)
    } else if let value = value as? PigeonUserInfoSyncStatus {
      super.writeByte(138)
      super.writeValue(value.rawValue)
    } else {
      super.writeValue(value)
    }
  }
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
  func setApiKey(key: String) throws
  func setUserId(userId: String) throws
  func getUserId() throws -> String?
  func updateUserId(userId: String) throws
  func getUserInfo(synchronizationType: PigeonSynchronizationType, completion: @escaping (Result<PigeonGetUserInfoResponse, Error>) -> Void)
  func updateUserInfo(userInfo: PigeonUserInfo, completion: @escaping (Result<Bool, Error>) -> Void)
  func reset() throws
  func isTokenValid() throws -> Bool
  func deleteAccount(instantDeletion: Bool) throws
  func getApiKey() throws -> String?
  func enableLogging(showInConsole: Bool) throws
  func disableLogging(showInConsole: Bool) throws
  func getLogUriFile() throws -> String?
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class IOSCoreApiSetup {
  static var codec: FlutterStandardMessageCodec { IOSCoreApiPigeonCodec.shared }
  /// Sets up an instance of `IOSCoreApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: IOSCoreApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
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
    let getUserIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getUserId\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getUserIdChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getUserId()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getUserIdChannel.setMessageHandler(nil)
    }
    let updateUserIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.updateUserId\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      updateUserIdChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userIdArg = args[0] as! String
        do {
          try api.updateUserId(userId: userIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      updateUserIdChannel.setMessageHandler(nil)
    }
    let getUserInfoChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getUserInfo\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getUserInfoChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let synchronizationTypeArg = args[0] as! PigeonSynchronizationType
        api.getUserInfo(synchronizationType: synchronizationTypeArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      getUserInfoChannel.setMessageHandler(nil)
    }
    let updateUserInfoChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.updateUserInfo\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      updateUserInfoChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let userInfoArg = args[0] as! PigeonUserInfo
        api.updateUserInfo(userInfo: userInfoArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      updateUserInfoChannel.setMessageHandler(nil)
    }
    let resetChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.reset\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      resetChannel.setMessageHandler { _, reply in
        do {
          try api.reset()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      resetChannel.setMessageHandler(nil)
    }
    let isTokenValidChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.isTokenValid\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      isTokenValidChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isTokenValid()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isTokenValidChannel.setMessageHandler(nil)
    }
    let deleteAccountChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.deleteAccount\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      deleteAccountChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let instantDeletionArg = args[0] as! Bool
        do {
          try api.deleteAccount(instantDeletion: instantDeletionArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      deleteAccountChannel.setMessageHandler(nil)
    }
    let getApiKeyChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getApiKey\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getApiKeyChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getApiKey()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getApiKeyChannel.setMessageHandler(nil)
    }
    let enableLoggingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.enableLogging\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      enableLoggingChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let showInConsoleArg = args[0] as! Bool
        do {
          try api.enableLogging(showInConsole: showInConsoleArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      enableLoggingChannel.setMessageHandler(nil)
    }
    let disableLoggingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.disableLogging\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      disableLoggingChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let showInConsoleArg = args[0] as! Bool
        do {
          try api.disableLogging(showInConsole: showInConsoleArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      disableLoggingChannel.setMessageHandler(nil)
    }
    let getLogUriFileChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_core_package.IOSCoreApi.getLogUriFile\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getLogUriFileChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getLogUriFile()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getLogUriFileChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol FlutterCoreApiProtocol {
  func driveKitDidConnect(completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func driveKitDidDisconnect(completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func driveKitDidReceiveAuthenticationError(error errorArg: PigeonRequestError, completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func userIdUpdateStatusChanged(status statusArg: PigeonUpdateUserIdStatus, userId userIdArg: String?, completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func driveKitAccountDeletionCompleted(status statusArg: PigeonDeleteAccountStatus, completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func driveKitBackgroundFetchStatusChanged(status statusArg: PigeonBackgroundFetchStatus, completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
  func onDeviceConfigurationChanged(event eventArg: PigeonDeviceConfigurationEvent, completion: @escaping (Result<Void, FlutterCoreError>) -> Void)
}
class FlutterCoreApi: FlutterCoreApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  private let messageChannelSuffix: String
  init(binaryMessenger: FlutterBinaryMessenger, messageChannelSuffix: String = "") {
    self.binaryMessenger = binaryMessenger
    self.messageChannelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
  }
  var codec: IOSCoreApiPigeonCodec {
    return IOSCoreApiPigeonCodec.shared
  }
  func driveKitDidConnect(completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidConnect\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func driveKitDidDisconnect(completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidDisconnect\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func driveKitDidReceiveAuthenticationError(error errorArg: PigeonRequestError, completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitDidReceiveAuthenticationError\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([errorArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func userIdUpdateStatusChanged(status statusArg: PigeonUpdateUserIdStatus, userId userIdArg: String?, completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.userIdUpdateStatusChanged\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([statusArg, userIdArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func driveKitAccountDeletionCompleted(status statusArg: PigeonDeleteAccountStatus, completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitAccountDeletionCompleted\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([statusArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func driveKitBackgroundFetchStatusChanged(status statusArg: PigeonBackgroundFetchStatus, completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.driveKitBackgroundFetchStatusChanged\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([statusArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onDeviceConfigurationChanged(event eventArg: PigeonDeviceConfigurationEvent, completion: @escaping (Result<Void, FlutterCoreError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.pigeon_core_package.FlutterCoreApi.onDeviceConfigurationChanged\(messageChannelSuffix)"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([eventArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterCoreError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
