import SwiftUI

@Observable
class HomeViewModel {
    let repository: InvoiceItemRepository
    var items: [InvoiceItem] = []
    
    init(repository: InvoiceItemRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchItems() {
        items = repository.fetchAllItems()
    }
}
