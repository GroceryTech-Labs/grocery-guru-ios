import SwiftUI
import SwiftData

struct HomeViewList: View {
    @State var viewModel: HomeViewModel
    @Query private var items: [InvoiceItem]

    var body: some View {
        VStack(spacing: Constants.Padding.sizeM) {
            SectionHeader(
                "Welcome back!",
                font: .largeTitle
            )

            VStack(spacing: Constants.Padding.sizeS) {
                SectionHeader("Categories")
                InvoiceCategoryCardList(invoiceItems: items)
            }
        }
        .padding(.horizontal, Constants.Padding.sizeM)
    }
}

#Preview {
    HomeViewList(
        viewModel: HomeViewModel(
            repository: MockLocalStorageItemRepository.mockInstance
        )
    )
}
