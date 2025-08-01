import SwiftUI
import Routing

@Observable
public class CategoryCreationViewModel {
    private let repository: CategoryRepository
    private let navigationService: NavigationService

    var name: String = ""
    var emoji: String = ""

    @MainActor
    public init(repository: any CategoryRepository, navigationService: NavigationService = NavigationService.shared) {
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
        } catch {
            print(error.localizedDescription)
        }
    }
}
