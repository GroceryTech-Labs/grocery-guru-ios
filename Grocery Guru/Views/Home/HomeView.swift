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
                .sheet(item: $viewModel.scannedItems) { scannedItems in
                    ScannedItemsList(
                        viewModel: viewModel,
                        scannedItems: scannedItems
                    )
                }
                .fullScreenCover(isPresented: $viewModel.shouldShowDocScan) {
                    ScannerView { scanStrings in
                        viewModel.scannedItems = scanStrings
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
    
    private struct ScannedItemsList: View {
        @State var viewModel: HomeViewModel
        @State var scannedItems: [String]
        
        var body: some View {
            NavigationView {
                List {
                    Section {
                        ForEach(scannedItems, id: \.self) { item in
                            Text(item)
                        }
                        .onDelete(perform: deleteScannedItem)
                    }
                    
                    HStack {
                        Spacer()
                        Button("Add invoice") {
                            viewModel.addItemsFromScanStrings(scannedItems)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .listRowBackground(Color.clear)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(role: .destructive) {
                            viewModel.scannedItems = nil
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                        }
                        .tint(.red)
                    }
                }
            }
        }
        
        @MainActor
        func deleteScannedItem(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    scannedItems.remove(at: index)
                }
            }
        }
    }
}

extension Array<String>: Identifiable {
    public var id: UUID { UUID() }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
