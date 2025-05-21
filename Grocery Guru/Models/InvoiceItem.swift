import SwiftData
import Categories

@Model
final class InvoiceItem {
    var code: String?
    var name: String
    var amount: Int
    var category: BaseCategory
    var measureUnit: MeasureUnit

    init(
        code: String? = nil,
        name: String,
        amount: Int,
        category: BaseCategory,
        measureUnit: MeasureUnit
    ) {
        self.code = code
        self.name = name
        self.amount = amount
        self.category = category
        self.measureUnit = measureUnit
    }
}
