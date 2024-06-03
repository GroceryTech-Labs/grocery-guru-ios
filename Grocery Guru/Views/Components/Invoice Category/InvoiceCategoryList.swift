import SwiftUI

struct InvoiceCategoryList: View {
    private let invoiceItems: [InvoiceItem]

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: Constants.Padding.sizeM
        ) {
            ForEach(InvoiceItemCategory.allCases, id: \.hashValue) { category in
                InvoiceCategoryCard(
                    category: category,
                    items: invoiceItems
                )
            }
        }
    }

    init(invoiceItems: [InvoiceItem]) {
        self.invoiceItems = invoiceItems
    }
}

#Preview {
    ScrollView {
        InvoiceCategoryList(
            invoiceItems: MockItemRepository.preview.items
        )
    }
}
