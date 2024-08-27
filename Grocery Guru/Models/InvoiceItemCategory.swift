import SwiftUI

enum InvoiceItemCategory: Codable, CaseIterable, Hashable {
    case bakery
    case canned
    case custom(name: String, emoji: String)
    case fish
    case fruits
    case meat
    case milkEgg
    case vegetables

    static var allCases: [Self] = [
        .bakery,
        .canned,
        .fish,
        .fruits,
        .meat,
        .milkEgg,
        .vegetables
    ]

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
        case let .custom(name, _):
            LocalizedStringKey(name)
        }
    }

    var emoji: String {
        switch self {
        case .bakery:
            "🥖"

        case .canned:
            "🥫"

        case .fish:
            "🐟"

        case .fruits:
            "🍎"

        case .meat:
            "🥩"

        case .milkEgg:
            "🥛"

        case .vegetables:
            "🥕"

        case let .custom(_, emoji):
            emoji
        }
    }
}
