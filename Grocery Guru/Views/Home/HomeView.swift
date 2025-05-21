import SwiftUI
import SwiftData
import DesignSystem

struct HomeView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var viewModel: HomeViewModel

    var body: some View {
        HomeViewList(viewModel: viewModel)
            .overlay(alignment: .bottom) {
                ShowAddInvoiceButton {
                    navigator.push(.addInvoice())
                }
            }
    }

    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel()
    )
}
