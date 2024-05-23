import SwiftUI
import SwiftData

@Observable
class AddItemViewModel {
    let itemRepository: ItemRepository
     
    var name: String = ""
    var amount: Int = 1
    var category: ItemCategory = .fruits
    
    init(itemRepository: ItemRepository) {
        self.itemRepository = itemRepository
    }

    func addItem(toggleSheet: Binding<Bool>) {
        let newItem = Item(
            name: name,
            amount: amount,
            category: category
        )
        itemRepository.addItem(newItem)
        return toggleSheet.wrappedValue.toggle()
    }
}
