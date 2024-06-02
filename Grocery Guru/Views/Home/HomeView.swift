import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            HomeViewList(viewModel: viewModel)
                .overlay(alignment: .bottom) {
                    ScannerButton {
                        
                    }
                }
        }
        .task {
            viewModel.fetchItems()
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
