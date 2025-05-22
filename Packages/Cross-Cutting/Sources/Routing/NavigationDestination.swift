import SwiftUI

public enum NavigationDestination: Hashable, Identifiable, Sendable, Equatable {
    case addInvoice
    case categorySettings
    case invoiceForm
    case invoiceList

    public var id: UUID {
        UUID()
    }
}
