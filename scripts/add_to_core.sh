#!/bin/bash

./scripts/add_to_public_package.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core/lib/flutter_drivekit_core.dart \
DrivekitCorePlatform \
DriveKitCore

./scripts/add_to_default_implem.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/src/default_drivekit_core.dart \
DrivekitCorePlatform \
DefaultDrivekitCore

./scripts/add_to_pigeon.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_android/pigeon/messages.dart \
DrivekitCorePlatform \
AndroidCoreApi

./scripts/add_to_pigeon.sh \
./packages/drivekit_core/flutter_drivekit_core_platform_interface/lib/flutter_drivekit_core_platform_interface.dart \
./packages/drivekit_core/flutter_drivekit_core_ios/pigeon/messages.dart \
DrivekitCorePlatform \
IOSCoreApi

melos pigeon