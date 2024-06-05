import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case addInvoice(option: AddInvoiceOption = .scan)
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

        case let .invoiceList(items):
            AnyView(
                InvoiceItemList(items: items)
            )
        }
    }
}
