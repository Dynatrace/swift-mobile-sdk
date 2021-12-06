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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.231.1.1009/dynatrace-mobile-agent-ios-8.231.1.1009-xcframework.zip",
            checksum: "48a9294ff0f308dbc933af7b79a5f89c0a32f29d5fce4e24b1ad8edca3ad844b"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++"), .unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.231.1.1009/dynatrace-mobile-agent-ios-8.231.1.1009-xcframework-static.zip",
            checksum: "a577e51375d1cb93133d40d27ecd66965d03f45f440cd77b62292dd4ec9f3da6"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.231.1.1009/dynatrace-mobile-agent-ios-8.231.1.1009-replay-xcframework.zip",
            checksum: "df6fdf2b96aa36f2200f1ac2312c161adfbc820f806daa4d0110854bd99c8bcd"
        ),
    ]
)
