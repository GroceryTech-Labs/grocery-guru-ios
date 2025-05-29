import Foundation
import SwiftData

@Model
class CategoryElement: @unchecked Sendable {
    @Attribute(.unique)
    var id: UUID
    var categoryName: String
    var emoji: String

    @Relationship(deleteRule: .cascade, inverse: \InvoiceElement.category)
    var invoices = [InvoiceElement]()

    init(id: UUID = UUID(), categoryName: String, emoji: String) {
        self.id = id
        self.categoryName = categoryName
        self.emoji = emoji
    }
}
