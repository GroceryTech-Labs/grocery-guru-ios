import SwiftUI

struct InvoiceItemList: View {
    private let items: [InvoiceItem]

    var body: some View {
        VStack {
            if items.isEmpty {
                ErrorView(text: "No items found!")
            } else {
                LazyVStack(spacing: Constants.Padding.sizeM) {
                    SectionHeader("Invoice Items")
                    ScrollView {
                        ForEach(items, id: \.id) { item in
                            InvoiceItemListRow(item: item)
                        }
                    }
                }
            }
        }
        .foregroundStyle(.labelPrimary)
        .padding(Constants.Padding.sizeL)
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
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
            category: .milkEgg
        ),
        InvoiceItem(
            name: "asd sda",
            amount: 2,
            category: .milkEgg
        ),
        InvoiceItem(
            name: "asd sda",
            amount: 3,
            category: .milkEgg
        )
    ])
}
// swiftlint:enable all
