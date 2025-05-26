import SwiftUI
import OpenFoodFacts
import Categories
import Routing

@MainActor
@Observable
class InvoiceFormViewModel {
    private let navigationService: NavigationService
    let categoryRepository: CategoryRepository
    private var invoiceRepository: InvoiceRepository

    let code: String?
    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: UICategoryItem
    var isPresentingNutriments = false

    init(
        categoryRepository: CategoryRepository,
        invoiceRepository: InvoiceRepository,
        navigationService: NavigationService = .shared,
        code: String? = nil,
        name: String = "",
        amount: String = "1",
        measureUnit: MeasureUnit = .item,
        category: UICategoryItem = UICategoryItem(.bakery),
    ) {
        self.categoryRepository = categoryRepository
        self.invoiceRepository = invoiceRepository
        self.navigationService = navigationService
        self.code = code
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
    }

    func addInvoice() async {
        do {
            try await invoiceRepository.addInvoice(
                code: code,
                name: name,
                amount: Int(amount) ?? 0,
                measureUnit: measureUnit,
                category: category
            )
            navigationService.dropToRoot()
        } catch {
            print(error.localizedDescription)
        }
    }
}
