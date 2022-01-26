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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.233.1.1006/dynatrace-mobile-agent-ios-8.233.1.1006-xcframework.zip",
            checksum: "fcc5a066d28c77a21202541f976436c2a49dd0d95108b13417977154b56e1ffe"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++"), .unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.233.1.1006/dynatrace-mobile-agent-ios-8.233.1.1006-xcframework-static.zip",
            checksum: "1e6874f1b6893f1a78f7fe09c7829b685640ba85d39ccbc17277527c8c0e9a0d"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.233.1.1006/dynatrace-mobile-agent-ios-8.233.1.1006-replay-xcframework.zip",
            checksum: "f66682fedad65e36f35f2f7be4f9b3422d300628498642fef0fcb871fa89a54b"
        ),
    ]
)
