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

    /// Search and tap the "Quantity" textfield on the invoice form and fill in text.
    func typeInvoiceFormQuantity(quantity: String = "100") {
        tapInvoiceFormQuantityTextfield()

        // Clear field and type new text
        self.typeText(XCUIKeyboardKey.delete.rawValue)
        self.typeText(quantity)
    }

    /// Search and tap the "Unit" textfield on the invoice form and fill in text.
    func typeInvoiceFormUnit(unit: String = "g") {
        tapInvoiceFormQuantityTextfield()

        // Clear field and type new text
        self.typeText(XCUIKeyboardKey.delete.rawValue)
        self.typeText(unit)
    }
}
