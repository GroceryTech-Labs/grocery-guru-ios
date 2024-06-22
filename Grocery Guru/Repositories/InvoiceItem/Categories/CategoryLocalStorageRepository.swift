import Foundation
import SwiftData

class CategoryLocalStorageRepository: SwiftDataRepository {
    @MainActor static var shared = CategoryLocalStorageRepository()

    var modelContext: ModelContext
    var modelContainer: ModelContainer

    // swiftlint:disable force_try
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: CustomCategory.self)
        self.modelContext = modelContainer.mainContext
    }
    // swiftlint:enable force_try

    func fetchAllItems() async throws -> [Item] {
        do {
            return try modelContext.fetch(FetchDescriptor<CustomCategory>())
        } catch {
            throw RepositoryError.fetch
        }
    }

    func addItem(_ item: CustomCategory) throws {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            throw RepositoryError.adding
        }
    }

    func deleteItem(_ item: CustomCategory) {
        modelContext.delete(item)
    }
}
