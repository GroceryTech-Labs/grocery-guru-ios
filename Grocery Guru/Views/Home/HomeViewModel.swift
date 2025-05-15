import SwiftUI

@Observable
final class HomeViewModel {
    @ObservationIgnored let repository: LocalStorageRepository

    @MainActor
    init(
        repository: LocalStorageRepository
    ) {
        self.repository = repository
    }
}
