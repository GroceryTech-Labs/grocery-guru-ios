import SwiftUI

enum InvoiceItemCategory: Codable, CaseIterable, Hashable {
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

    var emoji: Emoji {
        switch self {
        case .bakery:
            Emoji.bakery

        case .canned:
            Emoji.canned

        case .fish:
            Emoji.fish

        case .fruits:
            Emoji.fruit

        case .meat:
            Emoji.meat

        case .milkEgg:
            Emoji.milkEgg

        case .vegetables:
            Emoji.vegetable
        }
    }
}
