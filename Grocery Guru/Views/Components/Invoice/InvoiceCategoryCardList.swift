import SwiftUI

struct InvoiceCategoryCardList: View {
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
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(InvoiceItemCategory.allCases, id: \.hashValue) { category in
                    InvoiceCategoryCard(
                        category: category,
                        items: invoiceItems
                    )
                }
            }
            .padding(.horizontal, Constants.Padding.sizeX)
        }
        .scrollIndicators(.hidden)
    }

    init(invoiceItems: [InvoiceItem]) {
        self.invoiceItems = invoiceItems
    }
}

#Preview {
    ScrollView {
        InvoiceCategoryCardList(
            invoiceItems: []
        )
    }
}
