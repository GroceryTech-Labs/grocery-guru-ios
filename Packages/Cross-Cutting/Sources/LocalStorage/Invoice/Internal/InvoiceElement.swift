import Foundation
import SwiftData
import Invoice
import Categories

@Model
class InvoiceElement: @unchecked Sendable {
    @Attribute(.unique) var id: UUID
    var code: String?
    var name: String
    var amount: Int
    var measureUnit: MeasureUnit
    var category: CategoryElement

    public init(
        id: UUID = UUID(),
        code: String? = nil,
        name: String,
        amount: Int,
        measureUnit: MeasureUnit,
        category: CategoryElement
    ) {
        self.id = id
        self.code = code
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
    }
}
