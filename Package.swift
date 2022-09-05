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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.249.1.1007/dynatrace-mobile-agent-ios-8.249.1.1007-xcframework.zip",
            checksum: "aa571bc530680dbe1196ea44d9152d3abfc047c0e479ffb656e47e3e796f6f4b"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.249.1.1007/dynatrace-mobile-agent-ios-8.249.1.1007-xcframework-static.zip",
            checksum: "ccd499d78b58704cabda3e4cc855fcd05c277966456e5a5d48add1f086694497"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.249.1.1007/dynatrace-mobile-agent-ios-8.249.1.1007-replay-xcframework.zip",
            checksum: "2186bd1ec25b7b420b4f4e25220fedb75fc7c6ff2a9f03b9d1ae2814d9a0a4af"
        ),
    ]
)
