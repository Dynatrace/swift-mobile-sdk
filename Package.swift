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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.243.1.1010/dynatrace-mobile-agent-ios-8.243.1.1010-xcframework.zip",
            checksum: "c3f4167e2316c293a076f62ffdd2b84644e30bd86facf3a1a4101e441d8d4167"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.243.1.1010/dynatrace-mobile-agent-ios-8.243.1.1010-xcframework-static.zip",
            checksum: "5017f948df41da5d0f6247a52df71ce9db83f8a09b874e20e7a8f63d6143e24a"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.243.1.1010/dynatrace-mobile-agent-ios-8.243.1.1010-replay-xcframework.zip",
            checksum: "ce261effefcc0c31026d18a0e7e3260a708f855ce6b277d6e93a0ec244ee6e46"
        ),
    ]
)
