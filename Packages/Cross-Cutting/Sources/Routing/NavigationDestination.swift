import SwiftUI

public enum NavigationDestination: Hashable, Identifiable, Sendable, Equatable {
    case addInvoice
    case categorySettings
    case invoiceForm(RouteInvoiceFormItem? = nil)
    case invoiceList

    public var id: UUID {
        UUID()
    }
}

public struct RouteInvoiceFormItem: Sendable, Equatable, Hashable {
    public let code: String?
    public let name: String?

    public init(
        code: String?,
        name: String?
    ) {
        self.code = code
        self.name = name
    }
}

public struct RouteCategoryItem: Sendable, Equatable, Hashable {
    public let categoryName: String
    public let emoji: String

    public init(categoryName: String, emoji: String) {
        self.categoryName = categoryName
        self.emoji = emoji
    }
}
