import Foundation
import SwiftData

final class LocalStorageItemRepository: InvoiceItemRepository {
    var items = [InvoiceItem]()
    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchAllItems() async throws -> [InvoiceItem] {
        do {
            let descriptor = FetchDescriptor<InvoiceItem>()
            items = try modelContext.fetch(descriptor)
        } catch {
            throw error
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
