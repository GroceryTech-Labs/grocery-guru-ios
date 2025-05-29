import Foundation

public struct UICategoryItem: Identifiable, Equatable, Sendable {
    public let id: UUID
    public let categoryName: String
    public let emoji: String
    public let invoiceCount: Int

    public init(id: UUID = UUID(), categoryName: String, emoji: String, invoiceCount: Int = 0) {
        self.id = id
        self.categoryName = categoryName
        self.emoji = emoji
        self.invoiceCount = invoiceCount
    }

    public init(_ baseCategory: BaseCategory) {
        self.id = UUID()
        self.categoryName = baseCategory.name
        self.emoji = baseCategory.emoji
        self.invoiceCount = 0
    }
}
