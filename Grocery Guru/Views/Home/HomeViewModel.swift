import SwiftUI

@Observable
class HomeViewModel {
    let repository: InvoiceItemRepository
    var items: [InvoiceItem] = []
    
    var shouldShowDocScan: Bool = false
    var shouldShowAddSheet: Bool = false
    
    init(repository: InvoiceItemRepository) {
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
    
    func toggleAddSheet() {
        shouldShowAddSheet.toggle()
    }
    
    func addItemsFromScanStrings(_ strings: [String]?) {
        guard let strings else {
            shouldShowDocScan = false
            return
        }
        
        for string in strings {
            items.append(
                InvoiceItem(
                    name: string,
                    amount: 1,
                    category: .fruits
                )
            )
        }
        toggleDocScan()
    }
}
