import SwiftUI

@Observable
class CategoryCreationViewModel {
    @ObservationIgnored private let repository: CategoryRepository

    var name: String = ""
    var emoji: String = ""

    @MainActor
    init(repository: any CategoryRepository) {
        self.repository = repository
    }

    func resetToInitialState() {
        name = ""
        emoji = ""
    }

    @MainActor
    func addCategory() async {
        do {
            try await repository.addCategory(
                name: name,
                emoji: emoji
            )
        } catch {
            print(error.localizedDescription)
        }
    }
}
