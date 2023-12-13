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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.279.2.1010/dynatrace-mobile-agent-ios-8.279.2.1010-xcframework.zip",
            checksum: "5bfbec71a6b399725bb378333e2baf26ef7be05b127ecf4bb79941f6e4f2d45d"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.279.2.1010/dynatrace-mobile-agent-ios-8.279.2.1010-xcframework-static.zip",
            checksum: "c66df533fc1d28551ea5fec3a65395c5f9ed2963bdb25724a8f69f730ad4f1f5"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.279.2.1010/dynatrace-mobile-agent-ios-8.279.2.1010-replay-xcframework.zip",
            checksum: "72a4017764a5cbb88be98cab122f7468057200f24fd6423e1461c7932398f77d"
        ),
    ]
)
