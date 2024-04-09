// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.2.9"
let checksum = "165097a1b70423ceded6e121972aed779c041f29b88f3e80ffbe1df599bbe6ff"

let package = Package(
    name: "AliceOnboarding",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "AliceOnboarding",
            targets: ["AliceOnboardingBundle"]),
    ],
    dependencies: [
            .package(
                name: "OpenSSL",
                url: "https://github.com/krzyzanowskim/OpenSSL.git",
                .exact("1.1.2000")
            )
    ],
    targets: [
      .target(name: "AliceOnboardingBundle",
            dependencies: [
                "AliceOnboarding",
                .product(name: "OpenSSL", package: "OpenSSL")
              ]
           ),
        .binaryTarget(name: "AliceOnboarding", 
                      url: "https://storage.googleapis.com/alicebiometrics.com/releases/ios/AliceOnboardingWithNFC-\(version).zip",
                      checksum: "\(checksum)"),
    ]
)
