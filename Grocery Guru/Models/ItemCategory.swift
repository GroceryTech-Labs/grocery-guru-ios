import Foundation

enum ItemCategory: Codable, CaseIterable, Identifiable {
    case custom
    case fruits
    case meat
    case milk
    case vegetables
    
    var id: UUID { UUID() }

    static var allCases: [ItemCategory] {
        [.fruits, .meat, .milk, .vegetables]
    }

    var title: String {
        var name: String {
            switch self {
            case .custom:
                ""
            case .fruits:
                "Fruits"
            case .meat:
                "Meat"
            case .milk:
                "Milk"
            case .vegetables:
                "Vegetables"
            }
        }

        return "\(name) \(self.emoji)"
    }

    var emoji: String {
        return switch self {
        case .custom:
            ""
        case .fruits:
            "🍎"
        case .meat:
            "🥩"
        case .milk:
            "🥛"
        case .vegetables:
            "🥦"
        }
    }
}
