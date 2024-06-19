import SwiftUI

enum AddInvoiceOption: LocalizedStringKey, CaseIterable, Hashable {
    case barcode = "Barcode"
    case manual = "Manual"
    case scan = "Scan"

    static var allCases: [Self] {
        [.scan, .barcode, .manual]
    }

    var accessibilityIdentifier: String {
        switch self {
        case .barcode:
            AccessibilityIdentifier.Button.addInvoiceBarcode

        case .manual:
            AccessibilityIdentifier.Button.addInvoiceManual

        case .scan:
            AccessibilityIdentifier.Button.addInvoiceDocument
        }
    }
}
