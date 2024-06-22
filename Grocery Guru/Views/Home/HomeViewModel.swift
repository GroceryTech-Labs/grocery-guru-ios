import SwiftUI

@Observable
final class HomeViewModel {
    @ObservationIgnored let itemRepository: ItemLocalStorageRepository
    @ObservationIgnored let categoryRepository: CategoryLocalStorageRepository

    @MainActor
    init(
        itemRepository: ItemLocalStorageRepository,
        categoryRepository: CategoryLocalStorageRepository
    ) {
        self.itemRepository = itemRepository
        self.categoryRepository = categoryRepository
    }
}
