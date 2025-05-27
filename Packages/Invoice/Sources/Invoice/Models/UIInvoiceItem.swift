import Foundation
import Categories

public struct UIInvoiceItem: Identifiable, Equatable, Sendable {
    public let id: UUID = UUID()
    public let code: String?
    public let name: String
    public let quantity: Int
    public let unit: String
    public let category: UICategoryItem

    public init(
        code: String? = nil,
        name: String,
        quantity: Int,
        unit: String,
        category: UICategoryItem
    ) {
        self.code = code
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.category = category
    }
}
