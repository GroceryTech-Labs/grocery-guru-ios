import Foundation
import Categories
import Invoice
import SwiftData

@MainActor
public class InvoiceRepositoryImpl: InvoiceRepository {
    private let repository: any SwiftDataRepository<InvoiceElement>

    public init() {
        self.repository = SwiftDataRepositoryImpl<InvoiceElement>()
    }
}

// MARK: fetchCategories()
extension InvoiceRepositoryImpl {
    public func fetchInvoices() async throws -> [UIInvoiceItem] {
        do {
            let response = try await repository.fetch()
            return response
                .map { convert($0) }
        } catch {
            throw error
        }
    }

    public func fetchInvoicesByCategory(_ categoryId: UUID) async throws -> [UIInvoiceItem] {
        do {
            let response = try await repository.fetch(
                descriptor: FetchDescriptor<InvoiceElement>(
                    predicate: #Predicate {
                        $0.category.id == categoryId
                    }
                )
            )
            return response
                .map { convert($0) }
        } catch {
            throw error
        }
    }

    func convert(_ invoice: InvoiceElement) -> UIInvoiceItem {
        UIInvoiceItem(
            code: invoice.code,
            name: invoice.name,
            quantity: invoice.quantity,
            unit: invoice.unit,
            category: UICategoryItem(
                id: invoice.category.id,
                categoryName: invoice.category.categoryName,
                emoji: invoice.category.emoji,
                invoiceCount: invoice.category.invoices.count
            )
        )
    }
}

// MARK: addCategory()
extension InvoiceRepositoryImpl {
    public func addInvoice(
        code: String?,
        name: String,
        quantity: Int,
        unit: String,
        category: UICategoryItem
    ) async throws {
        do {
            try await repository.add(
                InvoiceElement(
                    code: code,
                    name: name,
                    quantity: quantity,
                    unit: unit,
                    category: CategoryElement(
                        id: category.id,
                        categoryName: category.categoryName,
                        emoji: category.emoji
                    )
                )
            )
        } catch {
            throw SwiftDataError.adding
        }
    }
}

// MARK: deleteCategory()
extension InvoiceRepositoryImpl {
    public func deleteInvoice(_ invoice: UIInvoiceItem) async {
        let element = InvoiceElement(
            code: invoice.code,
            name: invoice.name,
            quantity: invoice.quantity,
            unit: invoice.unit,
            category: CategoryElement(
                id: invoice.category.id,
                categoryName: invoice.category.categoryName,
                emoji: invoice.category.emoji
            )
        )

        await repository.delete(element)
    }
}
