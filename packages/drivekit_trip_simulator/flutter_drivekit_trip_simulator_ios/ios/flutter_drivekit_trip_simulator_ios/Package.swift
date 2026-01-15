// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_drivekit_trip_simulator_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "flutter-drivekit-trip-simulator-ios", targets: ["flutter_drivekit_trip_simulator_ios"])
    ],
    dependencies: [
        .package(url: "https://github.com/DriveQuantPublic/drivekit-sdk-spm.git",
                 exact: "2.25.0")
    ],
    targets: [
        .target(
            name: "flutter_drivekit_trip_simulator_ios",
            dependencies: [
                .product(name: "DriveKitTripSimulator", package: "drivekit-sdk-spm")
            ],
            resources: [
            ]
        )
    ]
)
