import Foundation

public struct APIProductItem: Sendable {
    public let code: String?
    public let productName: String?
    public let productQuantity: String?
    public let productQuantityUnit: String?
    public let nutriments: APINutrimentsItem?

    public init(
        code: String?,
        productName: String?,
        productQuantity: String?,
        productQuantityUnit: String?,
        nutriments: APINutrimentsItem?
    ) {
        self.code = code
        self.productName = productName
        self.productQuantity = productQuantity
        self.productQuantityUnit = productQuantityUnit
        self.nutriments = nutriments
    }
}
