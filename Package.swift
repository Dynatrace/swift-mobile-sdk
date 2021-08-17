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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.223.1.1006/dynatrace-mobile-agent-ios-8.223.1.1006-xcframework.zip",
            checksum: "8c24cb0f282398690a47f6f0a2044f643d7712111532c5e7f665a7a4738eb525"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.223.1.1006/dynatrace-mobile-agent-ios-8.223.1.1006-replay-xcframework.zip",
            checksum: "fcaa43d17a3c5ee88cc210184a1c05366a9863f230a5bce32e2a450d5cebdd53"
        ),
    ]
)
