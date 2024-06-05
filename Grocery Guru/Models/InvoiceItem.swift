import Foundation
import SwiftData

@Model
final class InvoiceItem {
    var name: String
    var amount: Int
    var category: InvoiceItemCategory
    var measureUnit: MeasureUnit

    init(
        name: String,
        amount: Int,
        category: InvoiceItemCategory,
        measureUnit: MeasureUnit
    ) {
        self.name = name
        self.amount = amount
        self.category = category
        self.measureUnit = measureUnit
    }

    deinit { }
}
