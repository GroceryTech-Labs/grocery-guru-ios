import SwiftUI
import OpenFoodFacts
import Categories
import Routing
import LocalStorage

@MainActor
@Observable
class InvoiceFormViewModel {
//    private var repository: InvoiceRepository
    private let navigationService: NavigationService
    private let code: String?

    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: UICategoryItem
    var isPresentingNutriments = false

    init(
        //        repository: InvoiceRepository,
        navigationService: NavigationService,
        code: String? = nil,
        name: String = "",
        amount: String = "1",
        measureUnit: MeasureUnit = .item,
        category: UICategoryItem = UICategoryItem(.bakery),
    ) {
        //        self.repository = repository
        self.navigationService = navigationService
        self.code = code
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
    }

    func addInvoice() {
        navigationService.dropToRoot()
//        Task {
//            do {
//                try await usedLocalRepository.add(
//                    UIInvoiceItem(
//                        code: product?.code,
//                        name: name,
//                        amount: Int(amount) ?? 0,
//                        category: category,
//                        measureUnit: measureUnit
//                    )
//                )
//                navigator.dropToRoot()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }
}
