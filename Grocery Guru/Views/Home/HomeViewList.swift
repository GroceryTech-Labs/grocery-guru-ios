import SwiftUI
import SwiftData

struct HomeViewList: View {
    @Environment(\.navigationService)
    private var navigator
    @State private var viewModel: HomeViewModel
    @Query private var items: [InvoiceItem]

    var body: some View {
        SectionHeader("Welcome back!", font: .largeTitle) {
            SectionHeader("Categories") {
                InvoiceCategoryCardList(invoiceItems: items)
            } trailing: {
                Button {
                    navigator.sheet(NavigationDestination.addInvoice())
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .accessibilityLabel("Settings")
                }
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
            itemRepository: MockItemLocalStorageRepository.mockInstance,
            categoryRepository: CategoryLocalStorageRepository()
        )
    )
}
