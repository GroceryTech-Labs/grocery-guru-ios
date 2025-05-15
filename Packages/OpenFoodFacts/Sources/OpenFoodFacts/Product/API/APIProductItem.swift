import Foundation

public struct APIProductItem: Sendable {
    public let productName: String?
    public let nutriments: APINutrimentsItem

    public init(productName: String?, nutriments: APINutrimentsItem) {
        self.productName = productName
        self.nutriments = nutriments
    }
}
