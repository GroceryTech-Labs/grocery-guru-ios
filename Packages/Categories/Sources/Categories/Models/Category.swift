import SwiftUI

public enum BaseCategory: Codable, CaseIterable, Hashable {
    case bakery
    case canned
    case custom(name: String, emoji: String)
    case fish
    case fruits
    case meat
    case milkEgg
    case vegetables

    public static var allCases: [BaseCategory] {
        [
            .bakery,
            .canned,
            .fish,
            .fruits,
            .meat,
            .milkEgg,
            .vegetables
        ]
    }

    public var localized: LocalizedStringKey {
        switch self {
        case .bakery: "Bakery"
        case .canned: "Canned"
        case .fish: "Fish"
        case .fruits: "Fruits"
        case .meat: "Meat"
        case .milkEgg: "Milk & Egg"
        case .vegetables: "Vegetables"
        case let .custom(name, _):
            LocalizedStringKey(name)
        }
    }

    public var emoji: String {
        switch self {
        case .bakery: "🥖"
        case .canned: "🥫"
        case .fish: "🐟"
        case .fruits: "🍎"
        case .meat: "🥩"
        case .milkEgg: "🥛"
        case .vegetables: "🥕"
        case let .custom(_, emoji):
            emoji
        }
    }
}
