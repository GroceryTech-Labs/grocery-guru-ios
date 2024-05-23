import SwiftUI
import SwiftData

@Observable
class AddItemViewModel {
    enum AddError: Error, LocalizedError {
        case emptyInput

        var failureReason: String? {
            switch self {
            case .emptyInput:
                "Field marked with '*' is empty."
            }
        }
    }

    var modelContext: ModelContext

    var name: String = ""
    var amount: Int = 1
    var category: ItemCategory = .fruits

    var error: AddError? = nil

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func addItem(toggleSheet: Binding<Bool>) {
        guard !name.isEmpty else {
            error = .emptyInput
            return
        }

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
