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
        .package(url: "https://github.com/twostraws/CodeScanner.git", from: "2.5.0")
    ],
    targets: [
        .target(
            name: "Scanner", dependencies: ["DesignSystem", "OpenFoodFacts", "CodeScanner"]
        ),
        .testTarget(name: "ScannerTests", dependencies: ["Scanner"])
    ]
)
