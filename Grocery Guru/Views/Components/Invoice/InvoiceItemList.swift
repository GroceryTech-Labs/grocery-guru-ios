import SwiftUI
import DesignSystem

struct InvoiceItemList: View {
    private let items: [InvoiceItem]

    var body: some View {
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

    init(items: [InvoiceItem]) {
        self.items = items
    }
}

// swiftlint:disable all
#Preview {
    InvoiceItemList(items: [
        InvoiceItem(
            name: "Cheddar Cheese",
            amount: 1,
            category: .milkEgg,
            measureUnit: .item
        ),
        InvoiceItem(
            name: "asd sda",
            amount: 2,
            category: .milkEgg,
            measureUnit: .item
        ),
        InvoiceItem(
            name: "asd sda",
            amount: 3,
            category: .milkEgg,
            measureUnit: .item
        )
    ])
}
// swiftlint:enable all
