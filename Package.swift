// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v11), .tvOS(.v11)
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.325.1.1012/dynatrace-mobile-agent-ios-8.325.1.1012-xcframework.zip",
            checksum: "e87acf1d0c528a7ccb63bb672d3de2b9e1656365daf18a5b3b050cc2894fcdb6"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.325.1.1012/dynatrace-mobile-agent-ios-8.325.1.1012-replay-xcframework.zip",
            checksum: "00d8713626ef52c520aab800dd7ce3d4d436b2cc632fbeca3fa0df7420550ea2"
        ),
    ]
)
