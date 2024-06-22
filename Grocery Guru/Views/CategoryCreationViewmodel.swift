import SwiftUI

@Observable
class CategoryCreationViewModel {
    @ObservationIgnored private let categoryRepository: CategoryLocalStorageRepository

    private var navigator = NavigationService.shared

    var name: String = ""
    var emoji: Emoji = .bakery

    @MainActor
    init(categoryRepository: CategoryLocalStorageRepository) {
        self.categoryRepository = categoryRepository
    }

    func addCategory() {
        do {
            try categoryRepository.addItem(
                CustomCategory(
                    name: name,
                    emoji: emoji
                )
            )
            navigator.drop()
        } catch {
            print(error.localizedDescription)
        }
    }
}
