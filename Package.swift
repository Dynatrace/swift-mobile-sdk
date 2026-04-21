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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.337.1.1003/dynatrace-mobile-agent-ios-8.337.1.1003-xcframework.zip",
            checksum: "61967b948087224975d5d4416030272e0eafb25c15d15da22247fbff4e0d4812"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.337.1.1003/dynatrace-mobile-agent-ios-8.337.1.1003-replay-xcframework.zip",
            checksum: "58c1ddb1b4e115158d65da7394df468b92326c8157b010aee2fa82b9be343bb1"
        ),
    ]
)
