import SwiftUI

public enum MeasureUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case gram
    case item

    public var localized: LocalizedStringKey {
        switch self {
        case .gram:
            "g"
        case .item:
            "Item"
        }
    }
}
