import SwiftUI
import SwiftData

struct AddInvoiceItemView: View {
    @Binding var isShown: Bool
    @State private var viewModel: AddInvoiceItemViewModel
    
    let onAdd: () -> ()

    var body: some View {
        Form {
            // Header
            Text("Add Item")
                .font(.largeTitle)
                .listRowBackground(Color.clear)
            
            // Name Input
            Section {
                VStack {
                    TextField(
                        "Name",
                        text: $viewModel.name,
                        prompt: Text("e.g. Tomato")
                    )
                }
            } header: {
                Text("Fill in the name of the item")
            }

            // Amount Control
            Section {
                Stepper(value: $viewModel.amount, in: 1...1000) {
                    Text("Amount")
                }
                Text(viewModel.amount, format: .number)
            } header: {
                Text("Select the amount of the item")
            }

            // Category Selection
            Section {
                Picker("Category", selection: $viewModel.category) {
                    ForEach(InvoiceItemCategory.allCases) { category in
                        Text(category.rawValue)
                            .tag(category.rawValue)
                    }
                }
            } header: {
                Text("Select the category of the item")
            }

            // Submit Button
            Button {
                viewModel.addItem(toggleSheet: $isShown)
                onAdd()
            } label: {
                Label("Add to inventory", systemImage: "shippingbox")
            }
        }
        .formStyle(.grouped)
    }

    init(isShown: Binding<Bool>, itemRepository: InvoiceItemRepository, onAdd: @escaping () -> ())  {
        self._isShown = isShown
        let viewModel = AddInvoiceItemViewModel(itemRepository: itemRepository)
        self._viewModel = State(initialValue: viewModel)
        self.onAdd = onAdd
    }
}
