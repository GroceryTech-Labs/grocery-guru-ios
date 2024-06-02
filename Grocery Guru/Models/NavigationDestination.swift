import SwiftUI

enum NavigationDestination: Hashable {
    case invoiceList(type: InvoiceListType)

    enum InvoiceListType: Hashable {
        case byCategory(items: [InvoiceItem])
    }

    var view: some View {
        switch self {
        case let .invoiceList(type):
            switch type {
            case let .byCategory(items):
                AnyView(
                    InvoicesList(items: items)
                )
            }
        }
    }
}
