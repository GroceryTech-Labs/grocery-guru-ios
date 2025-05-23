import SwiftUI
import Routing

@Observable
class CategoryCreationViewModel {
    @ObservationIgnored private let repository: CategoryRepository
    @ObservationIgnored private let navigationService: NavigationService

    var name: String = ""
    var emoji: String = ""

    @MainActor
    init(repository: any CategoryRepository, navigationService: NavigationService = NavigationService.shared) {
        self.repository = repository
        self.navigationService = navigationService
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
            navigationService.dropToRoot()
        } catch {
            print(error.localizedDescription)
        }
    }
}
