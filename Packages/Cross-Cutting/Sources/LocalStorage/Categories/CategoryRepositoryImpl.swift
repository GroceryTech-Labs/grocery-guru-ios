import Foundation
import Categories
import SwiftData

@MainActor
public class CategoryRepositoryImpl: CategoryRepository {
    private let repository: any SwiftDataRepository<CategoryElement>

    public init() {
        self.repository = SwiftDataRepositoryImpl<CategoryElement>()
    }

    public func fetchCategories() async throws -> [UICategoryItem] {
        do {
            let response = try await repository.fetch()
            return response.map {
                UICategoryItem(categoryName: $0.categoryName, emoji: $0.emoji)
            }
        } catch {
            throw error
        }
    }

    public func addCategory(name: String, emoji: String) async throws {
        do {
            try await repository.add(CategoryElement(categoryName: name, emoji: emoji))
        } catch {
            throw SwiftDataError.adding
        }
    }

    public func deleteCategory(_ category: UICategoryItem) async {
        let element = CategoryElement(
            categoryName: category.categoryName,
            emoji: category.emoji
        )

        await repository.delete(element)
    }
}
