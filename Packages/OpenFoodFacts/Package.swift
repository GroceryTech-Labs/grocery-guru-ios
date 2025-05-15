// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "OpenFoodFacts",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "OpenFoodFacts", targets: ["OpenFoodFacts"])
    ],
    dependencies: [
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "OpenFoodFacts",
            dependencies: ["DesignSystem"],
            resources: [
                .process("Product/Resources")
            ]
        ),
        .testTarget(name: "OpenFoodFactsTests", dependencies: ["OpenFoodFacts"])
    ]
)
