import SwiftUI
import Routing

@Observable @MainActor
public class CategoryCardListViewModel {
    private let repository: CategoryRepository

    var categories: [UICategoryItem] = []

    public init(repository: CategoryRepository) {
        self.repository = repository
    }

    func fetchCategories() async {
        do {
            let result = try await repository.fetchCategories()
            categories = result
        } catch {
            print(error)
        }
    }
}
