import Foundation
import Categories
import SwiftData

@MainActor
public class CategoryRepositoryImpl: CategoryRepository {
    public var categories: [Categories.UICategoryItem] = []

    private let repository: any SwiftDataRepository<CategoryElement>

    public init() {
        self.repository = SwiftDataRepositoryImpl<CategoryElement>()
    }
}

// MARK: fetchCategories()
extension CategoryRepositoryImpl {
    public func fetchCategories() async throws -> [UICategoryItem] {
        do {
            let response = try await repository.fetch()
            let customCategories = response.map {
                UICategoryItem(categoryName: $0.categoryName, emoji: $0.emoji)
            }
            let baseCategories = BaseCategory.allCases.map {
                UICategoryItem(categoryName: $0.name, emoji: $0.emoji)
            }
            return baseCategories + customCategories
        } catch {
            throw error
        }
    }
}

// MARK: addCategory()
extension CategoryRepositoryImpl {
    public func addCategory(name: String, emoji: String) async throws {
        do {
            try await repository.add(CategoryElement(categoryName: name, emoji: emoji))
        } catch {
            throw SwiftDataError.adding
        }
    }
}

// MARK: deleteCategory()
extension CategoryRepositoryImpl {
    public func deleteCategory(_ category: UICategoryItem) async {
        let element = CategoryElement(
            categoryName: category.categoryName,
            emoji: category.emoji
        )

        await repository.delete(element)
    }
}
