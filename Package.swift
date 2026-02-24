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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.333.1.1005/dynatrace-mobile-agent-ios-8.333.1.1005-xcframework.zip",
            checksum: "a8758c4bc37fcd7e5c8023af60ee7f65d61d4987a30437885343933ec1f6f8d0"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.333.1.1005/dynatrace-mobile-agent-ios-8.333.1.1005-replay-xcframework.zip",
            checksum: "02059676d7972f907b3d0205213395f5de9a05b80459a7628a3de738cd9d4f08"
        ),
    ]
)
