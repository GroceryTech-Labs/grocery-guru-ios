import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case addCategory
    case addInvoice(option: AddInvoiceOption = .document)
    case invoiceForm(product: OFFProduct?)
    case invoiceList(items: [InvoiceItem])

    var id: UUID {
        UUID()
    }

    @MainActor var view: some View {
        switch self {
        case .addCategory:
            AnyView(
                CategoryCreationView()
            )

        case let .addInvoice(option):
            AnyView(
                AddInvoiceView(selectedOption: option)
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
