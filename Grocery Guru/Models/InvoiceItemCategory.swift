import Foundation

enum InvoiceItemCategory: String, Codable, CaseIterable, Identifiable {
    case fruits = "Fruits"
    case meat = "Meat"
    case milkEgg = "Milk & Egg"
    case vegetables = "Vegetables"
    case fish = "Fish"
    case canned = "Canned"
    case bakery = "Bakery"

    var id: UUID { UUID() }

    var emoji: Emoji {
        switch self {
        case .fruits:
                .fruit
        case .meat:
                .meat
        case .milkEgg:
                .milkEgg
        case .vegetables:
                .vegetable
        case .bakery:
                .bakery
        case .fish:
                .fish
        case .canned:
                .canned
        }
    }
}
