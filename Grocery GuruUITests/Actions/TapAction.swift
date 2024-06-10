import XCTest
@testable import Grocery_Guru

/// Simple tap events with check for existence
final class TapAction {

    // MARK: HOME
    // Buttons

    static func invoiceCategoryButton(app: XCUIApplication) {
        let button = app.otherElements[AccessibilityIdentifier.Button.invoiceCategory].firstMatch

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // MARK: ADD INVOICE
    // Buttons

    static func addInvoiceButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.addInvoice]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    static func addInvoiceManualSegmentButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.addInvoiceManual]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // MARK: INVOICE FORM
    // Buttons

    static func invoiceFormSubmitButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.invoiceFormSubmit]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // Text Fields

    static func invoiceFormNameTextfield(app: XCUIApplication) {
        let textField = app.textFields[AccessibilityIdentifier.TextField.invoiceFormName]

        // Check for existence
        XCTAssertTrue(textField.waitForExistence(timeout: 1))
        textField.tap()
    }

    static func invoiceFormAmountTextfield(app: XCUIApplication) {
        let textField = app.textFields[AccessibilityIdentifier.TextField.invoiceFormAmount]

        // Check for existence
        XCTAssertTrue(textField.waitForExistence(timeout: 1))
        textField.tap()
    }
}
