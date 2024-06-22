import SwiftUI

struct InvoiceCategoryCardList: View {
    @Environment(\.dynamicTypeSize)
    private var typeSize

    private let invoiceItems: [InvoiceItem]

    private let categoryRepository: LocalStorageCategoryRepository

    private var columns: [GridItem] {
        if typeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        }

        return [GridItem(.flexible()), GridItem(.flexible())]
    }

    @State private var categories: [InvoiceItemCategory] = InvoiceItemCategory.allCases

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(InvoiceItemCategory.allCases, id: \.hashValue) { category in
                    InvoiceCategoryCard(
                        category: category,
                        items: invoiceItems
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .task {
            do {
                let test = try await categoryRepository.fetchAllItems()
                let mapped = test.map { InvoiceItemCategory.custom(name: $0.name, emoji: $0.emoji) }
                categories.append(contentsOf: mapped)
            } catch {
                print(error)
            }
        }
    }

    @MainActor
    init(invoiceItems: [InvoiceItem]) {
        self.invoiceItems = invoiceItems
        self.categoryRepository = .shared
    }
}

#Preview {
    ScrollView {
        InvoiceCategoryCardList(
            invoiceItems: []
        )
    }
}
