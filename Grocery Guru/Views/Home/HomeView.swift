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
                    ScannerView { strings in
                        viewModel.addItemsFromScanStrings(strings)
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
            List {
                ForEach(InvoiceItemCategory.allCases) { category in
                    Section(category.title) {
                        ForEach(viewModel.items.filter { $0.category.title == category.title } ) { item in
                            NavigationLink {
                                Text("You have \(item.amount, format: .number) of \(item.name) in your fridge")
                                    .navigationTitle(item.name)
                            } label: {
                                Text(item.name)
                            }
                        }
                        .onDelete { offsets in
                            viewModel.deleteItem(offsets: offsets)
                        }
                    }
                }
            }
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
