import Foundation
import SwiftData


struct ShoppingTrip: Hashable {
    var date: Date
    var items: [InvoiceItem]

    init(date: Date, items: [InvoiceItem]) {
        self.date = date
        self.items = items
    }
}
