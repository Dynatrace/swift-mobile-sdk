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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.339.1.1011/dynatrace-mobile-agent-ios-8.339.1.1011-xcframework.zip",
            checksum: "3fc9918e6f428f4f74538eebdfc73536ff2817d2019a04283b342957451fd767"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.339.1.1011/dynatrace-mobile-agent-ios-8.339.1.1011-replay-xcframework.zip",
            checksum: "5278f015f85a4269758c720824bc32b298331d5b9f6d20524de09e947e66ed8a"
        ),
    ]
)
