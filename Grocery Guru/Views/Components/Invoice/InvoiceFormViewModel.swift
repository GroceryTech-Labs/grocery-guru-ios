import Foundation

import SwiftUI

@Observable
class InvoiceFormViewModel {
    private var navigator = NavigationService.shared

    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: InvoiceItemCategory
    var product: OFFProduct?
    var isPresentingNutriments = false

    @MainActor var usedLocalRepository: LocalStorageItemRepository {
        let testMode = ProcessInfo.processInfo.arguments.contains("testMode")

        if testMode {
            return MockLocalStorageItemRepository.mockInstance
        }

        return LocalStorageItemRepository.shared
    }

    init(
        name: String,
        amount: String,
        measureUnit: MeasureUnit,
        category: InvoiceItemCategory,
        product: OFFProduct? = nil
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
                navigator.drop()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
