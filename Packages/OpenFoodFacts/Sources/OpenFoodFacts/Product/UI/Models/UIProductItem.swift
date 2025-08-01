import Foundation

public struct UIProductItem: Hashable, Equatable, Identifiable, Sendable {
    public let id = UUID()
    public let code: String?
    public let productName: String?
    public let productQuantity: String?
    public let productQuantityUnit: String?
    public let nutriments: UINutrimentsItem
}

extension UIProductItem {
    public init(from apiItem: APIProductItem) {
        code = apiItem.code
        productName = apiItem.productName
        productQuantity = apiItem.productQuantity
        productQuantityUnit = apiItem.productQuantityUnit
        nutriments = UINutrimentsItem(from: apiItem.nutriments)
    }
}
