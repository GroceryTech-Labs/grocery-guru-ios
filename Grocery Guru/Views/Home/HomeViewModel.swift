import SwiftUI

@Observable
class HomeViewModel {
    let repository: InvoiceItemRepository
    
    var items: [InvoiceItem] = []
    
    var scannedItems: [ScannedString]? = nil
    var selectedScannedItems: Set<ScannedString> = Set()
    
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
    func addItemsFromScanStrings(_ strings: [ScannedString]?) {
        guard let strings else {
            scannedItems = nil
            return
        }
        
        for scannedString in strings {
            addScannedItem(
                InvoiceItem(
                    name: scannedString.value,
                    amount: 1,
                    category: .fruits
                )
            )
        }
        
        scannedItems = nil
    }
}
