// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynatrace",
    platforms: [
        .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "Dynatrace",
            targets: ["Dynatrace-Dynamic"]),
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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.341.1.1010/dynatrace-mobile-agent-ios-8.341.1.1010-xcframework.zip",
            checksum: "e64d6f4ec3afe61ce6446c46fb84eff560bb7eb2319931b19c885044674153d4"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.341.1.1010/dynatrace-mobile-agent-ios-8.341.1.1010-replay-xcframework.zip",
            checksum: "f3cde3a9456f316fdd096d6b5b94c5b8e0e0210b7bd060c4be29cd99a4d81b83"
        ),
    ]
)
