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
                .fullScreenCover(isPresented: $viewModel.shouldShowDocScan) {
                    ScannerView { scanStrings in
                        viewModel.addItemsFromScanStrings(scanStrings)
                    }
                    .ignoresSafeArea(.all)
                }
            //                .sheet(isPresented: $viewModel.shouldShowAddSheet) {
            //                    AddInvoiceItemView(
            //                        isShown: $viewModel.shouldShowAddSheet,
            //                        itemRepository: viewModel.repository
            //                    ) {
            //                        viewModel.fetchItems()
            //                    }
        }
        .task {
            viewModel.fetchItems()
        }
    }
}

extension HomeView {
    private struct HomeViewList: View {
        @State var viewModel: HomeViewModel

        var body: some View {
            ScrollView {
                VStack(spacing: Constants.Padding.L) {
                    SectionHeader("Welcome back!", font: .largeTitle)

                    VStack(spacing: Constants.Padding.S) {
                        SectionHeader("Last shopping trips")

                        HStack {
                            ForEach(23..<28) { num in
                                Circle()
                                    .overlay {
                                        Text(num, format: .number)
                                            .foregroundStyle(.white)
                                    }
                            }
                        }

//                        ShoppingTripList([.init(date: .now, items: MockItemRepository.preview.items)])
                    }

                    VStack(spacing: Constants.Padding.S) {
                        SectionHeader("Categories")

                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            spacing: Constants.Padding.M
                        ) {
                            ForEach(InvoiceItemCategory.allCases) { category in
                                InvoiceCategoryCard(
                                    category: category,
                                    items: viewModel.items
                                )
                            }
                        }
                    }
                }
                .foregroundStyle(Color.labelPrimary)
                .padding(Constants.Padding.L)
            }
            .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
            .scrollIndicators(.hidden)
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
