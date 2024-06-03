import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
    case invoiceList(items: [InvoiceItem])

    var id: UUID {
        UUID()
    }

    var view: some View {
        switch self {
        case let .invoiceList(items):
            AnyView(
                InvoiceItemList(items: items)
            )
        }
    }
}
