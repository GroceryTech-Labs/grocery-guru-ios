import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case addInvoice(option: AddInvoiceOption = .document)
    case categorySettings
    case invoiceForm(product: OFFProduct?)
    case invoiceList(items: [InvoiceItem])

    var id: UUID {
        UUID()
    }

    @MainActor var view: some View {
        switch self {
        case let .addInvoice(option):
            AnyView(
                AddInvoiceView(selectedOption: option)
            )

        case .categorySettings:
            AnyView(
                CategorySettingsView()
            )

        case let .invoiceForm(product):
            AnyView(
                InvoiceForm(product: product)
            )

        case let .invoiceList(items):
            AnyView(
                InvoiceItemList(items: items)
            )
        }
    }
}
