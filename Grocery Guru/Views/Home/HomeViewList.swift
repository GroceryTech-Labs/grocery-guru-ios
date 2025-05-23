import SwiftUI
import SwiftData
import DesignSystem
import Categories
import LocalStorage

struct HomeViewList: View {
    @Environment(\.navigationService)
    private var navigator
    @State private var viewModel: HomeViewModel

    var body: some View {
        SectionHeader("Welcome back!", font: .largeTitle) {
            SectionHeader("Categories") {
                CategoryCardList(
                    viewModel: CategoryCardListViewModel(
                        repository: CategoryRepositoryImpl()
                    )
                )
            } trailing: {
                Button {
                    navigator.push(.categorySettings)
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .accessibilityLabel("Settings")
                }
            }
        }
        .padding(.horizontal, Constants.Padding.sizeL)
    }

    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeViewList()
}
