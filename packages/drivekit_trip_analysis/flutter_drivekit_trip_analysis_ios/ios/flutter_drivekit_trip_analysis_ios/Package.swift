// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_drivekit_trip_analysis_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "flutter-drivekit-trip-analysis-ios", targets: ["flutter_drivekit_trip_analysis_ios"])
    ],
    dependencies: [
        .package(url: "https://github.com/DriveQuantPublic/drivekit-sdk-spm.git",
                 exact: "2.23.0")
    ],
    targets: [
        .target(
            name: "flutter_drivekit_trip_analysis_ios",
            dependencies: [
                .product(name: "DriveKitTripAnalysis", package: "drivekit-sdk-spm")
            ],
            resources: [
            ]
        )
    ]
)
