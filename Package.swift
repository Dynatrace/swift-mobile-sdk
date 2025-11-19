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
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.327.1.1020/dynatrace-mobile-agent-ios-8.327.1.1020-xcframework.zip",
            checksum: "5bc56a15fc8cfe63b1c24b9f4c8f20b93ae93f9cfd98f3710e9e1dda18a952a9"
        ),
        .binaryTarget(
            name: "DynatraceSessionReplay",
            url: "https://mobileagent.downloads.dynatrace.com/ios/8.327.1.1020/dynatrace-mobile-agent-ios-8.327.1.1020-replay-xcframework.zip",
            checksum: "cda8f351f3a5c0a85ddc9299d3590c9faa4914f8ddc7afdc40cffb35059f77df"
        ),
    ]
)
