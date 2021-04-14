# Swift Package - Dynatrace OneAgent for Mobile

## Supported Platforms
* iOS 9+
* tvOS 11+

## Adding to Xcode
* *Xcode* → *File* → *Swift Packages* → *Add Package Dependency...*
* use `https://github.com/Dynatrace/swift-mobile-sdk.git` to add the Dynatrace package repository
* select the desired product (Dynatrace or DynatraceSessionReplay)
* for updating the product selection you have to remove the package and add it again (as of Xcode 12 there is no edit feature for Swift packages yet)

## Updating
* *Xcode* → *File* → *Swift Packages* → *Update to Latest Package Versions*

## Products

### Dynatrace
This adds the Dynatrace OneAgent for Mobile for automatic mobile app instrumentation.

### DynatraceSessionReplay
This adds the Session Replay module for replay on crash. This product includes the the Dynatrace OneAgent for Mobile.

## License
* [Terms of use](https://www.dynatrace.com/company/trust-center/terms-of-use/)

## Dynatrace Help
* [Dynatrace Help - Mobile OneAgent for iOS](https://www.dynatrace.com/support/help/shortlink/ios-hub)
