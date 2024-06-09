import Foundation

struct AccessibilityIdentifier {
    struct Button {
        static let addInvoice = "button_add_invoice"
        static let addInvoiceDocument = "button_add_invoice_document"
        static let addInvoiceBarcode = "button_add_invoice_barcode"
        static let addInvoiceManual = "button_add_invoice_manual"
        static let invoiceFormSubmit = "button_invoice_for_submit"

        private init() { }
    }

    struct TextField {
        static let invoiceFormName = "textfield_invoice_form_name"
        static let invoiceFormAmount = "textfield_invoice_form_amount"

        private init() { }
    }

    private init() { }
}
