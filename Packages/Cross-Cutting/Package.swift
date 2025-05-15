// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Cross-Cutting",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Cross-Cutting", targets: ["GGAPI"])
    ],
    dependencies: [
        .package(path: "../OpenFoodFacts")
    ],
    targets: [
        .target(name: "GGAPI", dependencies: ["OpenFoodFacts"]),
        .testTarget(name: "GGAPITests", dependencies: ["GGAPI"])
    ]
)
