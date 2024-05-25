import SwiftUI
import SwiftData

@Observable
class HomeViewModel {
    let repository: ItemRepository
    var items: [Item] = []
    
    var shouldShowDocScan: Bool = false
    
    init(repository: ItemRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchItems() {
        items = repository.fetchAllItems()
    }
    
    @MainActor
    func deleteItem(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                repository.deleteItem(items[index])
            }
        }
        
        fetchItems()
    }
    
    func toggleDocScan() {
        shouldShowDocScan.toggle()
    }
}

struct HomeView: View {
    @State private var shouldShowAddSheet: Bool = false
    @State private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(ItemCategory.allCases) { category in
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
                    Button(action: toggleAddSheet) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.shouldShowDocScan) {
                ScannerView { strings in
                    guard let strings else {
                        viewModel.toggleDocScan()
                        return
                    }
                    for string in strings {
                        viewModel.items.append(
                            Item(
                                name: string,
                                amount: 1,
                                category: .fruits
                            )
                        )
                    }
                    viewModel.toggleDocScan()
                }
                
            }
            .sheet(isPresented: $shouldShowAddSheet) {
                AddItemView(
                    isShown: $shouldShowAddSheet,
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

    private func toggleAddSheet() {
        shouldShowAddSheet.toggle()
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
