import SwiftUI

struct InvoiceCategoryCard: View {
    private let category: InvoiceItemCategory
    private let items: [InvoiceItem]

    private var itemsCount: Int {
        items.filter { $0.category == category }.count
    }

    init(category: InvoiceItemCategory, items: [InvoiceItem]) {
        self.category = category
        self.items = items
    }

    var body: some View {
        VStack(spacing: Constants.Padding.M) {
            category.emoji.text
                .font(.system(size: 64))

            VStack(spacing: Constants.Padding.X) {
                Text(category.rawValue)
                Text("\(itemsCount, format: .number) Items")
                    .font(.caption)
            }
        }
        .foregroundStyle(.labelPrimary)
        .frame(maxWidth: .infinity)
        .padding(Constants.Padding.L)
        .background(Color.surfaceSecondary)
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 1, y: 1)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InvoiceCategoryCard(
        category: .milkEgg,
        items: MockItemRepository.preview.items
    )
}
