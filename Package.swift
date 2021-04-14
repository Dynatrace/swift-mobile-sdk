// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v9), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Dynatrace",
            targets: ["Dynatrace"]),
        .library(
            name: "DynatraceSessionReplay",
            targets: ["Dynatrace", "DynatraceSessionReplay"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Dynatrace",
            url: "$dynatrace-ios-xcframework-zip",
            checksum: "$dynatrace-ios-xcframework-checksum"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "$dynatrace-ios-sessionreplay-xcframework-zip",
            checksum: "$dynatrace-ios-sessionreplay-xcframework-checksum"
        ),
    ]
)
