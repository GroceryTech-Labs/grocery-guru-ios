import SwiftUI

public enum BaseCategory: CaseIterable, Hashable {

    case bakery
    case canned
    case fish
    case fruits
    case meat
    case milkEgg
    case vegetables

    public var localized: LocalizedStringKey {
        switch self {
        case .bakery: "Bakery"
        case .canned: "Canned"
        case .fish: "Fish"
        case .fruits: "Fruits"
        case .meat: "Meat"
        case .milkEgg: "Milk & Egg"
        case .vegetables: "Vegetables"
        }
    }

    public var name: String {
        NSLocalizedString(localized.extractRawString(), comment: "")
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
        }
    }
}

extension LocalizedStringKey {
    func extractRawString() -> String {
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if child.label == "key", let rawKey = child.value as? String {
                return rawKey
            }
        }
        return ""
    }
}
