import SwiftUI

enum NavigationDestination: Hashable {
    case invoiceList(items: [InvoiceItem])

    var view: some View {
        switch self {
        case let .invoiceList(items):
            AnyView(
                InvoiceItemList(items: items)
            )
        }
    }
}
