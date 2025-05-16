import SwiftUI
import DesignSystem

struct CategoryPreviewRow: View {
    let invoiceItemCategory: InvoiceItemCategory

    var body: some View {
        SectionHeader("Preview", font: .headline) {
            InvoiceCategoryCard(
                category: invoiceItemCategory,
                items: [],
                isPreview: true
            )
        }
    }
}

#Preview {
    CategoryPreviewRow(invoiceItemCategory: .bakery)
}
