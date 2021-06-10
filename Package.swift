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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.219.1.1004/dynatrace-mobile-agent-ios-8.219.1.1004-xcframework.zip",
            checksum: "c961274cef0c736de10d2f7d7647f0b2edede222f22240287ecf72f8da3a5a99"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.219.1.1004/dynatrace-mobile-agent-ios-8.219.1.1004-replay-xcframework.zip",
            checksum: "20dd45fdc80cc019c544536b579c980e90daf5c902d0245a0ed2c77e1a46ec08"
        ),
    ]
)
