import XCTest
@testable import Grocery_Guru

/// UI Actions that needs to perform a typing action
final class TypeAction {

    // MARK: INVOICE FORM

    /// Search and tap the "Name" textfield on the invoice form and fill in text.
    static func invoiceFormName(app: XCUIApplication, name: String = "Strawberries") {
        TapAction.invoiceFormNameTextfield(app: app)
        app.typeText(name)
    }

    /// Search and tap the "Amount" textfield on the invoice form and fill in text.
    static func invoiceFormAmount(app: XCUIApplication, name: String = "100") {
        TapAction.invoiceFormAmountTextfield(app: app)

        // Clear field and type new text
        app.typeText(XCUIKeyboardKey.delete.rawValue)
        app.typeText(name)
    }
}
