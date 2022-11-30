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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.255.1.1006/dynatrace-mobile-agent-ios-8.255.1.1006-xcframework.zip",
            checksum: "fa2a64f06cd465f84684e16290110bded0e8c91d5a14af1092ea67c75c180cc9"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.255.1.1006/dynatrace-mobile-agent-ios-8.255.1.1006-xcframework-static.zip",
            checksum: "a30323075c7554b4ecb678213315164b2f0545f20751c48f92b853866a9d708f"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.255.1.1006/dynatrace-mobile-agent-ios-8.255.1.1006-replay-xcframework.zip",
            checksum: "2adae6689ec981e30e8531f1710a940ba1ef37fbb614a76ac70b28268842611f"
        ),
    ]
)
