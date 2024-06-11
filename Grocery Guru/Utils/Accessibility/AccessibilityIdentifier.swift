import Foundation

enum AccessibilityIdentifier {
    enum Button {
        static let addInvoice = "button_add_invoice"
        static let addInvoiceDocument = "button_add_invoice_document"
        static let addInvoiceBarcode = "button_add_invoice_barcode"
        static let addInvoiceManual = "button_add_invoice_manual"
        static let invoiceFormNutriments = "button_invoice_form_nutriments"
        static let invoiceFormSubmit = "button_invoice_form_submit"
        static let invoiceCategory = "button_invoice_category"
    }

    enum TextField {
        static let invoiceFormName = "textfield_invoice_form_name"
        static let invoiceFormAmount = "textfield_invoice_form_amount"
    }

    enum Scanner {
        static let barcode = "scanner_barcode"
    }

    enum ListElement {
        static let invoiceItem = "list_element_invoice_item"
    }
}
