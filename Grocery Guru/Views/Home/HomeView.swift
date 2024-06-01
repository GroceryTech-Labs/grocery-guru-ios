import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationSplitView {
            HomeViewList(viewModel: viewModel)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: viewModel.toggleDocScan) {
                            Label("Scan", systemImage: "doc.viewfinder")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: viewModel.toggleAddSheet) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .fullScreenCover(isPresented: $viewModel.shouldShowDocScan) {
                    ScannerView { scanStrings in
                        viewModel.addItemsFromScanStrings(scanStrings)
                    }
                    .ignoresSafeArea(.all)
                }
                .sheet(isPresented: $viewModel.shouldShowAddSheet) {
                    AddInvoiceItemView(
                        isShown: $viewModel.shouldShowAddSheet,
                        itemRepository: viewModel.repository
                    ) {
                        viewModel.fetchItems()
                    }
                }
                .navigationTitle("Home")
        } detail: {
            Text("Select an item")
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
                .padding(Constants.Padding.L)
            }
            .background(Color(.primary), ignoresSafeAreaEdges: .all)
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
