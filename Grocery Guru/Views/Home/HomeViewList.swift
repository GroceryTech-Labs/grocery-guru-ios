import SwiftUI
import SwiftData
import DesignSystem
import Categories

struct HomeViewList: View {
    @Environment(\.navigationService)
    private var navigator
    @State private var viewModel: HomeViewModel

    var body: some View {
        SectionHeader("Welcome back!", font: .largeTitle) {
            SectionHeader("Categories") {
                CategoryCardList()
            } trailing: {
                Button {
                    navigator.sheet(.categorySettings)
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
