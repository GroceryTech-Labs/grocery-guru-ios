import SwiftUI

enum MeasureUnit: Codable, Hashable, CaseIterable {
    case gram
    case whole

    var localized: LocalizedStringKey {
        switch self {
        case .gram:
            "g"
        case .whole:
            "Whole"
        }
    }
}
