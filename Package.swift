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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.235.1.1015/dynatrace-mobile-agent-ios-8.235.1.1015-xcframework.zip",
            checksum: "1733a3e2bcb4f8e70abfdb99601f7a1f656e05dad505b988128e533ee71231eb"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++"), .unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.235.1.1015/dynatrace-mobile-agent-ios-8.235.1.1015-xcframework-static.zip",
            checksum: "1721ecf695342e3697219b7f1eb89f5840ea35c823bd8d09873c658d226261d1"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.235.1.1015/dynatrace-mobile-agent-ios-8.235.1.1015-replay-xcframework.zip",
            checksum: "622e029656f3072a491506512f7fdacba446084d6b340bad93d94ec7cacc52f9"
        ),
    ]
)
