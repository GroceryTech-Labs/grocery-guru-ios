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

    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: UICategoryItem
    var product: UIProductItem?
    var isPresentingNutriments = false

    init(
        //        repository: InvoiceRepository,
        navigationService: NavigationService,
        name: String = "",
        amount: String = "1",
        measureUnit: MeasureUnit = .item,
        category: UICategoryItem = UICategoryItem(.bakery),
        product: UIProductItem? = nil
    ) {
        //        self.repository = repository
        self.navigationService = navigationService
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
        self.product = product
    }

    func addInvoice() {
        navigationService.dropToRoot()
//        Task {
//            do {
//                try await usedLocalRepository.add(
//                    InvoiceItem(
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
