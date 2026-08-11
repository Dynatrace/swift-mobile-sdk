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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.345.1.1003/dynatrace-mobile-agent-ios-8.345.1.1003-xcframework.zip",
            checksum: "1a27df408145beef9a60dec03a4853c94fc5ed78ac507eec8a5088dd67907c78"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.345.1.1003/dynatrace-mobile-agent-ios-8.345.1.1003-replay-xcframework.zip",
            checksum: "086e22745509555d56467c0a7af1c649a5457d1f04908818637778222344adfa"
        ),
    ]
)
