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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.323.1.1009/dynatrace-mobile-agent-ios-8.323.1.1009-xcframework.zip",
            checksum: "0979e2cf5f1b204a7e8af422fdd7c16a57a9757216311a58b08e3da1a961e3e2"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.323.1.1009/dynatrace-mobile-agent-ios-8.323.1.1009-replay-xcframework.zip",
            checksum: "ffa2be2621c578a196bd363c8bdc5ea75d72afc51b7f94482f9144b1b1b0be0d"
        ),
    ]
)
