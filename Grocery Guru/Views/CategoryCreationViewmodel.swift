import SwiftUI

@Observable
class CategoryCreationViewModel {
    @ObservationIgnored private let repository: LocalStorageRepository

    private var navigator = NavigationService.shared

    var name: String = ""
    var emoji: Emoji = .bakery

    @MainActor
    init(repository: LocalStorageRepository) {
        self.repository = repository
    }

    func addCategory() {
        do {
            try repository.addCategory(
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
