import SwiftUI
import DesignSystem
import Categories

public struct InvoiceItemList: View {
    private let items: [UIInvoiceItem]

    public var body: some View {
        SectionHeader("Invoice Items") {
            Group {
                if items.isEmpty {
                    ErrorView(text: "No items found!")
                } else {
                    ScrollView {
                        LazyVStack(spacing: Constants.Padding.sizeM) {
                            ForEach(items) { item in
                                InvoiceItemListRow(item: item)
                            }
                        }
                        .padding(.horizontal, Constants.Padding.sizeX)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, Constants.Padding.sizeL)
    }

    public init(items: [UIInvoiceItem]) {
        self.items = items
    }
}

// swiftlint:disable all
#Preview {
    InvoiceItemList(items: [
        UIInvoiceItem(
            code: "1234",
            name: "Cheddar Cheese",
            amount: 1,
            category: UICategoryItem(.bakery),
            measureUnit: .item
        ),
        UIInvoiceItem(
            code: "1234",
            name: "asd sda",
            amount: 2,
            category: UICategoryItem(.fish),
            measureUnit: .item
        ),
        UIInvoiceItem(
            code: "1234",
            name: "asd sda",
            amount: 3,
            category: UICategoryItem(.milkEgg),
            measureUnit: .item
        )
    ])
}
// swiftlint:enable all
