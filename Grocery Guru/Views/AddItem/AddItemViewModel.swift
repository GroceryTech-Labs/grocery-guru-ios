import SwiftUI
import SwiftData

@Observable
class AddItemViewModel {
    var modelContext: ModelContext

    var name: String = ""
    var amount: Int = 1
    var category: ItemCategory = .fruits

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func addItem(toggleSheet: Binding<Bool>) {
        withAnimation {
            let newItem = Item(
                name: name,
                amount: amount,
                category: category
            )
            modelContext.insert(newItem)
            return toggleSheet.wrappedValue.toggle()
        }
    }
}
