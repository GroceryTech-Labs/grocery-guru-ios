import Foundation

enum InvoiceItemCategory: Codable, CaseIterable, Identifiable {
    case custom
    case fruits
    case meat
    case cheeseEggDiary
    case vegetables
    case fish
    case canned
    case bakery

    var id: UUID { UUID() }


    var title: String {
        var name: String {
            switch self {
            case .custom:
                ""
            case .fruits:
                "Fruits"
            case .meat:
                "Meat"
            case .cheeseEggDiary:
                "Cheese, eggs & diary"
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

        return "\(name) \(self.emoji)"
    }

    var emoji: Emoji {
        return switch self {
        case .custom:
                .vegetable
        case .fruits:
                .fruit
        case .meat:
                .meat
        case .cheeseEggDiary:
                .cheeseEggDiary
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
