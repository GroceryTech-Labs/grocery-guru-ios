import SwiftUI

struct InvoiceItemList: View {
    private let items: [InvoiceItem]

    var body: some View {
        VStack(spacing: Constants.Padding.sizeM) {
            SectionHeader("Invoice Items")
            if items.isEmpty {
                ErrorView(text: "No items found!")
            } else {
                ScrollView {
                    LazyVStack(spacing: Constants.Padding.sizeS) {
                        ForEach(items) { item in
                            InvoiceItemListRow(item: item)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
