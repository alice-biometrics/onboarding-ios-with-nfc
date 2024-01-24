// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.2.0"
let checksum = "2210161ac2033d7eb7ae82ca79c07ad7714efd199611b789e66faad40aa3e0d6"

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
