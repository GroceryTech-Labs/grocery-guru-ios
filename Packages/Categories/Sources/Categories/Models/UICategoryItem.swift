import Foundation
import SwiftData

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
}
