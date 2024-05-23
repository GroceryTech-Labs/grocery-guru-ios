import Foundation
import SwiftData

protocol ItemRepository {
    func fetchAllItems() -> [Item]
    func addItem(_ item: Item)
    func deleteItem(_ item: Item)
}

// MARK: LOCAL STORAGE
final class LocalStorageItemRepository: ItemRepository {
    var items: [Item] = [Item]()
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchAllItems() -> [Item] {
        do {
            let descriptor = FetchDescriptor<Item>()
            items = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
        
        return items
    }
    
    func addItem(_ item: Item) {
        modelContext.insert(item)
    }
    
    func deleteItem(_ item: Item) {
        modelContext.delete(item)
    }
}

// MARK: MOCK STORAGE
final class MockItemRepository: ItemRepository {
    var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    func fetchAllItems() -> [Item] {
        return items
    }
    
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    func updateItem(_ item: Item) {
        guard let index = items.firstIndex(of: item) else {
            return
        }
        
        items[index] = item
    }
    
    func deleteItem(_ item: Item) {
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
                    Item(
                        name: "Cheddar Cheese",
                        amount: 3,
                        category: .milk
                    ),
                count: 10
            )
        )
    }
}
