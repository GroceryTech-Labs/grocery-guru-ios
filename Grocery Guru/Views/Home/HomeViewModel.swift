import SwiftUI

@Observable
final class HomeViewModel {
    @ObservationIgnored let itemRepository: LocalStorageItemRepository
    @ObservationIgnored let categoryRepository: LocalStorageCategoryRepository

    @MainActor
    init(itemRepository: LocalStorageItemRepository, categoryRepository: LocalStorageCategoryRepository) {
        self.itemRepository = itemRepository
        self.categoryRepository = categoryRepository
    }
}
