import SwiftUI

struct HomeViewList: View {
    @State var viewModel: HomeViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: Constants.Padding.L) {
                SectionHeader(
                    "Welcome back!",
                    font: .largeTitle
                )

                VStack(spacing: Constants.Padding.S) {
                    SectionHeader("Categories")
                    InvoiceCategoryList(invoiceItems: viewModel.items)
                }
            }
            .foregroundStyle(.labelPrimary)
            .padding(Constants.Padding.L)
        }
        .background(
            Color.surfacePrimary,
            ignoresSafeAreaEdges: .all
        )
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeViewList(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
