import Foundation

public enum AccessibilityIdentifier {
    public enum Button {
        public static let addInvoice = "button_add_invoice"
        public static let addInvoiceDocument = "button_add_invoice_document"
        public static let addInvoiceBarcode = "button_add_invoice_barcode"
        public static let addInvoiceManual = "button_add_invoice_manual"
        public static let invoiceFormNutriments = "button_invoice_form_nutriments"
        public static let invoiceFormSubmit = "button_invoice_form_submit"
        public static let invoiceCategory = "button_invoice_category"
    }

    public enum TextField {
        public static let invoiceFormName = "textfield_invoice_form_name"
        public static let invoiceFormAmount = "textfield_invoice_form_amount"
    }

    public enum Scanner {
        public static let barcode = "scanner_barcode"
    }

    public enum ListElement {
        public static let invoiceItem = "list_element_invoice_item"
        public static let emoji = "list_element_emoji"
    }
}
