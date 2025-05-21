import SwiftUI
import LocalStorage

@Observable
class CategoryCreationViewModel {
    @ObservationIgnored private let repository: CategoryRepository

    var name: String = ""
    var emoji: String = ""

    @MainActor
    init(repository: CategoryRepository = CategoryRepository()) {
        self.repository = repository
    }

    func resetToInitialState() {
        name = ""
        emoji = ""
    }

    @MainActor
    func addCategory() async {
        do {
            try await repository.add(
                CustomCategory(
                    name: name,
                    emoji: emoji
                )
            )
        } catch {
            print(error.localizedDescription)
        }
    }
}
