// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Cross-Cutting",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Cross-Cutting", targets: ["GGAPI", "Routing", "LocalStorage"])
    ],
    dependencies: [
        .package(path: "../OpenFoodFacts"),
        .package(path: "../Categories")
    ],
    targets: [
        .target(name: "GGAPI", dependencies: ["OpenFoodFacts"]),
        .target(name: "Routing"),
        .target(name: "LocalStorage", dependencies: ["Categories"]),
        .testTarget(name: "GGAPITests", dependencies: ["GGAPI"]),
        .testTarget(name: "RoutingTests", dependencies: ["Routing"])
    ]
)
