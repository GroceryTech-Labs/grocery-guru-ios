import Foundation
import SwiftData

@Model
final class CustomCategory {
    let name: String
    let emoji: Emoji

    init(name: String, emoji: Emoji) {
        self.name = name
        self.emoji = emoji
    }
}
