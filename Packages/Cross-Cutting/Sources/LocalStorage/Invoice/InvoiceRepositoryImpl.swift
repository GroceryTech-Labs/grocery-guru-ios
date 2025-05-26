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

    public func fetchInvoicesByCategory(_ categoryName: String) async throws -> [UIInvoiceItem] {
        do {
            let response = try await repository.fetch(
                descriptor: FetchDescriptor<InvoiceElement>(
                    predicate: #Predicate { $0.category.categoryName == categoryName }
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
            amount: invoice.amount,
            measureUnit: invoice.measureUnit,
            category: UICategoryItem(
                categoryName: invoice.category.categoryName,
                emoji: invoice.category.emoji
            )
        )
    }
}

// MARK: addCategory()
extension InvoiceRepositoryImpl {
    public func addInvoice(
        code: String?,
        name: String,
        amount: Int,
        measureUnit: MeasureUnit,
        category: UICategoryItem
    ) async throws {
        do {
            try await repository.add(
                InvoiceElement(
                    code: code,
                    name: name,
                    amount: amount,
                    measureUnit: measureUnit,
                    category: CategoryElement(
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
            amount: invoice.amount,
            measureUnit: invoice.measureUnit,
            category: CategoryElement(
                categoryName: invoice.category.categoryName,
                emoji: invoice.category.emoji
            )
        )

        await repository.delete(element)
    }
}
