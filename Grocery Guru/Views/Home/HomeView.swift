import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            HomeViewList(viewModel: viewModel)
                .overlay(alignment: .bottom) {
                    ScannerButton { }
                }
        }
        .task {
            await viewModel.fetchItems()
        }
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
