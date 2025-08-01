import SwiftUI
import SwiftData
import LocalStorage
import Routing
import Categories
import Invoice
import GGAPI
import OpenFoodFacts

@main
struct Grocery_GuruApp: App {
    @State private var navigationService = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationService.path) {
                HomeView()
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        destination.resolveView()
                    }
                    .sheet(item: $navigationService.sheet) { destination in
                        destination.resolveView()
                    }
            }
        }
    }
}

extension NavigationDestination {
    @ViewBuilder
    @MainActor
    func resolveView() -> some View {
        switch self {
        case .addInvoice:
            AddInvoiceView(
                productAPI: ProductAPIImpl(OpenFoodFactsEndpoint.baseURL),
                categoryRepository: CategoryRepositoryImpl(),
                invoiceRepository: InvoiceRepositoryImpl(),
                selectedOption: .barcode
            )

        case .addCategory:
            CategoryCreationView(
                viewModel: CategoryCreationViewModel(
                    repository: CategoryRepositoryImpl()
                )
            )

        case .categorySettings:
            CategorySettingsView(
                repository: CategoryRepositoryImpl()
            )

        case .invoiceForm(let code):
            InvoiceForm(
                categoryRepository: CategoryRepositoryImpl(),
                invoiceRepository: InvoiceRepositoryImpl(),
                productAPI: ProductAPIImpl(OpenFoodFactsEndpoint.baseURL),
                code: code
            )

        case .invoiceList(let categoryId):
            InvoiceList(
                invoiceRepository: InvoiceRepositoryImpl(),
                categoryId: categoryId
            )
        }
    }
}
