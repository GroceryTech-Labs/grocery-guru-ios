import SwiftUI
import Routing

@Observable @MainActor
public class CategoryCardListViewModel {
    private let repository: CategoryRepository

    var customCategories: [UICategoryItem] = []
    var categories: [BaseCategory] {
        BaseCategory.allCases + customCategories.map { category in
            BaseCategory.custom(
                name: category.categoryName,
                emoji: category.emoji
            )
        }
    }

    public init(repository: CategoryRepository) {
        self.repository = repository
    }

    func fetchCategories() async {
        do {
            let data = try await repository.fetchCategories()
            customCategories = data
        } catch {
            print(error)
        }
    }

    func navigateToCategoryDetails(category: BaseCategory) {
        NavigationService.shared.push(.invoiceList)
    }
}
