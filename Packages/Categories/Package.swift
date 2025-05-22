// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Categories",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Categories", targets: ["Categories"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
    ],
    targets: [
        .target(name: "Categories", dependencies: ["DesignSystem"]),
        .testTarget(name: "CategoriesTests", dependencies: ["Categories"])
    ]
)
