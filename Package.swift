// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.3.3"
let checksum = "b66aa05a1401f306942dcbe4307bb70432702018e530ceb213eae5e4317bfe4b"

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
