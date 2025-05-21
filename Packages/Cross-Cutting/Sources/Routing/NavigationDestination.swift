import SwiftUI

public enum NavigationDestination: Hashable, Identifiable, Sendable {
    case addInvoice
    case categorySettings
    case invoiceForm
    case invoiceList

    public var id: UUID {
        UUID()
    }
}
