// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Cross-Cutting",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "GGAPI", targets: ["GGAPI"]),
        .library(name: "Routing", targets: ["Routing"]),
        .library(name: "LocalStorage", targets: ["LocalStorage"])
    ],
    dependencies: [
        .package(path: "../OpenFoodFacts"),
        .package(path: "../Categories"),
        .package(path: "../Invoice")
    ],
    targets: [
        .target(name: "GGAPI", dependencies: ["OpenFoodFacts"]),
        .target(name: "Routing"),
        .target(name: "LocalStorage", dependencies: ["Categories", "Invoice"]),
        .testTarget(name: "GGAPITests", dependencies: ["GGAPI"]),
        .testTarget(name: "RoutingTests", dependencies: ["Routing"])
    ]
)
