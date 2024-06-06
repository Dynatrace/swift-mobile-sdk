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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.293.1.1003/dynatrace-mobile-agent-ios-8.293.1.1003-xcframework.zip",
            checksum: "3ac9c97c8238752266ef33392160de7b93f75db8f495a486391be9bf1c9499bb"
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.293.1.1003/dynatrace-mobile-agent-ios-8.293.1.1003-xcframework-static.zip",
            checksum: "d3d53cd2b36d9cb8f26c89495f1743d363e3324e1db3d73d9be02cdd9eae2c8a"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.293.1.1003/dynatrace-mobile-agent-ios-8.293.1.1003-replay-xcframework.zip",
            checksum: "8512ad9ad654b978bd8b7894a89f857803432fe663b98d66482e04924ae097de"
        ),
    ]
)
