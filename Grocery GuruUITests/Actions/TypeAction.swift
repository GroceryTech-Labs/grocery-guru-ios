import XCTest
@testable import Grocery_Guru

/// UI Actions that needs to perform a typing action
extension XCUIApplication {

    // MARK: INVOICE FORM

    /// Search and tap the "Name" textfield on the invoice form and fill in text.
    func typeInvoiceFormName(name: String = "Strawberries") {
        tapInvoiceFormNameTextfield()
        self.typeText(name)
    }

    /// Search and tap the "Amount" textfield on the invoice form and fill in text.
    func typeInvoiceFormAmount(name: String = "100") {
        tapInvoiceFormAmountTextfield()

        // Clear field and type new text
        self.typeText(XCUIKeyboardKey.delete.rawValue)
        self.typeText(name)
    }
}
