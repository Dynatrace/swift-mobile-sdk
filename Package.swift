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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.331.1.1008/dynatrace-mobile-agent-ios-8.331.1.1008-xcframework.zip",
            checksum: "18e9d1c1434f9e7c94f878e7567509f9c619a0cd37ab7972699ffc7ea98e923c"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.331.1.1008/dynatrace-mobile-agent-ios-8.331.1.1008-replay-xcframework.zip",
            checksum: "2701a41b0f9f20e059b1906cb192394ef9ea55f7062787f23d391ae8aa74f9b5"
        ),
    ]
)
