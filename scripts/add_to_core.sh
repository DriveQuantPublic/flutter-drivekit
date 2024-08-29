#!/bin/bash

./scripts/add_to_public_package.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core/lib/flutter_drivekit_core.dart \
DriveKitCorePlatform \
DriveKitCore

./scripts/add_to_default_implem.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/src/default_drivekit_core.dart \
DriveKitCorePlatform \
DefaultDriveKitCore

./scripts/add_to_pigeon.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_android/pigeon/messages.dart \
DriveKitCorePlatform \
AndroidCoreApi

./scripts/add_to_pigeon.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_ios/pigeon/messages.dart \
DriveKitCorePlatform \
IOSCoreApi

melos pigeon

./scripts/add_to_platform_dart_file.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_android/lib/flutter_drivekit_core_android.dart \
DriveKitCorePlatform \
DriveKitCoreAndroid \
androidCoreApi

./scripts/add_to_platform_dart_file.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_ios/lib/flutter_drivekit_core_ios.dart \
DriveKitCorePlatform \
DriveKitCoreIOS \
iosCoreApi
