import SwiftUI

struct InvoiceCategoryCard: View {
    private let category: InvoiceItemCategory
    private let items: [InvoiceItem]
    private let emojiSize: CGFloat = 64

    private var itemsCount: Int {
        items.filter { $0.category == category }.count
    }

    var body: some View {
        VStack(spacing: Constants.Padding.sizeM) {
            category.emoji.text
                .font(.system(size: emojiSize))

            VStack(spacing: Constants.Padding.sizeX) {
                Text(category.rawValue)
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
    }

    init(category: InvoiceItemCategory, items: [InvoiceItem]) {
        self.category = category
        self.items = items
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InvoiceCategoryCard(
        category: .milkEgg,
        items: MockItemRepository.preview.items
    )
}
