import SwiftUI
import OpenFoodFacts
import Categories
import LocalStorage

@Observable
class InvoiceFormViewModel {
    private var navigator = NavigationService.shared

    var name: String
    var amount: String
    var measureUnit: MeasureUnit
    var category: BaseCategory
    var product: UIProductItem?
    var isPresentingNutriments = false

//    @MainActor var usedLocalRepository: SwiftDataRepositoryImpl<InvoiceItem> {
////        let testMode = ProcessInfo.processInfo.arguments.contains("testMode")
//
////        if testMode {
////            return MockLocalStorageRepository.mockInstance
////        }
//
//        SwiftDataRepositoryImpl<InvoiceItem>()
//    }

    init(
        name: String = "",
        amount: String = "1",
        measureUnit: MeasureUnit = .item,
        category: BaseCategory = .bakery,
        product: UIProductItem? = nil
    ) {
        self.name = name
        self.amount = amount
        self.measureUnit = measureUnit
        self.category = category
        self.product = product
    }

    @MainActor
    func addInvoice() async {
        Task {
            do {
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
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
