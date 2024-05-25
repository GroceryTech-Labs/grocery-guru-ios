import SwiftUI

@Observable
class HomeViewModel {
    let repository: InvoiceItemRepository
    
    var items: [InvoiceItem] = []
    var scannedItems: [String]? = nil
    
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
            fetchItems()
        }
    }
    
    @MainActor
    func addScannedItem(_ item: InvoiceItem) {
        withAnimation {
            repository.addItem(item)
            fetchItems()
        }
    }
    
    func toggleDocScan() {
        shouldShowDocScan.toggle()
    }
    
    func toggleAddSheet() {
        shouldShowAddSheet.toggle()
    }
    
    @MainActor
    func addItemsFromScanStrings(_ strings: [String]?) {
        guard let strings else {
            scannedItems = nil
            shouldShowDocScan = false
            return
        }
        
        for string in strings {
            addScannedItem(
                InvoiceItem(
                    name: string,
                    amount: 1,
                    category: .fruits
                )
            )
        }
        
        scannedItems = nil
        shouldShowDocScan = false
    }
}
