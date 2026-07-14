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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.343.1.1007/dynatrace-mobile-agent-ios-8.343.1.1007-xcframework.zip",
            checksum: "6b28a336dae71f44c060272cd7c9ca1f89335edd33cd3a5759842cb5e5841de0"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.343.1.1007/dynatrace-mobile-agent-ios-8.343.1.1007-replay-xcframework.zip",
            checksum: "cbf9d5535fef927a755d8b31528bda0d8291921cb531a7b166d4dceb41b22519"
        ),
    ]
)
