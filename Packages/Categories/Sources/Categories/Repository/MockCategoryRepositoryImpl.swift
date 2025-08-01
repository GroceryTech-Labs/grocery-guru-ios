import Foundation

@MainActor
public class MockCategoryRepositoryImpl: CategoryRepository {
    var categories = [
        UICategoryItem(
            categoryName: "Drinks",
            emoji: "🍹",
            invoiceCount: 12
        ),
        UICategoryItem(
            categoryName: "Groceries",
            emoji: "🛒",
            invoiceCount: 8
        )
    ]
}

// MARK: fetchCategories()
extension MockCategoryRepositoryImpl {
    public func fetchCategories() async throws -> [UICategoryItem] {
        return categories
    }
}

// MARK: addCategory()
extension MockCategoryRepositoryImpl {
    public func addCategory(name: String, emoji: String) async throws {
        categories.append(
            UICategoryItem(categoryName: name, emoji: emoji)
        )
    }
}

// MARK: deleteCategory()
extension MockCategoryRepositoryImpl {
    public func deleteCategory(_ category: UICategoryItem) async {
        if let index = categories.firstIndex(of: category) {
            categories.remove(at: index)
        }
    }
}

// MARK: editCategory()
extension MockCategoryRepositoryImpl {
    public func editCategory(_ category: UICategoryItem) async throws {
        return
    }
}
