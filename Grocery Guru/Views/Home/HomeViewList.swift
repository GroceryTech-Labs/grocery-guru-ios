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
        SectionHeader(String(localized: "Welcome back!", bundle: .main), font: .largeTitle) {
            SectionHeader(String(localized: "Categories", bundle: .main)) {
                CategoryCardList(
                    viewModel: CategoryCardListViewModel(
                        repository: CategoryRepositoryImpl()
                    )
                )
            } trailing: {
                Button {
                    navigator.push(.categorySettings(categoryId: UUID()))
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .accessibilityLabel(String(localized: "Settings", bundle: .main))
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
