import SwiftUI
import LocalStorage

@Observable @MainActor
class CategoryCardListViewModel {
    let repository: CategoryRepository

    var customCategories: [CustomCategory] = []
    var categories: [BaseCategory] {
        BaseCategory.allCases + customCategories.map { category in
            BaseCategory.custom(
                name: category.name,
                emoji: category.emoji
            )
        }
    }

    init(repository: CategoryRepository = CategoryRepository()) {
        self.repository = repository
    }

    func fetchCategories() async {
        do {
            let result = try await repository.fetch()
            customCategories = result
        } catch {
            print(error)
        }
    }
}
