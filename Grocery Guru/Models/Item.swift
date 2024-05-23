import SwiftUI
import SwiftData

@Model
final class Item {
    var name: String
    var amount: Int
    var category: ItemCategory

    init(name: String, amount: Int, category: ItemCategory) {
        self.name = name
        self.amount = amount
        self.category = category
    }
}
