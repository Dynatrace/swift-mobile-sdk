// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v12), .tvOS(.v12)
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.329.2.1019/dynatrace-mobile-agent-ios-8.329.2.1019-xcframework.zip",
            checksum: "e1ea3a8eaeeee2c385996e718e081f03d73d46ffb7b61d79a1473fc851d04bb2"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.329.2.1019/dynatrace-mobile-agent-ios-8.329.2.1019-replay-xcframework.zip",
            checksum: "27e79cbadb8cf7229ee990d4d266c7ee2f75b1f2aaf019322a01ea8da1d80ac1"
        ),
    ]
)
