import SwiftUI
import SwiftData
import LocalStorage
import Routing
import Categories

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
            AddInvoiceView(selectedOption: .barcode)
        case .categorySettings:
            CategorySettingsView(repository: CategoryRepositoryImpl())
        case .invoiceForm:
            InvoiceForm()
        case .invoiceList:
            InvoiceItemList(items: [])
        }
    }
}
