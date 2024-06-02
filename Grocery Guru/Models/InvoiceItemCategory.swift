import Foundation

enum InvoiceItemCategory: String, Codable, CaseIterable, Identifiable {
    case bakery = "Bakery"
    case canned = "Canned"
    case fish = "Fish"
    case fruits = "Fruits"
    case meat = "Meat"
    case milkEgg = "Milk & Egg"
    case vegetables = "Vegetables"

    var id: UUID { UUID() }

    var emoji: Emoji {
        switch self {
        case .bakery:
            .bakery

        case .canned:
            .canned

        case .fish:
            .fish

        case .fruits:
            .fruit

        case .meat:
            .meat

        case .milkEgg:
            .milkEgg

        case .vegetables:
            .vegetable
        }
    }
}
