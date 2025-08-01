import SwiftUI

public enum NavigationDestination: Hashable, Identifiable, Sendable, Equatable {
    case addInvoice
    case invoiceForm(code: String? = nil)
    case invoiceList(categoryId: UUID? = nil)

    case addCategory
    case categorySettings

    public var id: UUID {
        UUID()
    }
}
