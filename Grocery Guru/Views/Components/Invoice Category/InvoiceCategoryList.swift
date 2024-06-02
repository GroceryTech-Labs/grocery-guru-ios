import SwiftUI

struct InvoiceCategoryList: View {

    private let invoiceItems: [InvoiceItem]

    init(invoiceItems: [InvoiceItem]) {
        self.invoiceItems = invoiceItems
    }

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: Constants.Padding.M
        ) {
            ForEach(InvoiceItemCategory.allCases) { category in
                InvoiceCategoryCard(
                    category: category,
                    items: invoiceItems
                )
            }
        }
    }
}

#Preview {
    ScrollView {
        InvoiceCategoryList(
            invoiceItems: MockItemRepository.preview.items
        )
    }
}
