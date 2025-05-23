import Foundation
import SwiftData
import Categories

@MainActor
public protocol InvoiceRepository: Sendable {
    func fetchInvoices() async throws -> [UIInvoiceItem]
    func addInvoice(
        code: String?,
        name: String,
        amount: Int,
        category: UICategoryItem,
        measureUnit: String
    ) async throws
    func deleteInvoice(_ invoice: UIInvoiceItem) async
}
