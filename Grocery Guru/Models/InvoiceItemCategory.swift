import Foundation

enum InvoiceItemCategory: Codable, CaseIterable, Identifiable {
    case custom
    case fruits
    case meat
    case milkEgg
    case vegetables
    case fish
    case canned
    case bakery

    var id: UUID { UUID() }


    var title: String {
        switch self {
        case .custom:
            "Custom"
        case .fruits:
            "Fruits"
        case .meat:
            "Meat"
        case .milkEgg:
            "Milk & Egg"
        case .vegetables:
            "Vegetables"
        case .bakery:
            "Bakery"
        case .fish:
            "Fish"
        case .canned:
            "Canned"
        }
    }

    var emoji: Emoji {
        return switch self {
        case .custom:
                .vegetable
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
