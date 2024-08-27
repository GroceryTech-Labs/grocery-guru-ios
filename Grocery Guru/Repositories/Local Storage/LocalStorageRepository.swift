import Foundation
import SwiftData

class LocalStorageRepository: SwiftDataRepository {
    @MainActor static var shared = LocalStorageRepository()

    var modelContext: ModelContext
    var modelContainer: ModelContainer

    // swiftlint:disable force_try
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: InvoiceItem.self, CustomCategory.self)
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

    func fetchAllCategories() async throws -> [CustomCategory] {
        do {
            return try modelContext.fetch(FetchDescriptor<CustomCategory>())
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

    func addCategory(_ category: CustomCategory) throws {
        modelContext.insert(category)
        do {
            try modelContext.save()
        } catch {
            throw RepositoryError.adding
        }
    }

    func deleteItem(_ item: InvoiceItem) {
        modelContext.delete(item)
    }

    func deleteCategory(_ category: CustomCategory) {
        modelContext.delete(category)
    }
}
