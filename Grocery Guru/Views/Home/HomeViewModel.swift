import SwiftUI

@Observable
final class HomeViewModel {
    @ObservationIgnored private let repository: InvoiceItemRepository

    var items: [InvoiceItem] = []

    var error: Error?

    @MainActor
    init(repository: InvoiceItemRepository) {
        self.repository = repository
    }

    @MainActor
    func fetchItems() async {
        error = nil

        do {
            items = try await repository.fetchAllItems()
        } catch {
            self.error = error
        }
    }
}
