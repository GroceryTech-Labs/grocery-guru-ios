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

protocol UpdatableBy {
    associatedtype Source
    func update(from source: Source)
}

extension CategoryElement: UpdatableBy {
    typealias Source = CategoryElement
    func update(from source: CategoryElement) {
        self.categoryName = source.categoryName
        self.emoji = source.emoji
        // Do not update id or invoices
    }
}
