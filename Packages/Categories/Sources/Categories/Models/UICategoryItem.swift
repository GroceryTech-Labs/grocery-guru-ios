import Foundation

public struct UICategoryItem: Identifiable, Equatable, Sendable {
    public let id: UUID = UUID()
    public let categoryName: String
    public let emoji: String

    public init(categoryName: String, emoji: String) {
        self.categoryName = categoryName
        self.emoji = emoji
    }

    public init(_ baseCategory: BaseCategory) {
        self.categoryName = baseCategory.name
        self.emoji = baseCategory.emoji
    }

    public static func == (lhs: UICategoryItem, rhs: UICategoryItem) -> Bool {
        lhs.categoryName == rhs.categoryName &&
        lhs.emoji == rhs.emoji
    }
}
