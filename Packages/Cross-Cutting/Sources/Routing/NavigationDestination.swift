import SwiftUI

public enum NavigationDestination: Hashable, Identifiable, Sendable, Equatable {
    case addInvoice
    case categorySettings
    case invoiceForm(code: String? = nil)
    case invoiceList(categoryName: String? = nil)

    public var id: UUID {
        UUID()
    }
}
