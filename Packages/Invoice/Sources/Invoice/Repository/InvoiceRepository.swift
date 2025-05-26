import Foundation
import SwiftData
import Categories

@MainActor
public protocol InvoiceRepository: Sendable {
    func fetchInvoices() async throws -> [UIInvoiceItem]
    func fetchInvoicesByCategory(
        _ categoryName: String
    ) async throws -> [UIInvoiceItem]
    func addInvoice(
        code: String?,
        name: String,
        amount: Int,
        measureUnit: MeasureUnit,
        category: UICategoryItem
    ) async throws
    func deleteInvoice(_ invoice: UIInvoiceItem) async
}
