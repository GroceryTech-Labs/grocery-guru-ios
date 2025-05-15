import SwiftUI
import OpenFoodFacts

@Observable
class InvoiceFormViewModel {
    private var navigator = NavigationService.shared

    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: InvoiceItemCategory
    var product: APIProductItem?
    var isPresentingNutriments = false

    @MainActor var usedLocalRepository: LocalStorageRepository {
        let testMode = ProcessInfo.processInfo.arguments.contains("testMode")

        if testMode {
            return MockLocalStorageRepository.mockInstance
        }

        return LocalStorageRepository.shared
    }

    init(
        name: String = "",
        amount: String = "1",
        measureUnit: MeasureUnit = .item,
        category: InvoiceItemCategory = .bakery,
        product: APIProductItem? = nil
    ) {
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
        self.product = product
    }

    func addInvoice() {
        Task {
            do {
                try await usedLocalRepository.addItem(
                    InvoiceItem(
                        name: name,
                        amount: Int(amount) ?? 0,
                        category: category,
                        measureUnit: measureUnit
                    )
                )
                navigator.dropToRoot()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
