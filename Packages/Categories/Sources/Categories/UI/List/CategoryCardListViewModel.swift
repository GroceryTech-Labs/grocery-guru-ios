import SwiftUI
import Routing

@Observable @MainActor
public class CategoryCardListViewModel {
    private let repository: CategoryRepository
    private let navigationService: NavigationService

    var categories: [UICategoryItem] = []

    public init(repository: CategoryRepository, navigationService: NavigationService = .shared) {
        self.repository = repository
        self.navigationService = navigationService
    }

    func fetchCategories() async {
        do {
            let result = try await repository.fetchCategories()
            categories = result
        } catch {
            print(error)
        }
    }

    func navigateToCategoryDetails(category: UICategoryItem) {
        navigationService.push(.invoiceList)
    }
}
