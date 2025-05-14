import SwiftUI

struct InvoiceCategoryCard: View {
    @Environment(\.navigationService)
    private var navigator

    private let category: InvoiceItemCategory
    private let items: [InvoiceItem]
    private let emojiSize: CGFloat = 64

    private var filteredItems: [InvoiceItem] {
        items.filter { $0.category == category }
    }

    private var itemsCount: Int {
        filteredItems.count
    }

    var body: some View {
        ResponsiveCard {
            VStack(spacing: Constants.Padding.sizeM) {
                category.emoji.text
                    .font(.system(size: emojiSize))

                VStack(spacing: Constants.Padding.sizeX) {
                    Text(category.localized)

                    Text("\(itemsCount, format: .number) Items")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .onTapGesture {
            navigator.push(.invoiceList(items: filteredItems))
        }
        .accessibilityAddTraits(.isButton)
        .accessibilityElement()
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceCategory)
        .accessibilityLabel("Category Card")
    }

    init(category: InvoiceItemCategory, items: [InvoiceItem]) {
        self.category = category
        self.items = items
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InvoiceCategoryCard(
        category: .milkEgg,
        items: []
    )
    .padding()
}
