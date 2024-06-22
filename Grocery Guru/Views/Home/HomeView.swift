import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var viewModel: HomeViewModel

    var body: some View {
        HomeViewList(viewModel: viewModel)
            .overlay(alignment: .bottom) {
                ShowAddInvoiceButton()
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
