import SwiftUI
import SwiftData

struct AddItemView: View {
    @Binding var isShown: Bool
    @State private var viewModel: AddItemViewModel

    var body: some View {
        Form {
            // Header
            Text("Add Item")
                .font(.largeTitle)
                .listRowBackground(Color.clear)

            // Name Input
            Section {
                TextField(
                    "Name",
                    text: $viewModel.name,
                    prompt: Text("e.g. Tomato")
                )

                if let error = viewModel.error, case .emptyInput = error {
                    Text(error.localizedDescription)
                        .foregroundStyle(.red)
                        .listRowBackground(Color.clear)
                }
            } header: {
                Text("*Fill in the name of the item")
            }
            .onChange(of: viewModel.name) {
                viewModel.error = nil
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
                    ForEach(ItemCategory.allCases) { category in
                        Text(category.title)
                            .tag(category)
                    }
                }
            } header: {
                Text("Select the category of the item")
            }

            // Submit Button
            Button {
                viewModel.addItem(toggleSheet: $isShown)
            } label: {
                Label("Add Item", systemImage: "plus")
            }
        }
        .animation(.bouncy, value: viewModel.error)
    }

    init(isShown: Binding<Bool>, modelContext: ModelContext)  {
        self._isShown = isShown
        let viewModel = AddItemViewModel(modelContext: modelContext)
        self._viewModel = State(initialValue: viewModel)
    }
}
