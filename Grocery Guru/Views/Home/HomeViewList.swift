import SwiftUI
import SwiftData
import DesignSystem

struct HomeViewList: View {
    @Environment(\.navigationService)
    private var navigator
    @State private var viewModel: HomeViewModel

    @Query private var items: [InvoiceItem]

    var body: some View {
        SectionHeader("Welcome back!", font: .largeTitle) {
            SectionHeader("Categories") {
                InvoiceCategoryCardList(items: items)
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

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeViewList(
        viewModel: HomeViewModel(
            repository: LocalStorageRepository()
        )
    )
}
