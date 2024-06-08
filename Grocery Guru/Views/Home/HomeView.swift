import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    @Environment(\.navigationService)
    private var navigator

    var body: some View {
        HomeViewList(viewModel: viewModel)
            .overlay(alignment: .bottom) {
                AddInvoiceButton {
                    navigator.push(.addInvoice())
                }
            }
            .modelContext(viewModel.repository.modelContext)
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(repository: LocalStorageItemRepository.shared)
    )
}
