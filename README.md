# Swift Package - Dynatrace OneAgent for Mobile

## Supported Platforms
* iOS 9+
* tvOS 11+

## Adding to Xcode
* *Xcode* → *File* → *Swift Packages* → *Add Package Dependency...*
* Use `https://github.com/Dynatrace/swift-mobile-sdk.git` to add the Dynatrace package repository.
* Select the desired product (`Dynatrace` or `DynatraceSessionReplay`).
* To update the package version rule double-click the `Dynatrace` entry in the *Swift Packages* tab of the Xcode project settings.
* To update the product selection you have to remove the package and add it again (as of Xcode 12 there is no edit feature for Swift packages).

## Updating
* *Xcode* → *File* → *Swift Packages* → *Update to Latest Package Versions*

## Products

### Dynatrace
This adds Dynatrace OneAgent SDK for iOS for automatic mobile app instrumentation.

### Dynatrace-Static
This adds OneAgent SDK for iOS for automatic mobile app instrumentation as static XCFramework. Due to some Swift Package Manager limitations `-ObjC` must be added manually to _Other Linker Flags_ in the according Xcode project target settings to correctly link this static XCFramework.

### DynatraceSessionReplay
This adds Session Replay module for replay on crash. This product includes Dynatrace OneAgent for Mobile and is not available for tvOS.

## Configuration
Follow the configuration setup for instrumenting mobile apps from the Dynatrace UI:

* update `Info.plist` or provide a configuration dictionary for agent startup
* configure the data privacy

## License
* [Terms of use](https://www.dynatrace.com/company/trust-center/terms-of-use/)

## Dynatrace Help
* [Dynatrace Help - Mobile OneAgent for iOS](https://www.dynatrace.com/support/help/shortlink/ios-hub)
