import Foundation
import SwiftData

@Model
class CategoryElement: @unchecked Sendable {
    var id: UUID
    var categoryName: String
    var emoji: String

    init(id: UUID = UUID(), categoryName: String, emoji: String) {
        self.id = id
        self.categoryName = categoryName
        self.emoji = emoji
    }
}
