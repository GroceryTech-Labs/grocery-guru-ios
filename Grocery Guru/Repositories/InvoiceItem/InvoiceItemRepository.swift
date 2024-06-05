import Foundation
import SwiftData

protocol InvoiceItemRepository {
    var modelContext: ModelContext { get }
    var modelContainer: ModelContainer { get }

    /// Get all invoice items from the repository.
    func fetchAllItems() async throws -> [InvoiceItem]

    /// Add an invoice item to the repository.
    func addItem(_ item: InvoiceItem) throws

    /// Remove invoice item from the repository.
    func deleteItem(_ item: InvoiceItem)
}
