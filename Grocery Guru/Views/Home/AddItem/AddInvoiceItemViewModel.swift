import SwiftUI
import SwiftData

@Observable
class AddInvoiceItemViewModel {
    let itemRepository: InvoiceItemRepository

    var name: String = ""
    var amount: Int = 1
    var category: InvoiceItemCategory = .fruits

    init(itemRepository: InvoiceItemRepository) {
        self.itemRepository = itemRepository
    }

    func addItem(toggleSheet: Binding<Bool>) {
        let newItem = InvoiceItem(
            name: name,
            amount: amount,
            category: category
        )
        itemRepository.addItem(newItem)
        toggleSheet.wrappedValue.toggle()
    }
}
