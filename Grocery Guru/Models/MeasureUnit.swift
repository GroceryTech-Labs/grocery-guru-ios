import SwiftUI

enum MeasureUnit: Codable, Hashable, CaseIterable {
    case gram
    case item

    var localized: LocalizedStringKey {
        switch self {
        case .gram:
            "g"
        case .item:
            "Item"
        }
    }
}
