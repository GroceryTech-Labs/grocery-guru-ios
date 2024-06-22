import Foundation
import SwiftData

class LocalStorageItemRepository: SwiftDataRepository {
    @MainActor static var shared = LocalStorageItemRepository()

    var modelContext: ModelContext
    var modelContainer: ModelContainer

    // swiftlint:disable force_try
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: InvoiceItem.self)
        self.modelContext = modelContainer.mainContext
    }
    // swiftlint:enable force_try

    func fetchAllItems() async throws -> [InvoiceItem] {
        do {
            return try modelContext.fetch(FetchDescriptor<InvoiceItem>())
        } catch {
            throw RepositoryError.fetch
        }
    }

    func addItem(_ item: InvoiceItem) throws {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            throw RepositoryError.adding
        }
    }

    func deleteItem(_ item: InvoiceItem) {
        modelContext.delete(item)
    }
}
