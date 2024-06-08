import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case addInvoice(option: AddInvoiceOption = .scan)
    case invoiceForm(product: OFFProduct?)
    case invoiceList(items: [InvoiceItem])

    var id: UUID {
        UUID()
    }

    var view: some View {
        switch self {
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
