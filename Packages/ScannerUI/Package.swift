// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ScannerUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ScannerUI", targets: ["ScannerUI"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../OpenFoodFacts"),
        .package(url: "https://github.com/twostraws/CodeScanner.git", from: "2.5.0")
    ],
    targets: [
        .target(
            name: "ScannerUI", dependencies: ["DesignSystem", "OpenFoodFacts", "CodeScanner"]
        )
    ]
)
