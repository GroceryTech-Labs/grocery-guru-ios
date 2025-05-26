import Foundation

public struct UICategoryItem: Identifiable, Equatable, Sendable {
    public let id: UUID = UUID()
    public let categoryName: String
    public let emoji: String
    public let invoiceCount: Int

    public init(categoryName: String, emoji: String, invoiceCount: Int = 0) {
        self.categoryName = categoryName
        self.emoji = emoji
        self.invoiceCount = invoiceCount
    }

    public init(_ baseCategory: BaseCategory) {
        self.categoryName = baseCategory.name
        self.emoji = baseCategory.emoji
        self.invoiceCount = 0
    }

    public static func == (lhs: UICategoryItem, rhs: UICategoryItem) -> Bool {
        lhs.categoryName == rhs.categoryName &&
        lhs.emoji == rhs.emoji &&
        lhs.invoiceCount == rhs.invoiceCount
    }
}
