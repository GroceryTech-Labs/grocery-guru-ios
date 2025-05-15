import SwiftUI
import SwiftData
import DesignSystem

struct InvoiceItemListRow: View {
    private let item: InvoiceItem

    var body: some View {
        ResponsiveCard {
            HStack {
                VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                    Text(item.name)

                    Group {
                        Text(verbatim: "\(item.amount)") +
                        Text(verbatim: " ") +
                        Text(item.measureUnit.localized)
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .accessibilityLabel("Open Invoice Item")
            }
        }
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
            measureUnit: .item
        )
    )
}
// swiftlint:enable all
