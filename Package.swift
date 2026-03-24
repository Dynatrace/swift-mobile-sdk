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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.335.1.1009/dynatrace-mobile-agent-ios-8.335.1.1009-xcframework.zip",
            checksum: "dc8f5035e2f1028752eb0909cbe1960416096927a270f2618cb1fcfecc58f2cc"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.335.1.1009/dynatrace-mobile-agent-ios-8.335.1.1009-replay-xcframework.zip",
            checksum: "782a6433d8b9aa4e1cf27abceff4f76de1a297084c6f4fa0c6309955fc3254eb"
        ),
    ]
)
