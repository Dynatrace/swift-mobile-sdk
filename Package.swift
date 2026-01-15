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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.329.1.1017/dynatrace-mobile-agent-ios-8.329.1.1017-xcframework.zip",
            checksum: "d6d693f48994225b9252ee13aef7932be0374bce7fe691dd6c2c5588cefb4562"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.329.1.1017/dynatrace-mobile-agent-ios-8.329.1.1017-replay-xcframework.zip",
            checksum: "27e79cbadb8cf7229ee990d4d266c7ee2f75b1f2aaf019322a01ea8da1d80ac1"
        ),
    ]
)
