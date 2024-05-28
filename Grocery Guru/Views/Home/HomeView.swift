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
                        viewModel.shouldShowDocScan = false
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
        @State var scannedItems: [ScannedString]
        
        var body: some View {
            NavigationView {
                List(selection: $viewModel.selectedScannedItems) {
                    Section {
                        ForEach(scannedItems, id: \.id) { item in
                            Text(item.value)
                                .tag(item)
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
                    ToolbarItem(placement: .topBarLeading) {
                        Button(role: .destructive) {
                            viewModel.scannedItems = nil
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                        }
                        .tint(.red)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    if !viewModel.selectedScannedItems.isEmpty {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                removeSelectedScannedItems()
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }
                .navigationTitle("Scanned Invoices")
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
        
        @MainActor
        func removeSelectedScannedItems() {
            for selection in viewModel.selectedScannedItems {
                guard let index = scannedItems.firstIndex(of: selection) else {
                    return
                }
                scannedItems.remove(at: index)
            }
            
            // 
            viewModel.selectedScannedItems = Set()
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
