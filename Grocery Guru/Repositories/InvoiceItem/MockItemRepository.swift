import Foundation
import SwiftData

final class MockItemRepository: InvoiceItemRepository {
    var items: [InvoiceItem]

    init(items: [InvoiceItem]) {
        self.items = items
    }

    func fetchAllItems() -> [InvoiceItem] {
        return items
    }

    func addItem(_ item: InvoiceItem) {
        items.append(item)
    }

    func updateItem(_ item: InvoiceItem) {
        guard let index = items.firstIndex(of: item) else {
            return
        }

        items[index] = item
    }

    func deleteItem(_ item: InvoiceItem) {
        guard let index = items.firstIndex(of: item) else {
            return
        }

        items.remove(at: index)
    }
}

extension MockItemRepository {
    static var preview: MockItemRepository {
        return MockItemRepository(
            items: Array(
                repeating:
                    InvoiceItem(
                        name: "Cheddar Cheese",
                        amount: 3,
                        category: .milkEgg
                    ),
                count: 10
            )
        )
    }
}
