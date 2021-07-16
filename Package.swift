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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.221.1.1003/dynatrace-mobile-agent-ios-8.221.1.1003-xcframework.zip",
            checksum: "fe39e4a0c6a949829287e9684fbee133810e3c2a3312203e46858021efefee34"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.221.1.1003/dynatrace-mobile-agent-ios-8.221.1.1003-replay-xcframework.zip",
            checksum: "3ff196c8b7cbf6ee50e3cd5afef7fe0a822783ec049300b5da81ec17bbc50724"
        ),
    ]
)
