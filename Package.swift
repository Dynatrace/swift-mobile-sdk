// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v15), .tvOS(.v15)
    ],
    products: [
        .library(
            name: "Dynatrace",
            targets: ["Dynatrace-Dynamic"]),
        .library(
            name: "DynatraceSessionReplay",
            targets: ["Dynatrace-Dynamic", "DynatraceSessionReplay"]),
    ],
    targets: [
        .target( // wrap target to avoid Xcode bug (Apple Feedback Assistant issue number FB11833215)
            name: "Dynatrace-Dynamic",
            dependencies: ["Dynatrace"]
        ),
        .binaryTarget(
            name: "Dynatrace",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.351.1.1004/dynatrace-mobile-agent-ios-8.351.1.1004-xcframework.zip",
            checksum: "5dea6f9d3cc54e7914124851bd9e0bc8f89dbecb754f1d65c38e184d1d7a18dc"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.351.1.1004/dynatrace-mobile-agent-ios-8.351.1.1004-replay-xcframework.zip",
            checksum: "35a6b5ef5cd9b18586c9b65ef362a11b11202d1e4b025c655819fabe6db783f0"
        ),
    ]
)
