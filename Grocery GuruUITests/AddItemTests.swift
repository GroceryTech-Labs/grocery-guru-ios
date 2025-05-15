import XCTest
@testable import DesignSystem

final class AddItemTests: XCTestCase {
    enum TypeOfHandle: String, CaseIterable {
        case okay = "OK"
        case select = "Select"
        case allowPhotos = "Allow Access to All Photos"
        case decline = "Don’t Allow"
    }

    func testAddItemManually() throws {
        let app = XCUIApplication()

        // Set app to test mode
        app.launchArguments = ["testMode"]
        app.launch()

        // 1) Open the "Add" screen.
        app.tapAddInvoiceButton()

        // 2) Switch to "manual" adding.
        app.tapAddInvoiceManualSegmentButton()

        // 3) Fill in and submit the form.
        app.typeInvoiceFormName()
        app.typeInvoiceFormAmount()
        app.tapInvoiceFormSubmitButton()

        // 4) Tap first category
        app.tapInvoiceCategoryButton()

        // 5) Check for existence of item.
        let invoiceItem = app.otherElements[AccessibilityIdentifier.ListElement.invoiceItem].firstMatch
        XCTAssertTrue(invoiceItem.waitForExistence(timeout: 1))

        app.terminate()
    }

    func testAddItemBarcode() throws {
        let app = XCUIApplication()

        // Set app to test mode
        app.launchArguments = ["testMode"]
        app.launch()

        // 1) Open the "Add" screen.
        app.tapAddInvoiceButton()

        // 2) Switch to "barcode".
        app.tapAddInvoiceBarcodeSegmentButton()

        // 3) Simulate a barcode scan,
        app.tapBarcodeScanner(maxRequestTime: 5)

        // 4) Fill in and submit the form.
        app.typeInvoiceFormAmount()
        app.tapOpenAndCloseNutriments()
        app.tapInvoiceFormSubmitButton()

        // 5) Tap first category.
        app.tapInvoiceCategoryButton()

        // 6) Check for existence of item.
        let invoiceItem = app.otherElements[AccessibilityIdentifier.ListElement.invoiceItem].firstMatch
        XCTAssertTrue(invoiceItem.waitForExistence(timeout: 1))

        app.terminate()
    }

    func buildSystemAlertsHandler(type: TypeOfHandle) -> NSObjectProtocol {
        addUIInterruptionMonitor(withDescription: "System alert") { alert in
            let actionButton = alert.buttons[type.rawValue]

            guard actionButton.exists else {
                return false
            }

            actionButton.tap()
            return true
        }
    }

    override func addUIInterruptionMonitor(
        withDescription handlerDescription: String,
        handler: @escaping (XCUIElement) -> Bool
    ) -> any NSObjectProtocol {
        buildSystemAlertsHandler(type: .okay)
    }
}
