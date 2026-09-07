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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.347.1.1004/dynatrace-mobile-agent-ios-8.347.1.1004-xcframework.zip",
            checksum: "797a711af5c8f22c50331f0262d932a9b3bbc2df467c949633e941c381d7186f"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.347.1.1004/dynatrace-mobile-agent-ios-8.347.1.1004-replay-xcframework.zip",
            checksum: "7d033feefab925133838fd2091198de6fb8a0d2ac3d9c70a65df8d9cdaa5a82f"
        ),
    ]
)
