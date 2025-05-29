import Foundation
import SwiftData
import Categories

@MainActor
public protocol InvoiceRepository: Sendable {
    func fetchInvoices() async throws -> [UIInvoiceItem]
    func fetchInvoicesByCategory(
        _ categoryId: UUID
    ) async throws -> [UIInvoiceItem]
    func addInvoice(
        code: String?,
        name: String,
        quantity: Int,
        unit: String,
        category: UICategoryItem
    ) async throws
    func deleteInvoice(_ invoice: UIInvoiceItem) async
}
