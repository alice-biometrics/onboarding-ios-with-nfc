// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.2.0"
let checksum = "0d312c3ccde2671579a760197e8d2b6c98c205a41bb9cb89c387c4db2495582e"

let package = Package(
    name: "AliceOnboardingWithNFC",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "AliceOnboardingWithNFC",
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
                "AliceOnboardingWithNFC",
                .product(name: "OpenSSL", package: "OpenSSL")
              ]
           ),
        .binaryTarget(name: "AliceOnboardingWithNFC", 
                      url: "https://storage.googleapis.com/alicebiometrics.com/releases/ios/AliceOnboardingWithNFC-\(version).zip",
                      checksum: "\(checksum)"),
    ]
)
