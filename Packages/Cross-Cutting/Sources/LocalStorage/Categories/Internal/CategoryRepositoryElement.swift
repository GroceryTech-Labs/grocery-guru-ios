import Foundation
import SwiftData

@Model
class CategoryElement {
    var categoryName: String
    var emoji: String

    init(categoryName: String, emoji: String) {
        self.categoryName = categoryName
        self.emoji = emoji
    }
}
