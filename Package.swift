// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Dynatrace",
            targets: ["Dynatrace-Dynamic"]),
        .library(
            name: "Dynatrace-Static",
            targets: ["Dynatrace-Static"]),
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.297.1.1004/dynatrace-mobile-agent-ios-8.297.1.1004-xcframework.zip",
            checksum: "6bc9c4621b04760e1f6f3cd11361f6091e2c736014f9885f3cc95e6fd0a56c2d"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.297.1.1004/dynatrace-mobile-agent-ios-8.297.1.1004-xcframework-static.zip",
            checksum: "693b7455a4ff4695fa541fb35e0d6b5479445dae58baf0c4a9242da650c73014"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.297.1.1004/dynatrace-mobile-agent-ios-8.297.1.1004-replay-xcframework.zip",
            checksum: "ab1c2e484e4554458c99f79be2195605c16c05e55f9e6c18670e7f85753e0b8c"
        ),
    ]
)
