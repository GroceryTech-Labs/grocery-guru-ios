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
        VStack(spacing: Constants.Padding.sizeM) {
            category.emoji.text
                .font(.system(size: emojiSize))

            VStack(spacing: Constants.Padding.sizeX) {
                Text(category.localized)
                Text("\(itemsCount, format: .number) Items")
                    .font(.caption)
            }
        }
        .foregroundStyle(.labelPrimary)
        .frame(maxWidth: .infinity)
        .padding(Constants.Padding.sizeL)
        .background(Color.surfaceSecondary)
        .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
        .shadow(radius: 1, y: 1)
        .onTapGesture {
            navigator.push(.invoiceList(items: filteredItems))
        }
        .accessibilityAddTraits(.isButton)
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
}
