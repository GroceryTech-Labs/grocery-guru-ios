import Foundation
import Categories
import SwiftData

@ModelActor
public actor CategoryRepositoryImpl: CategoryRepository {
    // swiftlint:disable force_try
    public init() {
        self.init(modelContainer: try! ModelContainer(for: CategoryElement.self))
    }
    // swiftlint:enable force_try

    public func fetchCategories() async throws -> [UICategoryItem] {
        do {
            let response = try modelContext.fetch(FetchDescriptor<CategoryElement>())
            return response.map {
                UICategoryItem(
                    categoryName: $0.categoryName,
                    emoji: $0.emoji
                )
            }
        } catch {
            throw SwiftDataError.fetch
        }
    }

    public func addCategory(name: String, emoji: String) throws {
        let element = CategoryElement(
            categoryName: name,
            emoji: emoji
        )
        modelContext.insert(element)
        do {
            try modelContext.save()
        } catch {
            throw SwiftDataError.adding
        }
    }

    public func deleteCategory(_ category: UICategoryItem) {
        let element = CategoryElement(
            categoryName: category.categoryName,
            emoji: category.emoji
        )
        modelContext.delete(element)
    }
}
