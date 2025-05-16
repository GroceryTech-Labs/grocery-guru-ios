import SwiftUI
import SwiftData
import DesignSystem

struct InvoiceCategoryCardList: View {
    @Environment(\.dynamicTypeSize)
    private var typeSize

    var items: [InvoiceItem]
    @Query private var customCategories: [CustomCategory]

    private var columns: [GridItem] {
        if typeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        }

        return [GridItem(.flexible()), GridItem(.flexible())]
    }

    private var categories: [InvoiceItemCategory] {
        InvoiceItemCategory.allCases + customCategories.map { category in
            InvoiceItemCategory.custom(
                name: category.name,
                emoji: category.emoji
            )
        }
    }

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(categories, id: \.hashValue) { category in
                    InvoiceCategoryCard(
                        category: category,
                        items: items
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ScrollView {
        InvoiceCategoryCardList(
            items: [
                InvoiceItem(
                    code: "1234",
                    name: "Cheese",
                    amount: 100,
                    category: .bakery,
                    measureUnit: .gram
                )
            ]
        )
    }
}
