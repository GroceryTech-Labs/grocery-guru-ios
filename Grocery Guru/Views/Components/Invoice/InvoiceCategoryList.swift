import SwiftUI

struct InvoiceCategoryList: View {
    @Environment(\.dynamicTypeSize)
    private var typeSize

    private let invoiceItems: [InvoiceItem]

    private var columns: [GridItem] {
        if typeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        }

        return [GridItem(.flexible()), GridItem(.flexible())]
    }

    var body: some View {
        LazyVGrid(
            columns: columns,
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
            invoiceItems: []
        )
    }
}
