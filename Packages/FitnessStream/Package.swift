// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FitnessStream",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.

        .library(
            name: "FitnessStream",
            targets: ["FitnessStream"]),
        .library(
            name: "FitnessStreamUI",
            targets: ["FitnessStreamUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),      
      .package(url: "https://github.com/brightdigit/SundialKit.git", from: "0.2.1"),
      .package(url: "https://github.com/brightdigit/FelinePine", from: "0.1.0-alpha.3")
    ],
    targets: [
        .target(
            name: "FitnessStream",
            dependencies: ["FelinePine"]),
        .target(
            name: "FitnessStreamReporter",
            dependencies: ["FitnessStream"]),
        .target(
            name: "FitnessStreamUI",
            dependencies: ["FitnessStream",  "SundialKit"]),
        .testTarget(
            name: "FitnessStreamTests",
            dependencies: ["FitnessStream"]),
    ]
)
