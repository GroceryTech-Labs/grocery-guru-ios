// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Scanner",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Scanner", targets: ["Scanner"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../OpenFoodFacts"),
        .package(path: "../Cross-Cutting"),
        .package(url: "https://github.com/twostraws/CodeScanner.git", from: "2.5.0")
    ],
    targets: [
        .target(
            name: "Scanner", dependencies: ["DesignSystem", "OpenFoodFacts", "Cross-Cutting", "CodeScanner"]
        ),
        .testTarget(name: "ScannerTests", dependencies: ["Scanner"])
    ]
)
