import Foundation
import Categories

public struct UIInvoiceItem: Identifiable, Equatable, Sendable {
    public let id: UUID = UUID()
    public let code: String?
    public let name: String
    public let amount: Int
    public let category: UICategoryItem
    public let measureUnit: MeasureUnit

    public init(
        code: String? = nil,
        name: String,
        amount: Int,
        category: UICategoryItem,
        measureUnit: MeasureUnit
    ) {
        self.code = code
        self.name = name
        self.amount = amount
        self.category = category
        self.measureUnit = measureUnit
    }
}
