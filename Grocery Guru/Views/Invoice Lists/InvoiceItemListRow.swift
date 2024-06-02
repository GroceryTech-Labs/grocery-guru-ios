import SwiftUI

struct InvoiceItemListRow: View {
    private let item: InvoiceItem

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                Text(item.name)
                Text("\(item.amount, format: .number) g")
                    .font(.caption)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .accessibilityLabel("Open Invoice Item")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Constants.Padding.sizeL)
        .background(Color.surfaceSecondary)
        .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
        .shadow(radius: 1, y: 1)
    }

    init(item: InvoiceItem) {
        self.item = item
    }
}

// swiftlint:disable all
#Preview {
    InvoiceItemListRow(
        item: InvoiceItem(
            name: "Cheese",
            amount: 200,
            category: .milkEgg
        )
    )
}
// swiftlint:enable all
