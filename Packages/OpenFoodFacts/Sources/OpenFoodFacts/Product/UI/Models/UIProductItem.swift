import Foundation

public struct UIProductItem: Hashable, Equatable, Identifiable, Sendable {
    public let id = UUID()
    public let productName: String?
    public let nutriments: UINutrimentsItem
}

extension UIProductItem {
    public init(from apiItem: APIProductItem) {
        productName = apiItem.productName
        nutriments = UINutrimentsItem(from: apiItem.nutriments)
    }
}
