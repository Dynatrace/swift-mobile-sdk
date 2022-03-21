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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.237.1.1014/dynatrace-mobile-agent-ios-8.237.1.1014-xcframework.zip",
            checksum: "c8e6c2f7a6e0f33c05d9a572739c86b8b18ec367691146255d9d6e054956de37"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++"), .unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.237.1.1014/dynatrace-mobile-agent-ios-8.237.1.1014-xcframework-static.zip",
            checksum: "c7fdd2e0c54b45e5c250b475631d8c5fc141f31468aa0adaf928e6f8bcbcb357"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.237.1.1014/dynatrace-mobile-agent-ios-8.237.1.1014-replay-xcframework.zip",
            checksum: "27063400a751b77de16db5c039fccd34f53d77eed30e266381331813705d67de"
        ),
    ]
)
