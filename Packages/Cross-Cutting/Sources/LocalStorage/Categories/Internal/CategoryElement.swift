import Foundation
import SwiftData

@Model
class CategoryElement: @unchecked Sendable {
    @Attribute(.unique, originalName: "name") var categoryName: String
    var emoji: String

    @Relationship(deleteRule: .cascade, inverse: \InvoiceElement.category)
    var invoices = [InvoiceElement]()

    init(categoryName: String, emoji: String) {
        self.categoryName = categoryName
        self.emoji = emoji
    }
}
