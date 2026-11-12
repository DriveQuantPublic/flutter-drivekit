// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_drivekit_driver_data_ios",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "flutter-drivekit-driver-data-ios", targets: ["flutter_drivekit_driver_data_ios"])
    ],
    dependencies: [
        .package(url: "https://github.com/DriveQuantPublic/drivekit-sdk-spm.git",
                 exact: "4.0.0-beta1")
    ],
    targets: [
        .target(
            name: "flutter_drivekit_driver_data_ios",
            dependencies: [
                .product(name: "DriveKitDriverData", package: "drivekit-sdk-spm")
            ],
            resources: [
            ]
        )
    ]
)
