// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Categories",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Categories", targets: ["Categories"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../Cross-Cutting")
    ],
    targets: [
        .target(
            name: "Categories",
            dependencies: [
                "DesignSystem",
                .product(name: "Routing", package: "Cross-Cutting")
            ]
        ),
        .testTarget(name: "CategoryTests", dependencies: ["Categories"])
    ]
)
