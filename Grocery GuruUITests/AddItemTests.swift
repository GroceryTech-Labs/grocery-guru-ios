import XCTest
@testable import DesignSystem

final class AddItemTests: XCTestCase {
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
        app.typeInvoiceFormQuantity()
        app.typeInvoiceFormUnit()
        app.tapInvoiceFormSubmitButton()

        app.terminate()
    }

    func testAddItemBarcode() throws {
        let app = XCUIApplication()

        // Set app to test mode
        app.launchArguments = ["testMode"]
        app.launch()

        // 1) Open the "Add" screen.
        app.tapAddInvoiceButton()

        // 2) Simulate a barcode scan,
        app.tapBarcodeScanner(maxRequestTime: 5)

        // 3) Fill in and submit the form.
        app.typeInvoiceFormQuantity()
        app.typeInvoiceFormUnit()
        app.tapInvoiceFormSubmitButton()

        app.terminate()
    }
}
