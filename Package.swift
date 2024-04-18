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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.289.1.1015/dynatrace-mobile-agent-ios-8.289.1.1015-xcframework.zip",
            checksum: "4a1fa56da6f1b4d29b33ef68c1074117a4005f8883f7a6bc90540b37944bc9ab"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.289.1.1015/dynatrace-mobile-agent-ios-8.289.1.1015-xcframework-static.zip",
            checksum: "5df004d43527e9df7b912bc150c6693962963fcda71b8cc7c018f6b8f1cc2409"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.289.1.1015/dynatrace-mobile-agent-ios-8.289.1.1015-replay-xcframework.zip",
            checksum: "a0861a0737b4bbe6a83e77dc87bf678b05af7fb65fa966faef01abd063e23a97"
        ),
    ]
)
