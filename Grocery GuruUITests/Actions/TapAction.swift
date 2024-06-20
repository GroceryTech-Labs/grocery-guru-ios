import XCTest
@testable import Grocery_Guru

/// Simple tap events with check for existence
final class TapAction {

    // MARK: HOME
    // Buttons

    static func invoiceCategoryButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.invoiceCategory].firstMatch

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

    static func addInvoiceDocumentSegmentButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.addInvoiceDocument]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    static func addInvoiceBarcodeSegmentButton(app: XCUIApplication) {
        let button = app.buttons[AccessibilityIdentifier.Button.addInvoiceBarcode]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // Other
    static func barcodeScanner(app: XCUIApplication, maxRequestTime: TimeInterval) {
        let barcodeScanner = app.otherElements[AccessibilityIdentifier.Scanner.barcode]

        // Necessary for the UI to respond
        sleep(3)

        // Check for existence
        XCTAssertTrue(barcodeScanner.waitForExistence(timeout: 1))
        barcodeScanner.tap()

        // Check for view switch
        let formTextField = app.textFields[AccessibilityIdentifier.TextField.invoiceFormName]
        XCTAssertTrue(formTextField.waitForExistence(timeout: maxRequestTime))
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

    static func openAndCloseNutriments(app: XCUIApplication) {
        let disclosureGroup = app.staticTexts[AccessibilityIdentifier.Button.invoiceFormNutriments]

        // Check for existence
        XCTAssertTrue(disclosureGroup.waitForExistence(timeout: 1))
        disclosureGroup.tap()

        XCTAssertTrue(disclosureGroup.waitForExistence(timeout: 1))
        disclosureGroup.tap()
    }

    // MARK: General

    static func navigateBack(app: XCUIApplication) {
        let navigationBar = app.navigationBars.firstMatch
        let leadingItem = navigationBar.buttons.firstMatch

        // Check for existence
        XCTAssertTrue(leadingItem.waitForExistence(timeout: 1))
        leadingItem.tap()
    }
}
