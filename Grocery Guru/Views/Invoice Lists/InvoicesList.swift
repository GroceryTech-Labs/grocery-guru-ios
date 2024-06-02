import SwiftUI

struct InvoicesList: View {
    private let items: [InvoiceItem]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.id) { item in
                    VStack {
                        Text(item.name)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .foregroundStyle(.labelPrimary)
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
    }

    init(items: [InvoiceItem]) {
        self.items = items
    }
}

#Preview {
    InvoicesList(items: MockItemRepository.preview.items)
}
