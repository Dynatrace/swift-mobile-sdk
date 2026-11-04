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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.349.3.1010/dynatrace-mobile-agent-ios-8.349.3.1010-xcframework.zip",
            checksum: "bad72f0bff596af0301e6084f39b26164c8fc599415969562d07e745bb597cca"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.349.3.1010/dynatrace-mobile-agent-ios-8.349.3.1010-replay-xcframework.zip",
            checksum: "bef6b5199ccfb105ce5016c7f298be120332d8515707e8d122947e6a8249faff"
        ),
    ]
)
