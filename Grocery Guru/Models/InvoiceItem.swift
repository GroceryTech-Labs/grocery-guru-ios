import SwiftUI
import SwiftData

@Model
final class InvoiceItem {
    var name: String
    var amount: Int
    var category: InvoiceItemCategory

    init(name: String, amount: Int, category: InvoiceItemCategory) {
        self.name = name
        self.amount = amount
        self.category = category
    }
}
