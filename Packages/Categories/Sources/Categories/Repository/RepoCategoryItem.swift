import Foundation

public struct RepoCategoryItem: Sendable {
    public let name: String
    public let emoji: String

    public init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
