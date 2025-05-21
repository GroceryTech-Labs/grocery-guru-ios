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
        .package(path: "../LocalStorage")
    ],
    targets: [
        .target(name: "Categories", dependencies: ["DesignSystem", "LocalStorage"]),
        .testTarget(name: "CategoriesTests", dependencies: ["Categories"])
    ]
)
