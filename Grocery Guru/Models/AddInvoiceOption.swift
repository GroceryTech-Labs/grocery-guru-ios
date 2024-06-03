import SwiftUI

enum AddInvoiceOption: LocalizedStringKey, CaseIterable, Hashable {
    case manual = "Manual"
    case scan = "Scan"

    static var allCases: [Self] {
        [.scan, .manual]
    }
}
