import SwiftUI
import SwiftData

struct HomeView: View {
    @State var viewModel: HomeViewModel
    @Environment(\.navigationService)
    private var navigator

    var body: some View {
        HomeViewList(viewModel: viewModel)
            .overlay(alignment: .bottom) {
                AddInvoiceButton {
                    navigator.sheet(.addInvoice())
                }
            }
            .modelContext(viewModel.repository.modelContext)
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(repository: LocalStorageItemRepository.shared)
    )
}
