import Foundation
import SwiftData

@Model
final class CustomItemCategoryConfig {
    let name: String
    let emoji: String

    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
