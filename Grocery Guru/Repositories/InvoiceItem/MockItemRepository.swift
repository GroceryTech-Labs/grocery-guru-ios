import Foundation
import SwiftData

final class MockItemRepository: InvoiceItemRepository {
    static var preview: MockItemRepository {
        let amount = 3
        let count = 10
        return MockItemRepository(
            items: [
                InvoiceItem(
                    name: "Cheddar Cheese",
                    amount: amount,
                    category: .milkEgg
                ),
                InvoiceItem(
                    name: "Cheddar Cheese",
                    amount: amount,
                    category: .milkEgg
                ),
                InvoiceItem(
                    name: "Cheddar Cheese",
                    amount: amount,
                    category: .milkEgg
                ),
                InvoiceItem(
                    name: "Cheddar Cheese",
                    amount: amount,
                    category: .milkEgg
                )
            ]
        )
    }

    var items: [InvoiceItem]

    init(items: [InvoiceItem] = []) {
        self.items = items
    }

    func fetchAllItems() -> [InvoiceItem] {
        print("loop")
        return items
    }

    func addItem(_ item: InvoiceItem) {
        items.append(item)
    }

    func deleteItem(_ item: InvoiceItem) {
        guard let index = items.firstIndex(of: item) else {
            return
        }

        items.remove(at: index)
    }
}
