// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v9), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Dynatrace",
            targets: ["Dynatrace"]),
        .library(
            name: "DynatraceSessionReplay",
            targets: ["Dynatrace", "DynatraceSessionReplay"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Dynatrace",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.227.1.1019/dynatrace-mobile-agent-ios-8.227.1.1019-xcframework.zip",
            checksum: "7c1917d9512a793338437cf100eac37b750961472d612814e8cdf160e8e89555"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.227.1.1019/dynatrace-mobile-agent-ios-8.227.1.1019-replay-xcframework.zip",
            checksum: "46dd0f19be4ad41d2a11af68186a537991a98f14de0718c1389e2994e7b80db8"
        ),
    ]
)
