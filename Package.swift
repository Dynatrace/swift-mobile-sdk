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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.217.1.1003/dynatrace-mobile-agent-ios-8.217.1.1003-xcframework.zip",
            checksum: "6017f0d1e17c45e6cc0a7921a7f5dcc781e1a079bd6e896de899a75bf2b7d7b1"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.217.1.1003/dynatrace-mobile-agent-ios-8.217.1.1003-replay-xcframework.zip",
            checksum: "97d4aa8fb5f59e0c79afbdf9dedfde948cf3a900af42bcb9ca9dd8a3851a239e"
        ),
    ]
)
