import SwiftUI

struct InvoiceCategoryCard: View {
    let category: InvoiceItemCategory
    let items: [InvoiceItem]

    var body: some View {
        VStack(spacing: Constants.Padding.M) {
            category.emoji.text
                .font(.system(size: 64))

            VStack(spacing: Constants.Padding.X) {
                Text(category.title)
                Text("\(items.filter { $0.category == category }.count) items")
                    .font(.caption)
            }
        }
        .foregroundStyle(Color(.labelPrimary))
        .frame(maxWidth: .infinity)
        .padding(Constants.Padding.L)
        .background(Color(.secondary))
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 1, y: 1)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InvoiceCategoryCard(category: .milkEgg, items: MockItemRepository.preview.items)
}
