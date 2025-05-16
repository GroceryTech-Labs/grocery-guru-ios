import Foundation

public struct UIProductItem: Hashable, Equatable, Identifiable, Sendable {
    public let id = UUID()
    public let code: String?
    public let productName: String?
    public let nutriments: UINutrimentsItem
}

extension UIProductItem {
    public init(from apiItem: APIProductItem) {
        code = apiItem.code
        productName = apiItem.productName
        nutriments = UINutrimentsItem(from: apiItem.nutriments)
    }
}
