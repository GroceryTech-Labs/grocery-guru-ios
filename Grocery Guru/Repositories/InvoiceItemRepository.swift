import Foundation
import SwiftData

protocol InvoiceItemRepository {
    func fetchAllItems() -> [InvoiceItem]
    func addItem(_ item: InvoiceItem)
    func deleteItem(_ item: InvoiceItem)
}

// MARK: LOCAL STORAGE
final class LocalStorageItemRepository: InvoiceItemRepository {
    var items: [InvoiceItem] = [InvoiceItem]()
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchAllItems() -> [InvoiceItem] {
        do {
            let descriptor = FetchDescriptor<InvoiceItem>()
            items = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
        
        return items
    }
    
    func addItem(_ item: InvoiceItem) {
        modelContext.insert(item)
    }
    
    func deleteItem(_ item: InvoiceItem) {
        modelContext.delete(item)
    }
}

// MARK: MOCK STORAGE
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
                        category: .milk
                    ),
                count: 10
            )
        )
    }
}
