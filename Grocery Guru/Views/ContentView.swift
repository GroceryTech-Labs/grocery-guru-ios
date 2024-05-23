import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var shouldShowAddSheet: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(ItemCategory.allCases) { category in
                    Section(category.title) {
                        ForEach(items.filter { $0.category.title == category.title } ) { item in
                            NavigationLink {
                                Text("You have \(item.amount, format: .number) of \(item.name) in your fridge")
                                    .navigationTitle(item.name)
                            } label: {
                                Text(item.name)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: toggleAddSheet) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $shouldShowAddSheet) {
                AddItemView(
                    isShown: $shouldShowAddSheet,
                    modelContext: modelContext
                )
            }
            .navigationTitle("Home")
        } detail: {
            Text("Select an item")
        }
    }

    private func toggleAddSheet() {
        shouldShowAddSheet.toggle()
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
