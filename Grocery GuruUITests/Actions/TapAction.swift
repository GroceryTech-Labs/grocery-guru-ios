import XCTest
@testable import Grocery_Guru
@testable import DesignSystem

/// Simple tap events with check for existence
extension XCUIApplication {

    // MARK: HOME
    // Buttons

    func tapInvoiceCategoryButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.invoiceCategory].firstMatch

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // MARK: ADD INVOICE
    // Buttons

    func tapAddInvoiceButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.addInvoice]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    func tapAddInvoiceManualSegmentButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.addInvoiceManual]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    func tapAddInvoiceDocumentSegmentButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.addInvoiceDocument]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    func tapAddInvoiceBarcodeSegmentButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.addInvoiceBarcode]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // Other
    func tapBarcodeScanner(maxRequestTime: TimeInterval) {
        let barcodeScanner = self.otherElements[AccessibilityIdentifier.Scanner.barcode]

        // Necessary for the UI to respond
        sleep(3)

        // Check for existence
        XCTAssertTrue(barcodeScanner.waitForExistence(timeout: 1))
        barcodeScanner.tap()

        // Check for view switch
        let formTextField = self.textFields[AccessibilityIdentifier.TextField.invoiceFormName]
        XCTAssertTrue(formTextField.waitForExistence(timeout: maxRequestTime))
    }

    // MARK: INVOICE FORM
    // Buttons

    func tapInvoiceFormSubmitButton() {
        let button = self.buttons[AccessibilityIdentifier.Button.invoiceFormSubmit]

        // Check for existence
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()
    }

    // Text Fields

    func tapInvoiceFormNameTextfield() {
        let textField = self.textFields[AccessibilityIdentifier.TextField.invoiceFormName]

        // Check for existence
        XCTAssertTrue(textField.waitForExistence(timeout: 1))
        textField.tap()
    }

    func tapInvoiceFormAmountTextfield() {
        let textField = self.textFields[AccessibilityIdentifier.TextField.invoiceFormAmount]

        // Check for existence
        XCTAssertTrue(textField.waitForExistence(timeout: 1))
        textField.tap()
    }

    func tapOpenAndCloseNutriments() {
        let disclosureGroup = self.staticTexts[AccessibilityIdentifier.Button.invoiceFormNutriments]

        // Check for existence
        XCTAssertTrue(disclosureGroup.waitForExistence(timeout: 1))
        disclosureGroup.tap()

        XCTAssertTrue(disclosureGroup.waitForExistence(timeout: 1))
        disclosureGroup.tap()
    }

    // MARK: General

    func tapNavigateBack() {
        let navigationBar = self.navigationBars.firstMatch
        let leadingItem = navigationBar.buttons.firstMatch

        // Check for existence
        XCTAssertTrue(leadingItem.waitForExistence(timeout: 1))
        leadingItem.tap()
    }
}
