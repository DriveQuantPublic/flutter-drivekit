#!/bin/bash

./scripts/add_to_public_package.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data/lib/flutter_drivekit_driver_data.dart \
DriveKitDriverDataPlatform \
DriveKitDriverData

./scripts/add_to_default_implem.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/src/default_drivekit_driver_data.dart \
DriveKitDriverDataPlatform \
DefaultDriveKitDriverData

./scripts/add_to_pigeon.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_android/pigeon/messages.dart \
DriveKitDriverDataPlatform \
AndroidDriverDataApi

./scripts/add_to_pigeon.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_ios/pigeon/messages.dart \
DriveKitDriverDataPlatform \
IOSDriverDataApi

melos pigeon

./scripts/add_to_platform_dart_file.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_android/lib/flutter_drivekit_driver_data_android.dart \
DriveKitDriverDataPlatform \
DefaultDriveKitDriverData \
androidDriverDataApi

./scripts/add_to_platform_dart_file.sh \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_platform_interface/lib/flutter_drivekit_driver_data_platform_interface.dart \
./packages/drivekit_driver_data/flutter_drivekit_driver_data_ios/lib/flutter_drivekit_driver_data_ios.dart \
DriveKitDriverDataPlatform \
DefaultDriveKitDriverData \
iosDriverDataApi
