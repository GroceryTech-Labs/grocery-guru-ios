import SwiftUI
import SwiftData

struct InvoiceItemListRow: View {
    private let item: InvoiceItem

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                Text(item.name)
                Text(verbatim: "\(item.amount)") +
                Text(verbatim: " ") +
                Text(item.measureUnit.localized)
            }
            .foregroundStyle(.labelSecondary)
            .font(.caption)

            Spacer()

            Image(systemName: "chevron.right")
                .accessibilityLabel("Open Invoice Item")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Constants.Padding.sizeL)
        .foregroundStyle(.labelPrimary)
        .background(Color.surfaceSecondary)
        .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
        .shadow(radius: 1, y: 1)
        .accessibilityElement()
        .accessibilityIdentifier(AccessibilityIdentifier.ListElement.invoiceItem)
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
            category: .milkEgg,
            measureUnit: .whole
        )
    )
}
// swiftlint:enable all
