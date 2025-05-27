import SwiftUI
import OpenFoodFacts
import Categories
import Routing

@MainActor
@Observable
class InvoiceFormViewModel {
    private let navigationService: NavigationService
    let categoryRepository: CategoryRepository
    private let invoiceRepository: InvoiceRepository
    let productAPI: ProductAPI

    let code: String?
    var name: String = ""
    var quantity: String = ""
    var unit: String = ""
    var category: UICategoryItem?

    init(
        categoryRepository: CategoryRepository,
        invoiceRepository: InvoiceRepository,
        productAPI: ProductAPI,
        navigationService: NavigationService = .shared,
        code: String? = nil,
    ) {
        self.categoryRepository = categoryRepository
        self.invoiceRepository = invoiceRepository
        self.productAPI = productAPI
        self.navigationService = navigationService
        self.code = code
    }

    func addInvoice() async {
        do {
            guard let category else {
                return
            }

            try await invoiceRepository.addInvoice(
                code: code,
                name: name,
                quantity: Int(quantity) ?? 0,
                unit: unit,
                category: category
            )
            navigationService.dropToRoot()
        } catch {
            print(error.localizedDescription)
        }
    }

    @MainActor
    func fetchProductInformation() async {
        do {
            let result = try await productAPI.fetchProduct(
                barcode: code ?? "",
                fields: [.productName, .productQuantity, .productUnit]
            )
            name = result.productName ?? ""
            quantity = result.productQuantity ?? ""
            unit = result.productQuantityUnit ?? ""
        } catch {
            print(error.localizedDescription)
        }
    }
}
