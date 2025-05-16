import Foundation

public struct APIProductItem: Sendable {
    public let code: String?
    public let productName: String?
    public let nutriments: APINutrimentsItem

    public init(code: String?, productName: String?, nutriments: APINutrimentsItem) {
        self.code = code
        self.productName = productName
        self.nutriments = nutriments
    }
}
