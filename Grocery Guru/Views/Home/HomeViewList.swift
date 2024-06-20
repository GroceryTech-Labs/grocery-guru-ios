import SwiftUI
import SwiftData

struct HomeViewList: View {
    @State private var viewModel: HomeViewModel
    @Query private var items: [InvoiceItem]

    var body: some View {
        SectionHeader("Welcome back!", font: .largeTitle) {
            SectionHeader("Categories") {
                InvoiceCategoryCardList(invoiceItems: items)
            }
        }
        .padding(.horizontal, Constants.Padding.sizeM)
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeViewList(
        viewModel: HomeViewModel(
            repository: MockLocalStorageItemRepository.mockInstance
        )
    )
}
