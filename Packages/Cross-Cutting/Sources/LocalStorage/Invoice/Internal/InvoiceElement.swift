import Foundation
import SwiftData
import Invoice
import Categories

@Model
class InvoiceElement: @unchecked Sendable {
    @Attribute(.unique) var id: UUID
    var code: String?
    var name: String
    var quantity: Int
    var unit: String
    var category: CategoryElement

    public init(
        id: UUID = UUID(),
        code: String? = nil,
        name: String,
        quantity: Int,
        unit: String,
        category: CategoryElement
    ) {
        self.id = id
        self.code = code
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.category = category
    }
}
