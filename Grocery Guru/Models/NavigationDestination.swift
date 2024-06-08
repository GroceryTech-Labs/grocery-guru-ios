import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case addInvoice(option: AddInvoiceOption = .scan)
    case invoiceForm(item: InvoiceItem)
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

        case let .invoiceForm(item):
            AnyView(
                InvoiceForm(item: item)
            )

        case let .invoiceList(items):
            AnyView(
                InvoiceItemList(items: items)
            )
        }
    }
}
