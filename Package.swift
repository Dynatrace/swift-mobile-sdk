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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.241.1.1013/dynatrace-mobile-agent-ios-8.241.1.1013-xcframework.zip",
            checksum: "cba8f0ddd37738321b18399f3033fa02c87a5dcbf5a2464ebbcf5ceb6a53eef3"
        ),
        .target( // wrap target to add linker settings
            name: "Dynatrace-Static",
            dependencies: ["DynatraceStatic"],
            linkerSettings: [.linkedLibrary("c++")/*, .unsafeFlags(["-ObjC"])*/]    //security restrictions currently don't allow unsafe flags here, needs to be added to Other Linker Flags manually
            //for more details read https://github.com/apple/swift-evolution/blob/master/proposals/0238-package-manager-build-settings.md#unsafe-flags-all
            //or https://forums.swift.org/t/confused-by-unsafe-flags-being-disallowed-in-dependencies/27359
        ),
        .binaryTarget(
            name: "DynatraceStatic",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.241.1.1013/dynatrace-mobile-agent-ios-8.241.1.1013-xcframework-static.zip",
            checksum: "58dc0de83445ea96545e61e36ca1c4e416d43e5b100c99808703f71e7879d7eb"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.241.1.1013/dynatrace-mobile-agent-ios-8.241.1.1013-replay-xcframework.zip",
            checksum: "9dd7ca8a54ea9eb1acd19465a2ae59436e411f9b939a28dc07202b4c98ba2b3c"
        ),
    ]
)
