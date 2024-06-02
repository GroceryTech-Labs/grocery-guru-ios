import SwiftUI

enum InvoiceItemCategory: Codable, CaseIterable, Identifiable {
    case bakery
    case canned
    case fish
    case fruits
    case meat
    case milkEgg
    case vegetables

    var localized: LocalizedStringKey {
        switch self {
        case .bakery:
            "Bakery"
        case .canned:
            "Canned"
        case .fish:
            "Fish"
        case .fruits:
            "Fruits"
        case .meat:
            "Meat"
        case .milkEgg:
            "Milk & Egg"
        case .vegetables:
            "Vegetables"
        }
    }

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
