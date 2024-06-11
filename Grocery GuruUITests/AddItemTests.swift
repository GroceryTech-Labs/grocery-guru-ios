import XCTest

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
        TapAction.addInvoiceButton(app: app)

        // 2) Switch to "manual" adding.
        TapAction.addInvoiceManualSegmentButton(app: app)

        // 3) Fill in and submit the form.
        TypeAction.invoiceFormName(app: app)
        TypeAction.invoiceFormAmount(app: app)
        TapAction.invoiceFormSubmitButton(app: app)

        // 4) Tap first category
        TapAction.invoiceCategoryButton(app: app)

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
        TapAction.addInvoiceButton(app: app)

        // 2) Switch to "barcode".
        TapAction.addInvoiceBarcodeSegmentButton(app: app)

        // 3) Simulate a barcode scan,
        TapAction.barcodeScanner(app: app, maxRequestTime: 5)

        // 4) Fill in and submit the form.
        TypeAction.invoiceFormAmount(app: app)
        TapAction.openAndCloseNutriments(app: app)
        TapAction.invoiceFormSubmitButton(app: app)

        // 5) Navigate back.
        TapAction.navigateBack(app: app)

        // 6) Tap first category.
        TapAction.invoiceCategoryButton(app: app)

        // 7) Check for existence of item.
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
