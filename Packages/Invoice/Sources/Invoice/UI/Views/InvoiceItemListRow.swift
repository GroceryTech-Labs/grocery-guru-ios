import SwiftUI
import DesignSystem
import Categories

struct InvoiceItemListRow: View {
    private let item: UIInvoiceItem

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

    init(item: UIInvoiceItem) {
        self.item = item
    }
}

// swiftlint:disable all
#Preview {
    InvoiceItemListRow(
        item: UIInvoiceItem(
            code: "1234",
            name: "Cheese",
            amount: 200,
            category: UICategoryItem(.bakery),
            measureUnit: .item
        )
    )
}
// swiftlint:enable all
