import SwiftUI
import SwiftData

struct HomeViewList: View {
    @State var viewModel: HomeViewModel
    @Query private var items: [InvoiceItem]

    var body: some View {
        ScrollView {
            VStack(spacing: Constants.Padding.sizeL) {
                SectionHeader(
                    "Welcome back!",
                    font: .largeTitle
                )

                VStack(spacing: Constants.Padding.sizeS) {
                    SectionHeader("Categories")
                    InvoiceCategoryList(invoiceItems: items)
                }
            }
            .foregroundStyle(.labelPrimary)
            .padding(Constants.Padding.sizeL)
        }
        .background(
            Color.surfacePrimary,
            ignoresSafeAreaEdges: .all
        )
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeViewList(
        viewModel: HomeViewModel(
            repository: MockLocalStorageItemRepository()
        )
    )
}
