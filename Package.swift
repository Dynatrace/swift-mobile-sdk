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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.349.1.1007/dynatrace-mobile-agent-ios-8.349.1.1007-xcframework.zip",
            checksum: "ad0f2a7e890e2cf533787e1a31734299834a7614bf02d45367ad79c5dd6d3924"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.349.1.1007/dynatrace-mobile-agent-ios-8.349.1.1007-replay-xcframework.zip",
            checksum: "bef6b5199ccfb105ce5016c7f298be120332d8515707e8d122947e6a8249faff"
        ),
    ]
)
