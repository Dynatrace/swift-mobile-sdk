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
            name: "Dynatrace-Static",
            targets: ["Dynatrace-Static"]),
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.229.1.1004/dynatrace-mobile-agent-ios-8.229.1.1004-xcframework.zip",
            checksum: "81b058db231ca1ed7a48189215072c0af77e8c0b644f769d277d29d831711dde"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++"), .unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.229.1.1004/dynatrace-mobile-agent-ios-8.229.1.1004-xcframework-static.zip",
            checksum: "f084071bdb65cdce45ac3fde75029c5ceeca552d341c984a48da22b1803df983"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.229.1.1004/dynatrace-mobile-agent-ios-8.229.1.1004-replay-xcframework.zip",
            checksum: "bf2453ca4bf4268ce13f63729bcceb02597b604bc8ab0fd5bf4d987670ff9d1b"
        ),
    ]
)
