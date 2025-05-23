import SwiftUI
import DesignSystem

public enum AddInvoiceOption: LocalizedStringKey, CaseIterable, Hashable {
    case barcode = "Barcode"
    case document = "Document"
    case manual = "Manual"

    public static var allCases: [Self] {
        [.barcode, .manual]
    }

    public var accessibilityIdentifier: String {
        switch self {
        case .barcode:
            AccessibilityIdentifier.Button.addInvoiceBarcode

        case .manual:
            AccessibilityIdentifier.Button.addInvoiceManual

        case .document:
            AccessibilityIdentifier.Button.addInvoiceDocument
        }
    }
}
