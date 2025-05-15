import Foundation
import SwiftData

protocol SwiftDataRepository {
    associatedtype Item

    var modelContext: ModelContext { get }
    var modelContainer: ModelContainer { get }

    /// Get all invoice items from the repository.
    func fetchAllItems() async throws -> [Item]

    /// Add an invoice item to the repository.
    func addItem(_ item: Item) throws

    /// Remove invoice item from the repository.
    func deleteItem(_ item: Item)
}
