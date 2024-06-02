import Foundation
import SwiftData

protocol InvoiceItemRepository {
    /// Get all invoice items from the repository.
    func fetchAllItems() async throws -> [InvoiceItem]

    /// Add an invoice item to the repository.
    func addItem(_ item: InvoiceItem)

    /// Remove invoice item from the repository.
    func deleteItem(_ item: InvoiceItem)
}
