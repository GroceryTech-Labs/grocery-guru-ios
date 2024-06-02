import SwiftUI

@Observable
class HomeViewModel {
    let repository: InvoiceItemRepository
    var items: [InvoiceItem] = []

    var error: Error?

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
