// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Invoice",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Invoice", targets: ["Invoice"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../Categories"),
        .package(path: "../Scanner")
    ],
    targets: [
        .target(
            name: "Invoice", dependencies: ["DesignSystem", "Categories", "Scanner"]
        ),
        .testTarget(name: "InvoiceTests", dependencies: ["Invoice"])
    ]
)
