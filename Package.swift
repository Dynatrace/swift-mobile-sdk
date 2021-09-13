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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.225.1.1015/dynatrace-mobile-agent-ios-8.225.1.1015-xcframework.zip",
            checksum: "038c29d38cae8eedf9a8bd73d6aaaa0a39a0fffe2d9e5920405ae6b240a671ff"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.225.1.1015/dynatrace-mobile-agent-ios-8.225.1.1015-replay-xcframework.zip",
            checksum: "e76f021ff91b8c4e47bb4df4770417971a2ab1db6a4a4ce3e167fc48eb05a6ff"
        ),
    ]
)
